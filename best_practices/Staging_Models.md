## Staging Models:
The goal of the staging layer is to create staging models, which take raw data and standardize it for further analysis. If anyone were to query the data warehouse or analyze the lineage graph, they will understand that a model with the stg_ prefix indicates that:

- Fields have been renamed and recast in a consistent way.
- Datatypes, such as time zones, are consistent.
- Light cleansing, removing unwanted characters or replacing empty strings with NULL values, has occurred.
- If useful or needed, flattening of JSON objects has occurred. 
- There is a primary key that is both unique and not null. This has been tested.
  - *Recommendation*: While most databases have a sequential id that is assigned as a business key for each row (actor_id = 1,2,etc.) this is not actually a helpful key because it doesn’t represent anything. Some individuals, such as the author of this documentation, believe it is better to create a business key that serves as the new primary key. It must be created from a column, or series of columns, that are always unique – this should be the subject of a dbt test! One method to do this is through the use of the surrogate_key macro in dbt_utils, which can be installed with the packages.yml file and running dbt deps.
  - Individuals may be asking – how can I track history if I’m not keeping the same primary key? You don’t need to because of the recommended use of snapshot models. 

Staging models can have joins in them if it is required to add additional columns for context or enrichment. Rows can be added through unions or removed through filters. This is all to represent that staging models need to follow the guidelines in the Data Transformation section but they do not need to be a static match of a single table.

As for how this needs to be laid out in the project structure, it is considered best practice to create a new directory per source within the staging directory in the model directory, such as shown below:

    └── models
        ├── marts
        ├── staging
        |   ├── source a
        |   ├── source b

Each staging directory needs to contain, at a minimum:
- One staging model for each object that is useful for analytics:
  - Named (stg_<source>_<object>). The source distinction is only needed if there are multiple sources.
  - The recommended materialization is a view unless performance requires a table.
- A src_<source>.yml file which contains:
  - Definitions, tests, and documentation around each model.
- A stg_<source>.yml file which contains:
  - Tests and documentation for models in the same directory.

