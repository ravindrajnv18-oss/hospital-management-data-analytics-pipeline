# 04. Azure Data Factory - Linked Services

## Objective

The objective of this step is to establish secure connections between Azure Data Factory and the external systems used in this project.

Azure Data Factory cannot access any storage account, database, or cloud service directly. It requires a Linked Service to authenticate and communicate with the source and destination systems.

---

# What is a Linked Service?

A Linked Service is a reusable connection object in Azure Data Factory.

It stores the connection details and authentication method required to communicate with external resources.

Think of a Linked Service as a connection profile.

Without a Linked Service, Azure Data Factory cannot read or write data.

---

# Why are Linked Services Required?

In this project, data moves from Azure Data Lake Storage Gen2 to Snowflake.

Azure Data Factory needs authenticated connections to:

- Read source data
- Perform temporary staging
- Load data into Snowflake

---

# Linked Services Used

| Linked Service | Type | Authentication | Purpose |
|----------------|------|---------------|---------|
| LS_ADLS_Hospital | Azure Data Lake Storage Gen2 | Account Key | Read source CSV files |
| LS_BLOB_STAGING | Azure Blob Storage | SAS URI | Temporary staging during Copy Activity |
| LS_SNOWFLAKE_HOSPITAL | Snowflake V2 | Basic Authentication | Load data into Snowflake |

---

# Project Architecture

```text
Azure Data Factory
        │
        ├────────────── LS_ADLS_Hospital
        │                    │
        │                    ▼
        │            Azure Data Lake Storage Gen2
        │
        ├────────────── LS_BLOB_STAGING
        │                    │
        │                    ▼
        │             Azure Blob Storage
        │
        └────────────── LS_SNOWFLAKE_HOSPITAL
                             │
                             ▼
                         Snowflake
```

---

# Linked Service 1

## LS_ADLS_Hospital

### Type

Azure Data Lake Storage Gen2

### Authentication

Account Key

### Purpose

Reads the hospital datasets stored inside

```
hospital-data
```

---

## Why Account Key?

The Storage Account provides two access keys.

Azure Data Factory uses one of these keys to authenticate with the storage account.

Advantages

- Easy to configure
- Suitable for learning projects
- Direct authentication

---

# Linked Service 2

## LS_BLOB_STAGING

### Type

Azure Blob Storage

### Authentication

SAS URI

### Purpose

Provides temporary staging storage during the Copy Activity before data is loaded into Snowflake.

---

## What is SAS URI?

SAS stands for **Shared Access Signature**.

Instead of exposing the Storage Account Key, Azure generates a temporary access token with limited permissions.

A SAS token defines:

- Allowed operations
- Expiration time
- Accessible resources

This provides more secure and controlled access to Azure Blob Storage.

---

# Why Blob Staging?

During the Copy Activity, Azure Data Factory stages data temporarily before loading it into Snowflake.

This improves compatibility and supports efficient data transfer.

---

# Linked Service 3

## LS_SNOWFLAKE_HOSPITAL

### Type

Snowflake V2

### Authentication

Basic Authentication

### Purpose

Loads the hospital datasets into Snowflake.

---

## Why Basic Authentication?

Snowflake authentication is performed using:

- Username
- Password

Azure Data Factory uses these credentials to establish a secure connection with Snowflake.

---

# Authentication Summary

| Authentication | Used For | Reason |
|---------------|----------|--------|
| Account Key | ADLS Gen2 | Simple authentication for learning project |
| SAS URI | Azure Blob Storage | Temporary controlled access |
| Basic Authentication | Snowflake | Username and password authentication |

---

# Why Not Managed Identity?

Managed Identity is Microsoft's recommended authentication mechanism for production environments.

However, this project was developed as a portfolio and learning project.

The objective was to understand Azure Data Factory components and ETL workflows without introducing additional Azure Identity and RBAC configuration.

For enterprise implementations, Managed Identity or Azure Key Vault would be the preferred approach.

---

# Screenshots

Azure Data Lake Storage Linked Service

```
../screenshots/azure/linked-service-adls.png
```

Azure Blob Storage Linked Service

```
../screenshots/azure/linked-service-blob.png
```

Snowflake Linked Service

```
../screenshots/azure/linked-service-snowflake.png
```

---

# Key Learning

Linked Services provide secure and reusable connections between Azure Data Factory and external systems.

Different authentication methods are selected based on the target service and security requirements.

---

# Interview Questions

### What is a Linked Service?

A Linked Service is a reusable connection object in Azure Data Factory that stores the authentication and connection details required to communicate with external systems.

---

### Why did you create three Linked Services?

Each Linked Service connects Azure Data Factory to a different resource.

- ADLS Gen2 for reading source files
- Blob Storage for temporary staging
- Snowflake for loading destination data

---

### Why did you use SAS URI?

SAS URI provides temporary and controlled access to Azure Blob Storage without exposing the Storage Account Key.

---

### Why didn't you use Managed Identity?

The project focused on understanding Azure Data Factory and ETL implementation.

Managed Identity is more suitable for production environments where Azure RBAC and identity management are implemented.

---

# Next Step

Proceed to **05_Datasets.md** to create datasets for the hospital CSV files and connect them to the Linked Services.
