# Entities and Relationships

The entities in the DIASCA data model represent the key components of the agricultural supply chain. This section describes each entity and their relationships.

## Entities

### Enterprises

Represents organizations involved in the agro supply chain.

**Attributes:**
- `id` (integer): Primary key.
- `name` (varchar): Name of the enterprise.
- `type` (varchar): Type of enterprise (e.g., Farm, Processor, Distributor).
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

### [Additional Entities...]

## Relationships

### Enterprises and Sites

- **One-to-Many**: One enterprise can own or operate multiple sites.

### Sites and Plots

- **One-to-Many**: One site can contain multiple plots.

### [Additional Relationships...]
