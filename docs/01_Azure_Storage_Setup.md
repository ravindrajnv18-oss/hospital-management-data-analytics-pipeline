# 01. Azure Storage Setup

## Objective

The first step in this project is to create a centralized cloud storage solution for storing the raw hospital management datasets.

Azure Data Lake Storage Gen2 (ADLS Gen2) is used as the landing zone for all source CSV files before they are processed by Azure Data Factory (ADF) and loaded into Snowflake.

---

## Business Requirement

The Hospital Management System generates multiple datasets, including patient details, doctor information, appointments, billing, and treatments.

These datasets need to be:

- Stored securely in the cloud
- Easily accessible by Azure Data Factory
- Scalable for future data growth
- Compatible with analytics and ETL workloads

Azure Data Lake Storage Gen2 satisfies these requirements and serves as the source data repository for this project.

---

# Why Azure Data Lake Storage Gen2?

Azure provides multiple storage options such as Azure Blob Storage, Azure SQL Database, Azure Cosmos DB, and Azure Data Lake Storage Gen2.

For this project, Azure Data Lake Storage Gen2 was selected because:

- Source data is available as CSV files.
- It integrates seamlessly with Azure Data Factory.
- Supports hierarchical namespace for organizing files and directories.
- Optimized for analytics and ETL workloads.
- Cost-effective cloud storage solution.

---

# Azure Resource Details

| Property | Value |
|----------|-------|
| Resource Group | RG-HospitalProject |
| Storage Account | sthospitalravindra01 |
| Region | Central India |
| Performance | Standard |
| Redundancy | LRS (Locally Redundant Storage) |
| Hierarchical Namespace | Enabled |
| Primary Service | Azure Data Lake Storage Gen2 |

---

# Storage Architecture

```
Hospital CSV Files
        │
        ▼
Azure Data Lake Storage Gen2
(sthospitalravindra01)
        │
        ▼
Container
hospital-data
```

---

# Implementation Steps

### Step 1

Sign in to the Azure Portal.

Navigate to:

```
Create a Resource
```

---

### Step 2

Search for:

```
Storage Account
```

Click **Create**.

---

### Step 3

Configure the Storage Account using the following settings:

| Setting | Value |
|----------|-------|
| Resource Group | RG-HospitalProject |
| Storage Account Name | sthospitalravindra01 |
| Region | Central India |
| Performance | Standard |
| Redundancy | LRS |
| Hierarchical Namespace | Enabled |

---

### Step 4

Review the configuration and click **Create**.

After deployment, verify that the Storage Account has been created successfully.

---

# Screenshot

**Storage Account Creation**

```
../screenshots/azure/create-storage-account.png
```

---

**Storage Account Overview**

```
../screenshots/azure/storage-account-overview.png
```

---

# Key Learning

Azure Data Lake Storage Gen2 acts as the landing zone for all raw datasets in the analytics pipeline. It enables Azure Data Factory to access structured CSV files efficiently before loading them into Snowflake.

---

# Interview Questions

### Why did you choose Azure Data Lake Storage Gen2 instead of Azure SQL Database?

Azure SQL Database is designed for structured relational data. In this project, the source data consisted of CSV files, making Azure Data Lake Storage Gen2 a more suitable choice for storing and processing raw files.

---

### Why not Azure Blob Storage?

Azure Blob Storage can also store files, but Azure Data Lake Storage Gen2 provides additional capabilities such as hierarchical namespace and is specifically optimized for analytics and ETL workloads.

---

### Why was Hierarchical Namespace enabled?

Enabling Hierarchical Namespace converts the storage account into Azure Data Lake Storage Gen2, allowing directories to be organized efficiently and improving compatibility with analytics services.

---

# Next Step

Proceed to **02_ADLS_Container.md** to create the container, upload the hospital datasets, and prepare the storage structure for Azure Data Factory.
