##Project Structure:

When referring to our project structure, we will not get into the decision making required about the final data model, i.e. Kimball vs Data Vault, etc. That is a decision that needs to be made during discussions with the client so that it can better fit their needs and their specific use case. 

Instead, this section will cover how to organize the dbt project itself. What kind of models to create, where to apply the business logic, how to break out the transformations, and other similar things. A lot of this is derived from the current structure recommended by Fishtown Analytics, as well as community recognized best practices. It is also a living document – subject to change based on releases of new features or discoveries by users that would increase performance or comprehension. 

These guidelines are influenced by the assumption that the client is using a data warehouse that is optimized for analytical queries, as well as the possibility that multiple data sources are being loaded by third party tools and not internally developed solutions. For situations where data is being loaded manually or by a homegrown tool that doesn’t neatly account for CDC, see the “snapshot layer” section. 

Data Transformations:
The data in any project has three distinct checkpoints:
1. **Sources**: Schemas and tables in a source-conformed structure. This means that tables and columns are in a structure based on what the API or source returns. Frequently loaded with a third-party tool. These need to be identified in the sources.yml file in the model’s directory.
    - **Snapshot Models**: If a third-party tool like FiveTran or Stitch is not being used and the client is interested in retaining history of the data beyond a static representation of the source, it is recommended that you create a snapshot layer that exists before the staging models. This would use the ‘snapshot’ materialization and it auto-creates a table that uses Type 2 SCD logic to retain row history. This would then be used as the “source” by the staging models. At its simplest form, we use this for mutable data, as opposed to immutable data.
2.	**Staging Models**: this is the atomic unit of data modeling. Each model bears a one-to-one relationship with the source data table it represents. This means that it has the same granularity (no aggregations have been performed), but the columns may have been renamed, recast, or reconsidered into a consistent and useful format. 
3.	**(Optional) Warehouse Models**: Warehouse models can be used if the modelers want to create a warehouse layer where the data is stored in a Kimball or Data Vault style. The reasoning for this revolves around access and the flexibility of marts – if all the data is stored in a consistent and standard warehouse layer, it is easier to make changes to the mart models. They won’t be as dependent on atomic staging models and will instead rely on standardized warehouse models.
4.	**Mart Models**: Mart models are models that represent business processes and entities. They’ve abstracted the data from the sources that they are based on.
    - It is important to note the difference between the staging and mart checkpoints. Sources, snapshot, and staging are all source-centric models, whereas mart models are business-centric.

You may be wondering – why aren’t we performing all of our business logic in the staging models like we do in our ETL training? It’s a good question. First, we do this to take advantage of one of the key features of dbt, reducing complexity. Being able to establish relationships between models using jinja allows us to decrease the complexity contained within a single model, which increases the understandability of our solution. Second, it allows us to further ensure data validity. We can perform tests on our staging models to ensure that the data aligns with what we expect to see, especially before we aggregate it for analysis. 

**Snapshot Models**:
Snapshot models are particularly helpful when you are dealing with a mutable source data tables. These are tables where records are updated in-place over time, like an orders table where the status of the order changes. This is opposed to immutable tables, where a record is never updated again after it is created. 

Mutable sources, while great in the mind of the application developer, are difficult to work with as an analyst. We generally prefer to retain historical changes and account for them in business logic.

Instead of building a history table, or custom designing a snapshot process, we can use the snapshot materialization within dbt to accomplish the same purpose. This will allow us to retain all of the historical data while only persisting the active data forward into the data warehouse. Whenever a source table is mutable, we recommend using a snapshot. 

If using Snowflake, we recommend using the following lines within your project yml file. This will ensure that the tables aren’t stored as transient, which will give you up to 90 days of time travel if you are in the enterprise edition. While this isn’t needed (CDC should capture fluctuating values) it is helpful just in case something happens.
