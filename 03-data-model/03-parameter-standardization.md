# Parameter Standardization

Parameter standardization ensures that key data elements are consistently defined and used across the entire supply chain. This section describes the standardization of parameters used in the DIASCA project and explains which tables and fields utilize these parameters.

## Enterprise Types

Defines the types of enterprises involved in the agro supply chain. This parameter is used in the `type` field of the `Enterprises` table.

| Value        | Description                                                     |
|--------------|-----------------------------------------------------------------|
| `Farm`       | An agricultural establishment primarily engaged in the cultivation of crops or raising livestock. |
| `Processor`  | An enterprise involved in the processing of raw agricultural products. |
| `Importer`   | An enterprise that imports agricultural products.               |
| `Exporter`   | An enterprise that exports agricultural products.               |

## Site Types

Defines the types of sites within the supply chain. This parameter is used in the `type` field of the `Sites` table.

| Value                | Description                                      |
|----------------------|--------------------------------------------------|
| `Farm`               | A site where agricultural activities take place. |
| `Processing facility`| A site where raw agricultural products are processed. |
| `Warehouse`          | A site used for the storage of agricultural products. |

## Plot Parameters

Standardized parameters for plots within sites. These parameters are stored in the `PlotParameters` table.

| Key                   | Description                                      | Example                                   |
|-----------------------|--------------------------------------------------|-------------------------------------------|
| `soil_type`           | The type of soil in the plot                     | `Sandy`, `Clay`, `Loamy`                  |
| `crop_history`        | The history of crops grown on the plot           | `2020: Wheat, 2021: Corn, 2022: Soybeans` |
| `type_of_shadow_trees`| Types of shadow trees present on the plot        | `Mango`, `Acacia`                         |
| `other_crops`         | Other crops grown on the plot                    | `Tomatoes, Peppers`                       |
| `avg_yields`          | Average yields in kilograms                      | `5000 kg/ha`                              |

## Transaction Types

Defines the types of transactions within the supply chain. This parameter is used in the `type` field of the `Transactions` table. 

| Value       | Description                                      |
|-------------|--------------------------------------------------|
| `Transfer`  | A transaction where products are transferred between entities without a sale. |
| `Return`    | A transaction where products are returned.       |
| `Donation`  | A transaction where products are donated.        |

### Discussion:
We have removed `Purchase` and `Sale` because every transaction inherently involves a buyer and a seller. Other transaction types like `Transfer`, `Return`, and `Donation` provide more clarity for the specific nature of the transaction.

## Unit of Measure

Standardized units of measure for products. This parameter is used in the `unit_of_measure` field of the `Products` table.

| Value        | Description                      |
|--------------|----------------------------------|
| `kg`         | Kilograms                        |
| `ton`        | Metric Tons                      |
| `l`          | Liters                           |
| `unit`       | Individual units of product      |

## Event Types

Defines the types of events that can occur within the supply chain. This parameter is used in the `type` field of the `Events` table.

| Value        | Description                                      |
|--------------|--------------------------------------------------|
| `Planting`   | An event where crops are planted.                |
| `Harvesting` | An event where crops are harvested.              |
| `Processing` | An event where products are processed.           |
| `Inspection` | An event where an inspection occurs.             |

## Additional Parameters for Other Tables

### SiteParameters

Stores custom key-value pairs for sites.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `irrigation_type`  | Type of irrigation system used          | `Drip`, `Sprinkler`, `Flood`               |
| `ownership`        | Ownership status of the site            | `Owned`, `Leased`                          |
| `organic_certified`| Organic certification status            | `Certified`, `In Conversion`, `Not Certified` |

### PeopleParameters

Stores custom key-value pairs for people.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `training`         | Type of training received               | `Sustainable Agriculture`, `Pesticide Safety` |
| `years_of_experience` | Number of years of experience in the role | `10 years`, `5 years`                      |
| `certifications`   | Certifications obtained                 | `ISO 9001`, `Fair Trade`                   |

### TransactionParameters

Stores custom key-value pairs for transactions.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `payment_method`   | Method of payment used                  | `Credit`, `Cash`, `Bank Transfer`          |
| `delivery_terms`   | Terms of delivery                       | `FOB`, `CIF`, `Ex Works`                   |
| `quality_grade`    | Quality grade of the product            | `Grade A`, `Grade B`                       |

Parameter standardization is crucial for ensuring data interoperability and consistency across the DIASCA data model. These standardizations help in reducing ambiguity and improving data quality.
