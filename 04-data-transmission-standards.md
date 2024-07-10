
# Data Transmission Standards

While the data model explains how data lives in a database of a particular system, the data transmission standards provide guidelines on how different organizations can share data securely and efficiently. This section covers the use of OpenAPI, HTTPS, and JSON for data transmission.

## Overview

To facilitate seamless data exchange across the agricultural supply chain, DIASCA recommends the use of standardized protocols and formats. By using OpenAPI for API documentation, HTTPS for secure data transmission, and JSON for data formatting, organizations can ensure interoperability and data integrity.

## OpenAPI

### What is OpenAPI?

[OpenAPI](https://www.openapis.org/) is a specification for building APIs that allows both humans and computers to understand the capabilities of a service without access to source code or additional documentation. OpenAPI definitions can be used to generate documentation, client libraries, and server stubs automatically.

### Benefits

- **Standardization**: Ensures that APIs are documented in a consistent manner.
- **Automation**: Facilitates the automatic generation of API documentation, client libraries, and server stubs.
- **Interoperability**: Promotes compatibility between different systems and tools.

### Best Practices

1. **Document All Endpoints**: Ensure that all API endpoints are documented, including request and response formats, parameters, and error codes.
2. **Use Descriptive Names**: Use clear and descriptive names for API paths, parameters, and models.
3. **Include Examples**: Provide examples for request and response bodies to help users understand how to interact with the API.
4. **Versioning**: Use versioning in your API paths to manage changes and ensure backward compatibility.

### Example

Here is an example of an OpenAPI definition for an endpoint to retrieve site data:

```yaml
openapi: 3.0.0
info:
  title: DIASCA API
  version: 1.0.0
paths:
  /sites:
    get:
      summary: Retrieve a list of sites
      responses:
        '200':
          description: A JSON array of site objects
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Site'
components:
  schemas:
    Site:
      type: object
      properties:
        id:
          type: integer
        enterprise_id:
          type: integer
        name:
          type: string
        latitude:
          type: number
        longitude:
          type: number
        altitude:
          type: number
        geojson:
          type: string
        size:
          type: number
        type:
          type: string
        address:
          type: string
```

## HTTPS

### What is HTTPS?

HTTPS (HyperText Transfer Protocol Secure) is an extension of HTTP that uses TLS (Transport Layer Security) to encrypt data transmitted between a client and a server. This ensures that data cannot be intercepted or tampered with during transmission.

### Benefits

- **Security**: Encrypts data to protect it from interception and tampering.
- **Trust**: Provides authentication to verify the identity of the server.
- **Compliance**: Helps meet regulatory requirements for data protection.

### Best Practices

1. **Use Strong Certificates**: Use TLS certificates from reputable certificate authorities.
2. **Keep Certificates Updated**: Ensure that certificates are renewed before they expire.
3. **Enforce HTTPS**: Redirect all HTTP traffic to HTTPS to ensure secure connections.
4. **Secure Configuration**: Disable insecure protocols and ciphers to protect against vulnerabilities.

### Example

Here is an example of how to configure an NGINX server to use HTTPS:

```nginx
server {
    listen 80;
    server_name example.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name example.com;

    ssl_certificate /etc/ssl/certs/example.com.crt;
    ssl_certificate_key /etc/ssl/private/example.com.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

## JSON

### What is JSON?

JSON (JavaScript Object Notation) is a lightweight data-interchange format that is easy for humans to read and write and easy for machines to parse and generate. JSON is widely used in APIs to format request and response bodies.

### Benefits

- **Readability**: Easy to read and write, making it accessible for both developers and non-developers.
- **Interoperability**: Supported by most programming languages and frameworks.
- **Efficiency**: Lightweight format that minimizes data size and transmission time.

### Best Practices

1. **Consistent Formatting**: Use consistent formatting for JSON objects, including indentation and key naming conventions.
2. **Include Metadata**: Include metadata in your JSON responses, such as timestamps and status codes.
3. **Validate JSON**: Use JSON schema to validate request and response bodies to ensure they conform to the expected structure.
4. **Handle Errors**: Provide clear error messages and codes in your JSON responses.

### Example

Here is an example of a JSON response for a site object:

```json
{
  "id": 1,
  "enterprise_id": 101,
  "name": "Green Farm",
  "latitude": 40.7128,
  "longitude": -74.0060,
  "altitude": 10,
  "geojson": "{"type": "Point", "coordinates": [40.7128, -74.0060]}",
  "size": 50.5,
  "type": "Farm",
  "address": "123 Green Farm Lane, Springfield"
}
```

## Conclusion

By adhering to these data transmission standards, organizations within the DIASCA ecosystem can ensure secure, efficient, and interoperable data exchange. Utilizing OpenAPI for API documentation, HTTPS for secure data transmission, and JSON for data formatting will enhance the integrity and usability of shared data across the agricultural supply chain.
