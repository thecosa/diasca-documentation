# Detailed Table Descriptions

This section provides detailed descriptions of each table in the DIASCA data model.

## Enterprises

**Table Name:** `Enterprises`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `name`              | varchar | Name of the enterprise                                   |
| `type`              | varchar | Type of enterprise (e.g., Farm, Processor, Exporter)  |
| `contact_information` | text | Contact details of the enterprise                        |

## Sites

**Table Name:** `Sites`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `enterprise_id`     | integer | References `Enterprises.id`                              |
| `name`              | varchar | Name of the site                                         |
| `latitude`          | float   | Latitude coordinate                                      |
| `longitude`         | float   | Longitude coordinate                                     |
| `altitude`          | float   | Altitude measurement                                     |
| `geojson`           | text    | Detailed geographical data                               |
| `size`              | float   | Size of the site                                         |
| `type`              | varchar | Type of site (e.g., Farm, Processing facility, Warehouse)|
| `address`           | text    | Address of the site                                      |

## SiteParameters

**Table Name:** `SiteParameters`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `site_id`           | integer | References `Sites.id`                                    |
| `key`               | varchar | Custom parameter name                                    |
| `value`             | text    | Custom parameter value                                   |
| `observation_date`  | date    | Date of observation                                      |

**Indexes:**
- `(site_id, observation_date, key)` [unique]

## Plots

**Table Name:** `Plots`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `site_id`           | integer | References `Sites.id`                                    |
| `name`              | varchar | Name of the plot                                         |
| `latitude`          | float   | Latitude coordinate                                      |
| `longitude`         | float   | Longitude coordinate                                     |
| `altitude`          | float   | Altitude measurement                                     |
| `geojson`           | text    | Detailed geographical data                               |
| `size`              | float   | Size of the plot                                         |
| `soil_type`         | varchar | Type of soil                                             |
| `crop_history`      | text    | History of crops grown on the plot                       |
| `primary_land_use`  | varchar | Primary use of the land (e.g., Crop cultivation, Pasture, Orchard) |
| `description`       | text    | Description of the plot                                  |

## PlotParameters

**Table Name:** `PlotParameters`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `plot_id`           | integer | References `Plots.id`                                    |
| `key`               | varchar | Custom parameter name                                    |
| `value`             | text    | Custom parameter value                                   |
| `observation_date`  | date    | Date of observation                                      |

**Indexes:**
- `(plot_id, observation_date, key)` [unique]

## People

**Table Name:** `People`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `name`              | varchar | Name of the person                                       |
| `role`              | varchar | Role of the person (e.g., Farmer, Manager, Inspector)    |
| `contact_information` | text  | Contact details of the person                            |
| `associated_enterprise_id` | integer | References `Enterprises.id`                        |

## PeopleParameters

**Table Name:** `PeopleParameters`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `person_id`         | integer | References `People.id`                                   |
| `key`               | varchar | Custom parameter name                                    |
| `value`             | text    | Custom parameter value                                   |
| `observation_date`  | date    | Date of observation                                      |

**Indexes:**
- `(person_id, observation_date, key)` [unique]

## Products

**Table Name:** `Products`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `name`              | varchar | Name of the product                                      |
| `type`              | varchar | Type of product (e.g., Grain, Vegetable, Fruit)          |
| `description`       | text    | Description of the product                               |
| `unit_of_measure`   | varchar | Unit of measurement for the product                      |

## Batches

**Table Name:** `Batches`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `product_id`        | integer | References `Products.id`                                 |
| `origin_plot_id`    | integer | References `Plots.id`                                    |
| `quantity`          | float   | Quantity of the batch                                    |
| `production_date`   | date    | Date of production                                       |
| `expiry_date`       | date    | Expiry date of the batch                                 |

## Transactions

**Table Name:** `Transactions`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `type`              | varchar | Type of transaction (e.g., Purchase, Sale, Transfer)     |
| `date_of_contract`  | date    | Date of the contract                                     |
| `seller_enterprise_id` | integer | References `Enterprises.id`                           |
| `buyer_enterprise_id` | integer | References `Enterprises.id`                            |
| `batch_id`          | integer | References `Batches.id`                                  |
| `quantity`          | float   | Quantity of the transaction                              |
| `price`             | float   | Price of the transaction                                 |

## TransactionParameters

**Table Name:** `TransactionParameters`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `transaction_id`    | integer | References `Transactions.id`                             |
| `key`               | varchar | Custom parameter name                                    |
| `value`             | text    | Custom parameter value                                   |
| `observation_date`  | date    | Date of observation                                      |

**Indexes:**
- `(transaction_id, observation_date, key)` [unique]

## Events

**Table Name:** `Events`

| Column              | Type    | Description                                              |
|---------------------|---------|----------------------------------------------------------|
| `id`                | integer | Primary key                                              |
| `type`              | varchar | Type of event (e.g., Planting, Harvesting, Processing, Inspection) |
| `date`              | date    | Date of the event                                        |
| `site_id`           | integer | References `Sites.id`                                    |
| `plot_id`           | integer | References `Plots.id`                                    |
| `batch_id`          | integer | References `Batches.id`                                  |
| `person_id`         | integer | References `People.id`                                   |
| `description`       | text    | Description of the event                                 |
| `attachments`       | text    | Could store file paths or URLs to relevant documents     |
