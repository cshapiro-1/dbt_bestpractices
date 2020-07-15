## What is this training?
This is a training intended on getting A8 consultants up to speed on using dbt_ on any potential client engagements. We will use the AdventureWorks training data set that is also used in the SSIS training but will model it in a different way, for a few reasons. First, we will use a version of the Data Vault 2.0 as the modeling choice for our warehouse layer. This gives us the most flexibility for maintaining a scalable warehouse layer. It is a different way of modeling from what most are familiar with, however, so we will set up multiple check-ins to go over the data model. [Here is more information regarding Data Vault](). 

**At the end of this section, we will list out all the individuals who are able to serve as the administrator of the training. Please reach out to one of them at the beginning of the training and set up times for check-ins**. 

The second difference is that dbt_ is a completely different way of handling data transformation. One of the core underlying assumptions is that each run is **idempotent**, which means that the same transformations and results will always result no matter when the run is occuring. This is possible because of our raw layer where all data, and historical data, is stored - it means that we don't need to worry about update logic in our later models. Any new run will recreate the database objects with the updated underlying data. If we're looking to exclude inactive rows then we just build that logic into our model.

Following the example of the SSIS training, we will provide access to a repo that follows these same principles but with a different dataset (Sakila). [This example can be found here](https://github.com/cmccann020/dbt_sakila_datavault).

**Current Administrators**
 - Callum McCann

# Required Tools 
 - dbt_cloud (either 14 day free trial or free developer membership)
 - Github Account 
    - Blank Repo named analytics8_dbt_training_name
- Snowflake Access
    - Access to A8 Snowflake. If unavailable, contact Kevin Rogers.

# Steps for A8 dbt_ Training:
1. [Read the Required Reading](Required_Reading.md)
    - Pay special attention to the getting started section. This will be a great introduction to what the steps are. Do not follow along, however, as our training will use a different data set than the jaffle_shop dataset that Claire will be walking through.
    
2. Read over the [AdventureWorks and DataVault 2.0 - How To Model Your Chosen Schema]() section of the documentation. Select a Schema that you are going to be modeling.

 ### **Check-In - Discuss the schema you've chosen and how you plan on modeling it using Data Vault 2.0.**

3. Connect your dbt Cloud to Snowflake. Follow the [Connecting To Snowflake](Connecting_To_Snowflake.md) instructions.

4. In your dbt_cloud account, create a new project called 'testing_dbt'. When asked about a repo, connect to the blank repo identified in the required tools. This will activate the project and allow you to access the development IDE. Once you are in the development IDE, select 'Initialize Project', which will add the neccesary dbt_ files to your repo.

# Optional Steps
1. Read the optional [recommended documentation](Optional_Reading.md)
