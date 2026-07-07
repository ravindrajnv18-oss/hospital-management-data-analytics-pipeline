# 10. Interview Guide

## Project Summary

This project demonstrates an end-to-end cloud-based Data Analytics Pipeline using Microsoft Azure, Snowflake, SQL, and Power BI.

The solution ingests hospital management CSV files into Azure Data Lake Storage Gen2, orchestrates data movement using Azure Data Factory, stores data in Snowflake, and visualizes business insights through Power BI dashboards.

---

# Project Flow

```
CSV Files
    │
    ▼
Azure Data Lake Storage Gen2
    │
    ▼
Azure Data Factory
    │
    ▼
Blob Storage Staging
    │
    ▼
Snowflake
    │
    ▼
Power BI
```

---

# Technologies Used

| Technology | Purpose |
|------------|---------|
| Azure Data Lake Storage Gen2 | Source Data Storage |
| Azure Data Factory | ETL Orchestration |
| Azure Blob Storage | Temporary Staging |
| Snowflake | Cloud Data Warehouse |
| SQL | Data Querying |
| Power BI | Dashboard & Reporting |
| GitHub | Documentation & Version Control |

---

# Frequently Asked Interview Questions

## Azure

### Why did you choose Azure Data Lake Storage Gen2?

Because the source data consisted of CSV files. ADLS Gen2 is optimized for analytics workloads, supports hierarchical namespaces, and integrates seamlessly with Azure Data Factory.

---

### Why didn't you use Azure SQL Database?

Azure SQL Database is designed for structured relational data.

Our project started with raw CSV files, making ADLS Gen2 a better landing zone.

---

### Why not Azure Blob Storage?

Blob Storage stores files effectively, but ADLS Gen2 adds hierarchical namespace support and is better suited for analytics and ETL scenarios.

---

### What is Azure Data Factory?

Azure Data Factory is Microsoft's cloud-based ETL and data integration service used to orchestrate data movement between different systems.

---

### Difference between Pipeline, Dataset and Linked Service?

| Component | Purpose |
|-----------|----------|
| Linked Service | Connection to external system |
| Dataset | Metadata describing the data |
| Pipeline | Workflow containing activities |

---

### What is Copy Activity?

Copy Activity is used to move data from one data source to another.

---

### Why did you enable Blob Staging?

Blob Storage staging provides temporary storage during data movement into Snowflake.

---

### Why did you use SAS URI?

SAS URI provides temporary, controlled access without exposing the Storage Account Key.

---

### Why didn't you use Managed Identity?

This was a learning and portfolio project focused on understanding Azure Data Factory and ETL concepts. In a production environment, Managed Identity or Azure Key Vault would be preferred.

---

# Snowflake

### What is a Warehouse?

A Warehouse is the compute engine responsible for executing SQL queries and loading data.

---

### Does Warehouse store data?

No.

It provides compute resources only.

---

### Where is data stored?

```
Database
     │
     ▼
Schema
     │
     ▼
Table
```

---

### Why create RAW, STAGING and CURATED schemas?

To separate raw data, transformation logic, and analytics-ready data.

---

### Why XSMALL Warehouse?

The project dataset was relatively small, so an XSMALL warehouse provided sufficient compute while minimizing cost.

---

# Power BI

### Why connect Power BI with Snowflake?

Snowflake serves as the central analytical database, allowing Power BI to generate reports from a single source of truth.

---

### Difference between Power Query and DAX?

| Power Query | DAX |
|-------------|-----|
| Data preparation | Business calculations |
| Runs before data load | Runs after data load |

---

### What is DAX?

DAX (Data Analysis Expressions) is the formula language used in Power BI for creating measures, calculated columns, and KPIs.

---

# SQL

### What SQL concepts were used?

- DDL
- DML
- Constraints
- Joins
- Aggregations
- Window Functions
- CTEs
- Views

---

# Project Challenges

## Challenge 1

Authentication between Azure Data Factory and Snowflake.

**Solution**

Configured a Snowflake Linked Service using Basic Authentication.

---

## Challenge 2

Understanding Blob Storage staging.

**Solution**

Configured Azure Blob Storage with SAS URI authentication and enabled staging in the Copy Activity.

---

## Challenge 3

Selecting the correct Azure storage service.

**Solution**

Evaluated Azure Storage options and selected ADLS Gen2 because the project used CSV files as the source data.

---

# Key Learnings

- Azure Storage
- Azure Data Factory
- Linked Services
- Datasets
- Pipelines
- Blob Storage Staging
- Snowflake
- SQL
- Power BI
- End-to-End ETL Architecture

---

# Future Improvements

- Managed Identity
- Azure Key Vault
- Incremental Loading
- Parameterized Pipelines
- CI/CD with Azure DevOps or GitHub Actions
- Monitoring and Alerts

---

# Conclusion

This project demonstrates a complete cloud-based analytics workflow from raw CSV files to business dashboards.

It highlights practical implementation of Azure Data Factory, Azure Data Lake Storage Gen2, Snowflake, SQL, and Power BI while following modern cloud data engineering and analytics practices.
