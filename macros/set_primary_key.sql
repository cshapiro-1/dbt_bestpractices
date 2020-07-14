{% macro set_primary_key(columns) -%}
    {% if not execute %}
        {{ return('') }}
    {% endif %}
    ALTER TABLE {{ this }} ADD PRIMARY KEY (
    {% for column in columns %}
        {{ column }}
        {% if not loop.last %}
            ', '
        {% endif %}
    {% endfor %}
);
{%- endmacro %}

--- example
/*
{{
    config(
        post_hook="{{ set_primary_key(['product_id']) }}",
    )
}}
*/
