## Base Models:

Sometimes a source will contain rough data that requires significant cleaning, correcting, and categorizing before it can be used in a staging model. If this is the case, we recommend using base models. Effectively, this is a series of layer of models that are placed before the staging models that are used to rename and standardize the data into a format that can be used. Each model should follow the same standard of the “Model Design” section. 

These models should be stored in a nested ‘base’ subdirectory within the specific source directory inside of the staging directory. For example:

    └── models
        ├── marts
        ├── staging
        |   ├── marketo
            |   ├── base
                |   ├── model

We recommend that these models use the ephemeral materialization so that they are not exposed to any end users who may be querying the warehouse. We also recommend that they are testing in a base.yml file within the same directory, following the testing guidelines.
