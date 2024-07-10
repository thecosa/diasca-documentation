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

## Transaction Types

Defines the types of transactions within the supply chain. This parameter is used in the `type` field of the `Transactions` table. 

| Value       | Description                                      |
|-------------|--------------------------------------------------|
| `Sale`      | A transaction where products are sold. |
| `Transfer`  | A transaction where products are transferred between entities without a sale. |
| `Return`    | A transaction where products are returned.       |
| `Donation`  | A transaction where products are donated.        |

## Event Types

Defines the types of events that can occur within the supply chain. This parameter is used in the `type` field of the `Events` table.

| Value        | Description                                      |
|--------------|--------------------------------------------------|
| `Planting`   | An event where crops are planted.                |
| `Harvesting` | An event where crops are harvested.              |
| `Processing` | An event where products are processed.           |
| `Inspection` | An event where an inspection occurs.             |

## Unit of Measure

Standardized units of measure for products. This parameter is used in the `unit_of_measure` field of the `Products` table.

| Value        | Description                      |
|--------------|----------------------------------|
| `kg`         | Kilograms                        |
| `ton`        | Metric Tons                      |
| `l`          | Liters                           |
| `unit`       | Individual units of product      |

## Plot Parameters

Standardized parameters for plots within sites. These parameters are stored in the `PlotParameters` table.

| Key                   | Description                                      | Example                                   |
|-----------------------|--------------------------------------------------|-------------------------------------------|
| `soil_type`           | The type of soil in the plot                     | `Sandy`, `Clay`, `Loamy`                  |
| `crop_history`        | The history of crops grown on the plot           | `2020: Wheat, 2021: Corn, 2022: Soybeans` |
| `type_of_shadow_trees`| Types of shadow trees present on the plot        | `Mango`, `Acacia`                         |
| `other_crops`         | Other crops grown on the plot                    | `Tomatoes, Peppers`                       |
| `avg_yields`          | Average yields in kilograms                      | `5000 kg/ha`                              |

## Site Parameters

Stores custom key-value pairs for sites.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `irrigation_type`  | Type of irrigation system used          | `Drip`, `Sprinkler`, `Flood`               |
| `ownership`        | Ownership status of the site            | `Owned`, `Leased`                          |
| `organic_certified`| Organic certification status            | `Certified`, `In Conversion`, `Not Certified` |

## People Parameters

Stores custom key-value pairs for people.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `training`         | Type of training received               | `Sustainable Agriculture`, `Pesticide Safety` |
| `years_of_experience` | Number of years of experience in the role | `10 years`, `5 years`                      |
| `certifications`   | Certifications obtained                 | `ISO 9001`, `Fair Trade`                   |

## Transaction Parameters

Stores custom key-value pairs for transactions.

| Key                | Description                             | Example                                    |
|--------------------|-----------------------------------------|--------------------------------------------|
| `payment_method`   | Method of payment used                  | `Credit`, `Cash`, `Bank Transfer`          |
| `delivery_terms`   | Terms of delivery                       | `FOB`, `CIF`, `Ex Works`                   |
| `quality_grade`    | Quality grade of the product            | `Grade A`, `Grade B`                       |

## Creating Custom Keys for New Parameters

While the parameters listed above provide a standardized set of examples, users can create their own keys for new parameters to accommodate specific needs. Here are best practices for creating new key names:

### Best Practices for Key Names

1. **Descriptive**: Choose key names that clearly describe the parameter. This helps ensure that anyone using the data can easily understand what the parameter represents.
2. **Consistent**: Use a consistent naming convention throughout your dataset. For example, if you use snake_case for one parameter, use it for all parameters.
3. **Concise**: Keep key names short but informative. Avoid overly long names that can be cumbersome to use.
4. **Avoid Special Characters**: Use only letters, numbers, and underscores. Avoid spaces and special characters to ensure compatibility with various systems and software.
5. **Contextual**: Provide enough context within the key name to avoid ambiguity. For example, instead of using `type`, use `soil_type` or `irrigation_type` to make the context clear.

### Examples of Custom Keys

| Key                   | Description                                      | Example                                   |
|-----------------------|--------------------------------------------------|-------------------------------------------|
| `water_source`        | Source of water for irrigation                   | `River`, `Well`, `Rainwater`              |
| `labor_hours`         | Total labor hours spent on the plot              | `100 hours`                               |
| `fertilizer_type`     | Type of fertilizer used                          | `Organic`, `Inorganic`                    |
| `harvest_method`      | Method used for harvesting                       | `Manual`, `Mechanical`                    |

By following these best practices, you can ensure that your custom keys are easily understandable, maintain consistency across datasets, and improve overall data quality.
