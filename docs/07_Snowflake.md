# 07. Snowflake Data Warehouse

## Objective

The objective of this phase is to create the Snowflake data warehouse environment that stores hospital management data loaded from Azure Data Factory.

Snowflake serves as the centralized analytical database where hospital datasets are stored, queried, and prepared for reporting in Power BI.

---

# Why Snowflake?

Snowflake is a cloud-native data warehouse designed for analytics workloads.

It provides:

- High performance
- Automatic scaling
- Separation of compute and storage
- Secure data sharing
- SQL-based analytics

In this project, Snowflake stores all hospital datasets after they are loaded from Azure Data Factory.

---

# Snowflake Architecture

```
Azure Data Lake Storage Gen2
        │
        ▼
Azure Data Factory
        │
        ▼
Snowflake
        │
        ▼
Power BI
```

---

# Snowflake Components Used

| Component | Purpose |
|-----------|---------|
| Warehouse | Compute resource |
| Database | Logical data storage |
| Schema | Organize tables |
| Tables | Store hospital data |

---

# Warehouse

Warehouse Name

```
HOSPITAL_WH
```

Purpose

Provides compute resources for executing SQL queries and loading data.

Configuration

| Property | Value |
|----------|-------|
| Warehouse | HOSPITAL_WH |
| Size | XSMALL |
| Auto Resume | TRUE |
| Auto Suspend | 60 Seconds |

---

# Why XSMALL?

The project contains a small dataset.

Using an XSMALL warehouse minimizes cloud costs while providing sufficient compute resources.

---

# Database

Database Name

```
HOSPITAL_DB
```

Purpose

Stores all hospital-related schemas and tables.

---

# Schemas

Three schemas were created.

| Schema | Purpose |
|---------|----------|
| RAW | Raw imported data |
| STAGING | Intermediate processing |
| CURATED | Analytics-ready data |

---

# Why Three Schemas?

Following a layered architecture improves data organization.

```
RAW
 │
 ▼
STAGING
 │
 ▼
CURATED
```

Benefits

- Raw data remains unchanged.
- Transformations occur separately.
- Reporting uses clean curated data.

---

# Tables

RAW Schema Tables

```
PATIENTS

DOCTORS

APPOINTMENTS

BILLING

TREATMENTS
```

Each table corresponds to one CSV dataset.

---

# Data Loading

Azure Data Factory loads the hospital datasets into the RAW schema.

```
Azure Data Factory
        │
        ▼
Snowflake RAW Tables
```

---

# SQL Objects Created

✔ Warehouse

✔ Database

✔ Schemas

✔ Tables

---
# SQL Scripts

The complete Snowflake implementation is available in the `sql/` directory.

```text
sql/
├── 01_Create_Warehouse.sql
├── 02_Create_Database.sql
├── 03_Create_Schemas.sql
├── 04_Create_RAW_Tables.sql
├── 05_Create_STAGING_Tables.sql
├── 06_Create_CURATED_Tables.sql
├── 07_Data_Transformation.sql
└── 08_Data_Validation.sql


# Real Project Notes

Warehouse

```
HOSPITAL_WH
```

Database

```
HOSPITAL_DB
```

Schemas

```
RAW

STAGING

CURATED
```

Five RAW tables created.

Azure Data Factory loads data into RAW.

---

# Key Learning

Snowflake separates storage and compute.

The Warehouse provides compute.

The Database stores logical objects.

Schemas organize business data.

Tables store the actual records.

---

# Interview Questions

### What is a Warehouse?

A Warehouse is the compute engine in Snowflake that executes SQL queries and data loading operations.

---

### Does Warehouse store data?

No.

It only provides compute resources.

---

### What stores the data?

The Database stores Schemas.

Schemas contain Tables.

Tables store the data.

---

### Why create RAW, STAGING and CURATED schemas?

It follows modern Data Warehouse architecture.

RAW stores original data.

STAGING is used for transformations.

CURATED stores analytics-ready data.

---

### Why did you choose XSMALL Warehouse?

The dataset is small.

Using an XSMALL warehouse reduces compute cost while providing adequate performance.

---

# Next Step

Proceed to **08_PowerBI.md** to connect Power BI with Snowflake and build interactive dashboards.
