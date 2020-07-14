## Warehouse Models:

Warehouse models should be used when the modelers want to integrate a Kimball or Data Vault style of data modeling before the creation of the Mart Models. This is recommended for especially complex data models, or situations where there needs to be a secondary ‘area of truth’ that analysts will have access to. Instead of deconstructing the mart models to answer their questions, they can see the overarching data model and derive their answers from their own SQL queries.

    └── models
        ├── marts
        ├── staging
        ├── warehouse

If using Data Vault, there exists an open source project called dbtvault. It has pre-defined macros and packages that will standardize the creation of hubs, links, and satellites. Given that it is open source, it is frequently changing, with added functionality and improved performance. Versions can be locked for production systems so that there aren’t dependency issues. The link is: https://dbtvault.readthedocs.io/en/latest/
