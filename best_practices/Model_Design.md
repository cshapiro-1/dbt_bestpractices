## Model Design:

Based on the Fishtown Analytics recommendations for best practices, we follow their SQL Style Guide, which heavily uses CTE’s in developing models. Any worry about CTE performance optimization doesn’t really apply in the development of DBT models, especially if used in the recommended way. So you get all the benefits of CTEs – easier to read and debug – and none of the downsides.

The first stylistic choice that will be considered A8 standard is to begin each model by “importing” each upstream relation that is going to be used. Think of this as the same as importing python packages – we need to lay out our dependencies early on. It makes it easy for future developers to see what the dependencies of that specific model are and it gives us an easy method to alias all dependency tables. See the “CTE Standards” subsection for added detail on CTE usage.

Example of “importing” the data from an events staging model:

    With events as (
      select * from {{ ref(‘stg_events’) }}
    )

The second is that every subdirectory should contain a ‘model’ yml file that is named after the model. For example, a subdirectory called base with the base_actor.sql file should have the base_actor.yml file. This file will contain all of the documentation and testing for that model. To clarify, we believe that there should be a yml schema file for each and every model. This ensures readability. Below is an example of the file format. Notice that stg_actor has both the sql model file and the yml file for tests and descriptions.
