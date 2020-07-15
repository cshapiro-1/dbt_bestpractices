## Data Vault Core Entity Types

Within Analytics 8 we use four core entity types instead of the usual three:
 - **Hub entity**: A Hub entity stores the business keys for a business concept.
 - **Link entity**: A Link entity stores the business relationship between two or more business concept.
 - **Satellite entity**: A Satellite entity contains the context (descriptive attributes) of a business concept and tracks the changes in the context through time (history).

## Non-Core Entity Types
 - **Point-In-Time** table: A point-in-time (PIT) table is a helper table that combines the primary key and business keys of a single Hub or a single Link table with the attributes and time slices of the surrounding Satellites or Link Satellites. It is built for performance reasons to get the data out of the data vault. A PIT table provides a complete time horizon for a business key or a business relationship. A PIT table is part of the Business Data Vault (Interpretation Area), so soft rules such as aggregations and calculations are allowed.
- **Bridge table**: A Bridge table is a helper table that combines the primary keys and business keys from multiple Hubs and Links. A Bridge table can’t contain data from Satellites or Link Satellites. A Bridge table is built to improve the performance (by reducing the joins between Hubs and Links). A Bridge table is part of the Business Data Vault.
