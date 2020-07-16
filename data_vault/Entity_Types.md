## Data Vault Core Entity Types

Within Analytics 8 we use four core entity types instead of the usual three:
 - **Hub entity**: A Hub entity stores a unique list of business keys for a business concept. Business keys are defined as unique identifiers that also provide business context. They should have a low propensity to change. Some business keys may also be smart/intelligent keys, which have inherent context (an example would be a phone number. The area code helps identify the region of the phone number without explicitly identifying it). Each business key requires its own Hub. Hubs also have the load date (not the source system load date - but the date it was loaded into the data vault) and the record source. 
 - **Link entity**: A Link entity stores the business relationship between two or more business concept.
 - **Satellite entity**: A Satellite entity contains the context (descriptive attributes) of a business concept and tracks the changes in the context through time (history). These are not to be equated with Dimension tables in a typical Star Schema. These are a mix of facts and dimension, which together form the context for the Hub keys. A satellite contains additional metadata columns: load date (in the data vault) load end date, record source, and hashdiff. The hashdiff column is an MD5 hash of all non-metadata columns. This allows for efficient CDC (Change Data Capture) by comparing just 1 column instead of several. 

## Non-Core Entity Types
 - **Point-In-Time** table: A point-in-time (PIT) table is a helper table that combines the primary key and business keys of a single Hub or a single Link table with the attributes and time slices of the surrounding Satellites or Link Satellites. It is built for performance reasons to get the data out of the data vault. A PIT table provides a complete time horizon for a business key or a business relationship. A PIT table is part of the Business Data Vault (Interpretation Area), so soft rules such as aggregations and calculations are allowed.
- **Bridge table**: A Bridge table is a helper table that combines the primary keys and business keys from multiple Hubs and Links. A Bridge table can’t contain data from Satellites or Link Satellites. A Bridge table is built to improve the performance (by reducing the joins between Hubs and Links). A Bridge table is part of the Business Data Vault.

## Hashing
All keys are hashed using the MD5 hashing algorithm. Data Vault 2.0 utilizes MD5 hashing, and Analytics8 endorses it as well. Hashing is used for a two primary reasons: to ensure common data types across all keys, and to improve query/join performance. MD5 is used in particular because each key produces a 128 bit value, compared to SHA-2, which start at 224 bits. 

## Data Architecture
Analytics8 has a traditional three-tier architecture. This has been adapted to utilize cloud technologies and data lake(s):
- **ODS Layer**: All raw data from source systems permanently kept
- **Staging Layer**: All business logic and transformations 
- **Presentation Layer/Star Schema**: Data is structured as facts or dimension in a star schema for consumption by BI/Data Science/Ad-hoc querying

Data Vault has a modified approach to the three tiered architecture, but is compatible with cloud technologies and data lakes as well:
- **Staging Layer**: Raw data from the source is loaded in batches. After data is persisted to the next layer, this layer is truncated. The only transformations that occur in this layer are data type conformations and appending metadata. Data is immediately modelled as Hubs, Links, or Satellites
- **Raw Data Vault**: All historical data is stored. Data modelling is unchanged, and the data is not transformed. This is to enable full auditability.
- **Presentation Layer**: Traditional star schemas can be used. All business logic and transformations occur in this layer. Only relevant data is brought into this layer. Data Vault allows for full virtualization of this layer.
