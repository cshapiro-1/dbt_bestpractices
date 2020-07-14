**Snapshot Models**:
Snapshot models are particularly helpful when you are dealing with a *mutable* source data tables. These are tables where records are updated in-place over time, like an orders table where the status of the order changes. This is opposed to immutable tables, where a record is never updated again after it is created. 

Mutable sources, while great in the mind of the application developer, are difficult to work with as an analyst. We generally prefer to retain historical changes and account for them in business logic.

Instead of building a history table, or custom designing a snapshot process, we can use the snapshot materialization within dbt to accomplish the same purpose. This will allow us to retain all of the historical data while only persisting the active data forward into the data warehouse. Whenever a source table is mutable, we recommend using a snapshot. 

If using Snowflake, we recommend using the following lines within your project yml file. This will ensure that the tables aren’t stored as transient, which will give you up to 90 days of time travel if you are in the enterprise edition. While this isn’t needed (CDC should capture fluctuating values) it is helpful just in case something happens.

    snapshots:
      project name:  
        transient: false

For more information, see the documentation: https://docs.getdbt.com/docs/building-a-dbt-project/snapshots/
