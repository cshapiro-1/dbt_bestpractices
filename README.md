## Project Structure:

This repo will serve as a centralized location for A8's best practices for dbt_.

When referring to our project structure, we will not get into the decision making required about the final data model, i.e. Kimball vs Data Vault, etc. That is a decision that needs to be made during discussions with the client so that it can better fit their needs and their specific use case. 

Instead, this section will cover how to organize the dbt project itself. What kind of models to create, where to apply the business logic, how to break out the transformations, and other similar things. A lot of this is derived from the current structure recommended by Fishtown Analytics, as well as community recognized best practices. It is also a living document – subject to change based on releases of new features or discoveries by users that would increase performance or comprehension. 

These guidelines are influenced by the assumption that the client is using a data warehouse that is optimized for analytical queries, as well as the possibility that multiple data sources are being loaded by third party tools and not internally developed solutions. For situations where data is being loaded manually or by a homegrown tool that doesn’t neatly account for CDC, see the “snapshot layer” section. 

There are folders within this repo that cover certain areas. They are as follows:

 - [Best Practices](best_practices): This will be the central hub for all best practices recommended by A8 in any dbt_ engagement. 
    - Project Structure
    - Model Design

 - [Training](training): This folder serves as the repository for all information on the internal A8 dbt_ training. It will include required tools, steps for training, when to check in with an instructor, and any other information related to training with dbt_.

 - [Macros](macros): This folder serves as the home to all macros that have been developed by A8 or posted in the community that we believe could be useful in projects. This does not include any macros found in the open source project dbtvault or the fishtown analytics repo dbt_utils.
