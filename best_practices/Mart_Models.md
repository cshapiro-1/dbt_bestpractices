## Mart Models:

Marts are stores of models that describe business entities and processes. They are often grouped by business unit – marketing, finance, product, etc. However, there are also frequently models that are shared across an entire business. These should be grouped in a core directory. Following this example, our directory would look like below:

    └── models
        ├── marts
        |   ├── core
        |   ├── finance
        |   ├── marketing
        |   └── product

While the format of the mart models are entirely dependent on many different factors, the goal remains the same; build fact and dimension models that help us abstract and make sense of the source data. Here are possible descriptions of the model types (these are not representative of all facts or dimensions):
 - **fact_<verb>**: A tall, narrow table representing real-world processes that have occurred or are occurring. The foundation of these models are an immutable event stream, be that sessions, transactions, orders, stories, votes, etc.
 - **dim_<noun>**: A wide, short table where each row is a person, place, or thing. They are the ultimate source of truth for identifying or describing entities related to the organization. The sources are mutable, possibly slowly changing.

The work of staging models is focused on cleaning and preparing the data. Fact tables are the product of substantive data transformation: choosing (and reducing) dimension, date spinning, executing business logic, and making informed decisions with the subject matter experts.

This modeling layer is significantly more complex than creating staging models. The models we design must be highly tailored to the analytical needs of the organization. This means that there are very few principles that can be applied across every industry and every customer. Below are a few common recommendations:
 - Fact and dimension models should be materialized as tables within a warehouse in order to improve query performance. Where performance requires it, consider using the incremental materialization. 
 - Intermediate transformations may be required to get to the needed level of detail. These should be placed in a nested directory within the mart specific directory. In order to prevent end users from referencing these as a source of truth, consider using the ephemeral materialization. (There may be less need for intermediate transformations if using a warehouse layer. This is dependent, however, on the specific transformation of the model.)
 - Models should be tested and documented in the <dir_name>.yml file within the same directory as the models.
 - Any extra documentation that is needed can be placed in a <dir_name>.md file within the same directory, using doc blocks to reference it in the yml file. 
