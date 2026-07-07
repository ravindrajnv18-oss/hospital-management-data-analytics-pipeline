# 08. Power BI Dashboard

## Objective

The objective of this phase is to connect Power BI with Snowflake and build interactive dashboards for hospital management reporting.

Power BI acts as the Business Intelligence (BI) layer of the project, enabling users to analyze hospital data through interactive visualizations and KPIs.

---

# Why Power BI?

Power BI is Microsoft's Business Intelligence platform used for:

- Data visualization
- Interactive dashboards
- KPI reporting
- Business analytics
- Executive reporting

In this project, Power BI consumes data from Snowflake and transforms it into meaningful business insights.

---

# Project Architecture

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

# Power BI Workflow

```
Snowflake
      │
      ▼
Power BI Desktop
      │
      ▼
Data Model
      │
      ▼
DAX Measures
      │
      ▼
Dashboard
```

---

# Data Source

| Property | Value |
|----------|-------|
| Source | Snowflake |
| Database | HOSPITAL_DB |
| Schema | CURATED |
| Connection | Snowflake Connector |

---

# Dashboard Development Process

## Step 1

Connect Power BI Desktop to Snowflake.

---

## Step 2

Import required tables.

---

## Step 3

Build the data model.

---

## Step 4

Create relationships.

---

## Step 5

Create DAX Measures.

---

## Step 6

Build interactive dashboard visuals.

---

# Dashboard Components

The dashboard includes:

- KPI Cards
- Bar Charts
- Line Charts
- Pie Charts
- Tables
- Slicers
- Filters

---

# Business Insights

The dashboard can answer questions such as:

- Total Patients
- Total Doctors
- Appointment Trends
- Revenue Analysis
- Treatment Analysis
- Billing Summary

---

# Power BI Features Used

| Feature | Purpose |
|----------|----------|
| Power Query | Data preparation |
| Data Model | Relationships |
| DAX | Calculated measures |
| Slicers | Interactive filtering |
| Visualizations | Business reporting |

---

# Screenshots

Dashboard

```
../screenshots/powerbi/dashboard.png
```

Data Model

```
../screenshots/powerbi/data-model.png
```

Visualizations

```
../screenshots/powerbi/visuals.png
```

---

# Real Project Notes

✔ Connected Power BI to Snowflake.

✔ Imported hospital datasets.

✔ Created relationships.

✔ Developed interactive dashboard.

✔ Used DAX measures for business KPIs.

---

# Key Learning

Power BI transforms structured warehouse data into meaningful business insights using data modeling, DAX calculations, and interactive visualizations.

---

# Interview Questions

### Why connect Power BI to Snowflake?

Snowflake acts as the centralized analytical database. Connecting Power BI directly to Snowflake ensures reports are generated from a single, reliable source of truth.

---

### What is DAX?

DAX (Data Analysis Expressions) is the formula language used in Power BI to create calculated columns, measures, and business metrics.

---

### Why create relationships?

Relationships connect tables based on common keys, allowing accurate filtering, aggregation, and analysis across multiple datasets.

---

### Difference between Power Query and DAX?

| Power Query | DAX |
|-------------|-----|
| Used before loading data | Used after loading data |
| Data cleaning & transformation | Business calculations |
| ETL | Analytics |

---

# Next Step

Proceed to **09_Project_Architecture.md** for the complete end-to-end solution architecture.
