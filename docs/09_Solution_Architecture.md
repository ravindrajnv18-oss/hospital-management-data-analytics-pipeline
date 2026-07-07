# 09. Solution Architecture

## Overview

This project demonstrates an end-to-end cloud-based data analytics pipeline using Microsoft Azure, Snowflake, SQL, and Power BI.

The solution is designed to ingest raw hospital management datasets, orchestrate data movement, store data in a cloud data warehouse, and generate business insights through interactive dashboards.

---

# Solution Architecture

```

                Hospital Management CSV Files
                           │
                           ▼
        Azure Data Lake Storage Gen2 (ADLS Gen2)
                           │
                           ▼
              Azure Data Factory (ADF Pipeline)
                           │
           ┌───────────────┴────────────────┐
           │                                │
           ▼                                ▼
   Blob Storage Staging             Pipeline Monitoring
           │
           ▼
                  Snowflake Data Warehouse
                           │
        ┌──────────┬──────────┬──────────┐
        ▼          ▼          ▼
      RAW      STAGING     CURATED
                           │
                           ▼
                    Power BI Dashboard
                           │
                           ▼
                    Business Insights

```

---

# Technology Stack

| Layer | Technology |
|---------|------------|
| Cloud Platform | Microsoft Azure |
| Storage | Azure Data Lake Storage Gen2 |
| ETL | Azure Data Factory |
| Temporary Storage | Azure Blob Storage |
| Data Warehouse | Snowflake |
| Query Language | SQL |
| Business Intelligence | Power BI |
| Version Control | Git & GitHub |

---

# Data Flow

## Step 1

Hospital management CSV files are uploaded into Azure Data Lake Storage Gen2.

---

## Step 2

Azure Data Factory reads the source files using

```
LS_ADLS_Hospital
```

---

## Step 3

Copy Activities use Blob Storage staging through

```
LS_BLOB_STAGING
```

to optimize data movement.

---

## Step 4

Azure Data Factory loads data into Snowflake using

```
LS_SNOWFLAKE_HOSPITAL
```

---

## Step 5

Snowflake stores data inside

```
RAW
```

```
STAGING
```

```
CURATED
```

schemas.

---

## Step 6

Power BI connects to Snowflake and generates interactive dashboards.

---

# Azure Resources Used

| Resource | Name |
|-----------|------|
| Resource Group | RG-HospitalProject |
| Storage Account | sthospitalravindra01 |
| Container | hospital-data |
| Azure Data Factory | adfhospitalravindra01 |

---

# Snowflake Resources

| Component | Name |
|-----------|------|
| Warehouse | HOSPITAL_WH |
| Database | HOSPITAL_DB |
| Schemas | RAW, STAGING, CURATED |

---

# Authentication

| Service | Authentication |
|----------|---------------|
| ADLS Gen2 | Account Key |
| Blob Storage | SAS URI |
| Snowflake | Basic Authentication |

---

# Design Decisions

### Why Azure Data Lake Storage Gen2?

Optimized for analytics workloads and seamless integration with Azure Data Factory.

---

### Why Azure Data Factory?

Cloud-native ETL orchestration platform.

---

### Why Blob Storage Staging?

Provides temporary storage during data movement into Snowflake.

---

### Why Snowflake?

Scalable cloud-native data warehouse with separation of compute and storage.

---

### Why Power BI?

Interactive dashboards and business reporting.

---

# End-to-End Workflow

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
Snowflake RAW
      │
      ▼
Snowflake STAGING
      │
      ▼
Snowflake CURATED
      │
      ▼
Power BI Dashboard

```

---

# Project Highlights

✔ End-to-End Cloud Analytics Pipeline

✔ Azure Data Lake Storage Gen2

✔ Azure Data Factory

✔ Snowflake Data Warehouse

✔ SQL

✔ Power BI

✔ GitHub Documentation

---

# Future Enhancements

Future improvements could include:

- Azure Key Vault
- Managed Identity
- Parameterized Pipelines
- Incremental Data Loading
- CI/CD Integration
- Pipeline Scheduling
- Data Quality Validation
- Automated Monitoring

---

# Key Learning

This project demonstrates the complete lifecycle of a modern cloud-based data analytics solution, starting from raw CSV files and ending with interactive business dashboards.

