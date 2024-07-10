# Parameter Standardization

Parameter standardization ensures that key data elements are consistently defined and used across the entire supply chain. This section describes the standardization of parameters used in the DIASCA project.

## Enterprise Types

Defines the types of enterprises involved in the agro supply chain.

| Value          | Description                             |
|----------------|-----------------------------------------|
| `Farm`         | An agricultural establishment primarily engaged in the cultivation of crops or raising livestock. |
| `Processor`    | An enterprise involved in the processing of raw agricultural products. |
| `Distributor`  | An enterprise responsible for the distribution of agricultural products. |

## Site Types

Defines the types of sites within the supply chain.

| Value                | Description                                      |
|----------------------|--------------------------------------------------|
| `Farm`               | A site where agricultural activities take place. |
| `Processing facility`| A site where raw agricultural products are processed. |
| `Warehouse`          | A site used for the storage of agricultural products. |

## Plot Parameters

Standardized parameters for plots within sites.

| Key                  | Description                                      |
|----------------------|--------------------------------------------------|
| `soil_type`          | The type of soil in the plot (e.g., Sandy, Clay, Loamy). |
| `crop_history`       | The history of crops grown on the plot.          |
| `primary_land_use`   | The primary use of the land (e.g., Crop cultivation, Pasture, Orchard). |

## Transaction Types

Defines the types of transactions within the supply chain.

| Value                | Description                                      |
|----------------------|--------------------------------------------------|
| `Purchase`           | A transaction where products are bought.         |
| `Sale`               | A transaction where products are sold.           |
| `Transfer`           | A transaction where products are transferred between entities without a sale. |

## Unit of Measure

Standardized units of measure for products.

| Value                | Description                                      |
|----------------------|--------------------------------------------------|
| `kg`                 | Kilograms                                        |
| `ton`                | Metric Tons                                      |
| `l`                  | Liters                                           |
| `unit`               | Individual units of product                      |

## Event Types

Defines the types of events that can occur within the supply chain.

| Value                | Description                                      |
|----------------------|--------------------------------------------------|
| `Planting`           | An event where crops are planted.                |
| `Harvesting`         | An event where crops are harvested.              |
| `Processing`         | An event where products are processed.           |
| `Inspection`         | An event where an inspection occurs.             |

Parameter standardization is crucial for ensuring data interoperability and consistency across the DIASCA data model. These standardizations help in reducing ambiguity and improving data quality.
