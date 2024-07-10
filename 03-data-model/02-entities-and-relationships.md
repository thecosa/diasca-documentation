# Entities and Relationships

The entities in the DIASCA data model represent the key components of the agricultural supply chain. This section describes each entity and their relationships.

## Entities

### Enterprises

Represents organizations involved in the agro supply chain.

**Attributes:**
- `id` (integer): Primary key.
- `name` (varchar): Name of the enterprise.
- `type` (varchar): Type of enterprise (e.g., Farm, Processor, Exporter).
- `contact_information` (text): Contact details of the enterprise.

### Sites

Represents physical locations owned or operated by enterprises.

**Attributes:**
- `id` (integer): Primary key.
- `enterprise_id` (integer): References `Enterprises.id`.
- `name` (varchar): Name of the site.
- `latitude` (float): Latitude coordinate.
- `longitude` (float): Longitude coordinate.
- `altitude` (float): Altitude measurement.
- `geojson` (text): Detailed geographical data.
- `size` (float): Size of the site.
- `type` (varchar): Type of site (e.g., Farm, Processing facility, Warehouse).
- `address` (text): Address of the site.

### SiteParameters

Stores custom key-value pairs for sites.

**Attributes:**
- `id` (integer): Primary key.
- `site_id` (integer): References `Sites.id`.
- `key` (varchar): Custom parameter name.
- `value` (text): Custom parameter value.
- `observation_date` (date): Date of observation.

**Indexes:**
- `(site_id, observation_date, key)` [unique]

### Plots

Represents specific areas within a site, typically for cultivation.

**Attributes:**
- `id` (integer): Primary key.
- `site_id` (integer): References `Sites.id`.
- `name` (varchar): Name of the plot.
- `latitude` (float): Latitude coordinate.
- `longitude` (float): Longitude coordinate.
- `altitude` (float): Altitude measurement.
- `geojson` (text): Detailed geographical data.
- `size` (float): Size of the plot.
- `soil_type` (varchar): Type of soil.
- `crop_history` (text): History of crops grown on the plot.
- `primary_land_use` (varchar): Primary use of the land (e.g., Crop cultivation, Pasture, Orchard).
- `description` (text): Description of the plot.

### PlotParameters

Stores custom key-value pairs for plots.

**Attributes:**
- `id` (integer): Primary key.
- `plot_id` (integer): References `Plots.id`.
- `key` (varchar): Custom parameter name.
- `value` (text): Custom parameter value.
- `observation_date` (date): Date of observation.

**Indexes:**
- `(plot_id, observation_date, key)` [unique]

### People

Represents individuals involved in the agro supply chain.

**Attributes:**
- `id` (integer): Primary key.
- `name` (varchar): Name of the person.
- `role` (varchar): Role of the person (e.g., Farmer, Manager, Inspector).
- `contact_information` (text): Contact details of the person.
- `associated_enterprise_id` (integer): References `Enterprises.id`.

### PeopleParameters

Stores custom key-value pairs for people.

**Attributes:**
- `id` (integer): Primary key.
- `person_id` (integer): References `People.id`.
- `key` (varchar): Custom parameter name.
- `value` (text): Custom parameter value.
- `observation_date` (date): Date of observation.

**Indexes:**
- `(person_id, observation_date, key)` [unique]

### Products

Represents agricultural products.

**Attributes:**
- `id` (integer): Primary key.
- `name` (varchar): Name of the product.
- `type` (varchar): Type of product (e.g., Grain, Vegetable, Fruit).
- `description` (text): Description of the product.
- `unit_of_measure` (varchar): Unit of measurement for the product.

### Batches

Represents specific quantities of products.

**Attributes:**
- `id` (integer): Primary key.
- `product_id` (integer): References `Products.id`.
- `origin_plot_id` (integer): References `Plots.id`.
- `quantity` (float): Quantity of the batch.
- `production_date` (date): Date of production.
- `expiry_date` (date): Expiry date of the batch.

### Transactions

