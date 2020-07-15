# DBT SQL Style Guide

One of the hardest parts of any project is deciding what to name things. Surprisingly, it is also one of the most important parts of development. Standard names allow non-developers, new analysts, and business users to easily understand what the specific piece of information is representing. As such, A8 will follow the recommendations of Fishtown Analytics, the creators of dbt, when it comes to naming models and columns. 

## Naming and Field Conventions:

 - Schemas, table, and columns should be named in snake_case
 - Names should be based on business terminology as opposed to source terminology. For example, SCF001 in the source would be renamed to stmt_cash_flow
 - Table, and model, names should be plurals, e.g. accounts as opposed to account.
 - Each model should have a primary key. If one does not exist, create a primary key as a combination of values that represent that unique record.
 - The primary key of a model should be named <object>_id. For example, account_id or inventory_id. This makes it easier to reference in downstream models.
 - Timestamp columns should be named <event>_at, e.g. created_at or updated_at. If not natively in UTC, they should be converted as soon as possible. If non UTC time zones need to be retained, denote the time zone in the name as a suffix, e.g. created_at_est.
 - Booleans should be prefixed with an is_ or has_.
 - Price/revenue fields should be in decimal currency (19.99 for $19.99). If non-decimal currency is used, indicate with a suffix, e.g. price in cents (1999).
 - Use the same field names across models wherever possible. Customer_id should always be customer_id if it relates to the customers table, never changed to user_id or anything like that. 

 
## SQL Style Guide:

Keeping naming and field conventions consistent across all models and projects is important, but that doesn’t mean we can forget about the actual SQL that we are writing. In order to allow for ease of reading and consistency among all developers, the following are the commandments of the A8 SQL Style Guide:

 - Lines of SQL should be no longer than 80 characters.
 - Field names and function names should all be lowercase. Certain databases will store these as all capitalized, which is fine. Querying for field and function names are not case sensitive.
 - The ‘AS’ keyword should be used when aliasing a field or table.
 - All relevant fields should be stated before any aggregate or window functions. 
 - Specify join keys – do not use the ‘using’ language. Certain warehouses, specifically Snowflake, have inconsistencies with this language.
 - Use Union all over union *
 - Use lines to create visual breaks for separate calculations. Think of this as creating blocks for calculations like case statements or aggregations
 - Have lines in between joins to allow for ease of understanding
 - Always alias table with descriptive names, not initials like c for customers.
 - Avoid table aliases in join conditions.
 - If joining two or more tables, always prefix your column names with the table alias. 
 - Indents should be four spaces

## CTE Standards:
 - Names should be as verbose as needed to convey what it is that they do. Clarification is superior to brevity.
 - If there is confusing logic, or particularly complicated logic in the CTE, it should be commented to explain the purpose.
 - If a CTE is being duplicated across multiple models, it should be pulled out and added into its own model that can be referenced.
