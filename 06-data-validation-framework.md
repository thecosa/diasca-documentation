
# Data Validation Framework

To ensure data quality and consistency across systems, we've established the following validation rules:

## General Validation Rules

1. All required fields must be present and non-null.
2. String fields should not exceed their specified maximum length.
3. Numeric fields should be within specified ranges (e.g., latitude between -90 and 90).
4. Dates should be in ISO 8601 format (YYYY-MM-DD).

## Entity-Specific Validation

### Sites

1. Latitude must be between -90 and 90.
2. Longitude must be between -180 and 180.
3. Size must be positive.

### Transactions

1. Transaction date must not be in the future.
2. Quantity must be positive.

## Parameter Validation

1. The combination of (entity_id, key, observation_date) must be unique in each parameter table.
2. Observation date must not be in the future.

## General Validation Rules

### Required Fields

All required fields must be present and non-null. This ensures that critical information is always captured and prevents incomplete records from being stored.

### String Fields

String fields should not exceed their specified maximum length. This helps maintain data integrity and prevents issues with data storage and retrieval.

### Numeric Fields

Numeric fields should be within specified ranges to ensure validity. For example:
- Latitude values must be between -90 and 90.
- Longitude values must be between -180 and 180.

### Date Fields

Dates should be in ISO 8601 format (YYYY-MM-DD) to ensure consistency and compatibility across systems.

## Entity-Specific Validation

### Sites

To ensure the accuracy and validity of site data, the following rules apply:

1. **Latitude**: Must be between -90 and 90.
2. **Longitude**: Must be between -180 and 180.
3. **Size**: Must be a positive number.

### Transactions

To maintain the integrity of transaction data, the following rules apply:

1. **Transaction Date**: Must not be in the future.
2. **Quantity**: Must be a positive number.

## Parameter Validation

Parameter tables are used to store custom key-value pairs for various entities. The following validation rules ensure the integrity and uniqueness of parameter data:

1. **Uniqueness**: The combination of (entity_id, key, observation_date) must be unique in each parameter table. This prevents duplicate records for the same parameter.
2. **Observation Date**: Must not be in the future to ensure that all recorded data is historically accurate.

By adhering to these validation rules, we can ensure that the data stored within the DIASCA system is accurate, consistent, and reliable. This framework provides a robust foundation for maintaining high data quality across all integrated systems.