Represents exchanges of products between enterprises.

**Attributes:**
- `id` (integer): Primary key.
- `type` (varchar): Type of transaction (e.g., Purchase, Sale, Transfer).
- `date_of_contract` (date): Date of the contract.
- `seller_enterprise_id` (integer): References `Enterprises.id`.
- `buyer_enterprise_id` (integer): References `Enterprises.id`.
- `batch_id` (integer): References `Batches.id`.
- `quantity` (float): Quantity of the transaction.
- `price` (float): Price of the transaction.

### TransactionParameters

Stores custom key-value pairs for transactions.

**Attributes:**
- `id` (integer): Primary key.
- `transaction_id` (integer): References `Transactions.id`.
- `key` (varchar): Custom parameter name.
- `value` (text): Custom parameter value.
- `observation_date` (date): Date of observation.

**Indexes:**
- `(transaction_id, observation_date, key)` [unique]

### Events

Represents significant occurrences in the supply chain.

**Attributes:**
- `id` (integer): Primary key.
- `type` (varchar): Type of event (e.g., Planting, Harvesting, Processing, Inspection).
- `date` (date): Date of the event.
- `site_id` (integer): References `Sites.id`.
- `plot_id` (integer): References `Plots.id`.
- `batch_id` (integer): References `Batches.id`.
- `person_id` (integer): References `People.id`.
- `description` (text): Description of the event.
- `attachments` (text): Could store file paths or URLs to relevant documents.

## Relationships

### Enterprises and Sites

- **One-to-Many**: One enterprise can own or operate multiple sites.
- **Foreign Key**: `Sites.enterprise_id` references `Enterprises.id`.

### Sites and Plots

- **One-to-Many**: One site can contain multiple plots.
- **Foreign Key**: `Plots.site_id` references `Sites.id`.

### Sites and SiteParameters

- **One-to-Many**: One site can have multiple parameters.
- **Foreign Key**: `SiteParameters.site_id` references `Sites.id`.

### Plots and PlotParameters

- **One-to-Many**: One plot can have multiple parameters.
- **Foreign Key**: `PlotParameters.plot_id` references `Plots.id`.

### Enterprises and People

- **One-to-Many**: One enterprise can have multiple associated people.
- **Foreign Key**: `People.associated_enterprise_id` references `Enterprises.id`.

### People and PeopleParameters

- **One-to-Many**: One person can have multiple parameters.
- **Foreign Key**: `PeopleParameters.person_id` references `People.id`.

### Products and Batches

- **One-to-Many**: One product can have multiple batches.
- **Foreign Key**: `Batches.product_id` references `Products.id`.

### Plots and Batches

- **One-to-Many**: One plot can have multiple batches.
- **Foreign Key**: `Batches.origin_plot_id` references `Plots.id`.

### Transactions and Enterprises

- **Many-to-Many**: Transactions occur between two enterprises (seller and buyer).
- **Foreign Keys**: `Transactions.seller_enterprise_id` and `Transactions.buyer_enterprise_id` reference `Enterprises.id`.

### Transactions and Batches

- **One-to-One**: Each transaction involves one batch.
- **Foreign Key**: `Transactions.batch_id` references `Batches.id`.

### Transactions and TransactionParameters

- **One-to-Many**: One transaction can have multiple parameters.
- **Foreign Key**: `TransactionParameters.transaction_id` references `Transactions.id`.

### Sites, Plots, and Events

- **Many-to-One**: Events can occur at a site or a plot.
- **Foreign Keys**: `Events.site_id` references `Sites.id`, and `Events.plot_id` references `Plots.id`.

### Batches and Events

- **One-to-Many**: One batch can be associated with multiple events.
- **Foreign Key**: `Events.batch_id` references `Batches.id`.

### People and Events

- **One-to-Many**: One person can be associated with multiple events.
- **Foreign Key**: `Events.person_id` references `People.id`.

## Diagram

For a visual representation of these entities and relationships, refer to the entity-relationship diagram in the `assets/images` directory.