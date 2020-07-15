## What is this training?
This is a training intended on getting A8 consultants up to speed on using dbt_ on any potential client engagements. We will use the AdventureWorks training data set that is also used in the SSIS training but will model it in a different way, for a few reasons. First, we will use a version of the Data Vault 2.0 as the modeling choice for our warehouse layer.

# Required Tools 
 - dbt_cloud (either 14 day free trial or free developer membership)
 - Github Account 
    - Blank Repo named analytics8_dbt_training_name
- Snowflake Access
    - Access to A8 Snowflake. If unavailable, contact Kevin Rogers.

# Steps for A8 dbt_ Training:
1. [Read the Required Reading](Required_Reading.md)
    - Pay special attention to the getting started section. This will be a great introduction to what the steps are. Do not follow along, however, as our training will use a different data set than the jaffle_shop dataset that Claire will be walking through.
    
2. Connect your dbt Cloud to Snowflake. Follow the [Connecting To Snowflake](Connecting_To_Snowflake.md) instructions.

3. Confirm your access to the Snowflake DB 'AdventureWorks_DB'

4. In your dbt_cloud account, create a new project called 'testing_dbt'. When asked about a repo, connect to the blank repo identified in the required tools. This will activate the project and allow you to access the development IDE. Once you are in the development IDE, select 'Initialize Project', which will add the neccesary dbt_ files to your repo.

# Optional Steps
1. Read the optional [recommended documentation](Optional_Reading.md)
