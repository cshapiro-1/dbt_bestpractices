## Connecting to Snowflake

When connecting to Snowflake within the dbt Cloud, there are two distinct steps.

1. Create your Snowflake Connection. This is the connection to the specific instance of Snowflake that you'll want to be working with - in our example it is the internal A8 version.
    - Account: This is the account information for our A8 Snowflake. If you do not have this information, please reach out to an approved instructor and ask for it,
    - Database: You can either create a new database or use an existing one. For this training, I recommend creating a new database named dbt_*yourname*_testing
    - Warehouse: Use the warehouse that you created in the Snowflake walkthrough for this training. If you were not part of the training, please reach out to Callum McCann to walk you through creating a Snowflake Virtual Warehouse. 
      - IMPORTANT: Ensure that your warehouse is set to an auto suspend of 1 minute. If it is not, please run this query: ALTER WAREHOUSE *warehouse_name* SET AUTO_SUSPEND = 60
    
![Image of Snowflake Connection](https://github.com/cmccann020/dbt_bestpractices/blob/master/images/InkedInkedSnowflake%20Connection_LI_Moment.jpg)

2. Add in your Development Credentials for your Snowflake Connection
    - Auth Method: Username and Password
    - Username: Your Snowflake Username
    - Password: Your Snowflake Password
    - Schema: The default will be dbt_*username*, which works for our purposes. 
    - Target Name: default
    - Threads: 1
    
![Image of Snowflake Developer Credentials](https://github.com/cmccann020/dbt_bestpractices/blob/master/images/InkedSnowflake%20Developer_LI_Moment.jpg)
