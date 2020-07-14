When referring to our project structure, we will not get into the decision making required about the final data model, i.e. Kimball vs Data Vault, etc. That is a decision that needs to be made during discussions with the client so that it can better fit their needs and their specific use case.

Instead, this section will cover how to organize the dbt project itself. What kind of models to create, where to apply the business logic, how to break out the transformations, and other similar things. A lot of this is derived from the current structure recommended by Fishtown Analytics, as well as community recognized best practices. It is also a living document – subject to change based on releases of new features or discoveries by users that would increase performance or comprehension.

These guidelines are influenced by the assumption that the client is using a data warehouse that is optimized for analytical queries, as well as the possibility that multiple data sources are being loaded by third party tools and not internally developed solutions. For situations where data is being loaded manually or by a homegrown tool that doesn’t neatly account for CDC, see the “snapshot layer” section.

*Needs updates*: Warehouse_Models
