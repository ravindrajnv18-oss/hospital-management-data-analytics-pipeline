# 03. Azure Data Factory

## Objective

The objective of this step is to create an Azure Data Factory (ADF) instance that will orchestrate the movement of hospital management data from Azure Data Lake Storage Gen2 (ADLS Gen2) to Snowflake.

Azure Data Factory serves as the ETL orchestration service in this project.

---

# Business Requirement

The hospital management datasets are stored in Azure Data Lake Storage Gen2.

To automate the process of reading these datasets and loading them into Snowflake, a cloud-based orchestration service is required.

Azure Data Factory provides:

- Data movement
- Workflow orchestration
- Scheduling
- Pipeline monitoring
- Integration with multiple data sources

---

# Resource Details

| Property | Value |
|----------|-------|
| Resource Name | adfhospitalravindra01 |
| Service | Azure Data Factory (V2) |
| Resource Group | RG-HospitalProject |
| Region | Central India |

---

# Why Azure Data Factory?

Azure Data Factory is Microsoft's cloud-native ETL and data integration service.

It enables organizations to build automated data pipelines that move data between different storage systems, databases, and cloud platforms.

For this project, Azure Data Factory is responsible for moving hospital datasets from Azure Data Lake Storage Gen2 to Snowflake.

---

# Azure Data Factory Architecture

```text
Azure Data Lake Storage Gen2
        │
        ▼
Azure Data Factory
        │
        ▼
Snowflake
```

---

# Implementation Steps

## Step 1

Sign in to Azure Portal.

Navigate to

```
Create a Resource
```

---

## Step 2

Search for

```
Azure Data Factory
```

Click **Create**.

---

## Step 3

Configure the Data Factory.

| Setting | Value |
|----------|-------|
| Name | adfhospitalravindra01 |
| Resource Group | RG-HospitalProject |
| Version | V2 |
| Region | Central India |

---

## Step 4

Review the configuration and click **Create**.

---

## Step 5

After deployment, open

```
Launch Studio
```

Azure Data Factory Studio opens.

---

# ADF Studio

Azure Data Factory Studio provides four major options.

| Feature | Purpose | Used in this Project |
|----------|----------|----------------------|
| Ingest | Guided data ingestion wizard | ❌ No |
| Orchestrate | Build custom ETL pipelines | ✅ Yes |
| Transform Data | Create Mapping Data Flows | ❌ No |
| Configure SSIS | Execute SSIS Packages | ❌ No |

---

# Why Orchestrate?

This project required complete control over the ETL workflow.

Instead of using the guided ingestion wizard, the pipeline was built manually using:

- Linked Services
- Datasets
- Copy Activities
- Pipeline
- Trigger
- Monitor

This approach provides better understanding of Azure Data Factory components.

---

# Screenshots

Azure Data Factory Creation

```
../screenshots/azure/create-adf.png
```

---

# Outcome

Azure Data Factory was successfully created.

ADF Studio is now ready for building Linked Services, Datasets, and ETL Pipelines.

---

# Key Learning

Azure Data Factory is not a data storage service.

It is an orchestration service that automates the movement and integration of data between different systems.

---

# Interview Questions

### What is Azure Data Factory?

Azure Data Factory is Microsoft's cloud-based ETL and data integration service used to orchestrate and automate data movement between various data sources and destinations.

---

### Is Azure Data Factory a Database?

No.

Azure Data Factory does not store business data.

It manages and orchestrates workflows for moving and transforming data.

---

### Why did you use Orchestrate instead of Ingest?

The objective of this project was to build an ETL pipeline manually using Linked Services, Datasets, and Copy Activities. Using Orchestrate provided better control and a deeper understanding of Azure Data Factory.

---

### What is the role of Azure Data Factory in this project?

Azure Data Factory reads hospital datasets from Azure Data Lake Storage Gen2 and loads them into Snowflake using automated Copy Activities.

---

# Next Step

Proceed to **04_Linked_Services.md** to configure secure connections between Azure Data Factory, Azure Data Lake Storage Gen2, Azure Blob Storage, and Snowflake.
