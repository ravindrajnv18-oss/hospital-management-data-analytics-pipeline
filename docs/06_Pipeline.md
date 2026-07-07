# 06. Azure Data Factory - Pipeline

## Objective

The objective of this step is to build an ETL pipeline in Azure Data Factory that automates the movement of hospital management datasets from Azure Data Lake Storage Gen2 (ADLS Gen2) into Snowflake.

The pipeline orchestrates the complete data movement process using Copy Activities.

---

# What is a Pipeline?

A Pipeline is a logical container in Azure Data Factory that groups one or more activities together to perform a specific workflow.

In this project, the pipeline automates the loading of hospital datasets into Snowflake.

---

# Pipeline Details

| Property | Value |
|----------|-------|
| Pipeline Name | PL_Load_Hospital_Data |
| Activity Type | Copy Activity |
| Source | Azure Data Lake Storage Gen2 |
| Destination | Snowflake |

---

# Pipeline Architecture

```text
Azure Data Lake Storage Gen2
        │
        ▼
Azure Data Factory
PL_Load_Hospital_Data
        │
        ▼
Copy Activities
        │
        ▼
Snowflake
```

---

# Activities Created

The pipeline consists of five Copy Activities.

| Activity | Source File | Destination Table |
|----------|-------------|-------------------|
| Copy_Patients | patients.csv | RAW.PATIENTS |
| Copy_Doctors | doctors.csv | RAW.DOCTORS |
| Copy_Appointments | appointments.csv | RAW.APPOINTMENTS |
| Copy_Billing | billing.csv | RAW.BILLING |
| Copy_Treatments | treatments.csv | RAW.TREATMENTS |

---

# Copy Activity Configuration

Each Copy Activity follows the same configuration.

## Source

| Property | Value |
|----------|-------|
| Linked Service | LS_ADLS_Hospital |
| Dataset | Corresponding Dataset |
| File Format | CSV |

---

## Staging

| Property | Value |
|----------|-------|
| Enabled | Yes |
| Linked Service | LS_BLOB_STAGING |
| Storage Path | hospital-data |

---

## Sink

| Property | Value |
|----------|-------|
| Linked Service | LS_SNOWFLAKE_HOSPITAL |
| Database | HOSPITAL_DB |
| Schema | RAW |
| Table | Corresponding Table |

---

# Data Flow

```text
patients.csv
        │
        ▼
Azure Data Lake Storage Gen2
        │
        ▼
LS_ADLS_Hospital
        │
        ▼
Dataset
        │
        ▼
Copy Activity
        │
        ▼
Blob Staging
LS_BLOB_STAGING
        │
        ▼
LS_SNOWFLAKE_HOSPITAL
        │
        ▼
Snowflake RAW Table
```

The same workflow is repeated for all five datasets.

---

# Pipeline Execution

After configuring all Copy Activities:

1. Validate the pipeline.
2. Run using **Debug**.
3. Verify successful execution.
4. Publish all changes.
5. Execute the pipeline.
6. Monitor the pipeline run.

---

# Monitoring

Pipeline execution is monitored from the **Monitor** section of Azure Data Factory.

Information available includes:

- Pipeline Status
- Activity Status
- Start Time
- End Time
- Duration
- Error Details
- Execution History

---

# Screenshots

Pipeline

```
../screenshots/azure/pipeline.png
```

Copy Activity

```
../screenshots/azure/copy-activity.png
```

Pipeline Monitor

```
../screenshots/azure/pipeline-monitor.png
```

---

# Real Project Notes

✔ Created one pipeline:

```
PL_Load_Hospital_Data
```

✔ Added five Copy Activities.

✔ Enabled Blob Storage staging.

✔ Loaded data into Snowflake RAW tables.

✔ Successfully validated and executed the pipeline.

---

# Key Learning

A Pipeline is responsible for orchestrating the ETL workflow.

It coordinates Linked Services, Datasets, and Activities to automate data movement from source to destination.

---

# Interview Questions

### What is a Pipeline?

A Pipeline is a workflow in Azure Data Factory that contains one or more activities to perform a data integration task.

---

### Why did you use Copy Activity?

Copy Activity is used to move data from one data store to another.

In this project, it copies CSV files from Azure Data Lake Storage Gen2 into Snowflake.

---

### Why was Blob Staging enabled?

Blob Storage staging provides temporary storage during data movement, improving compatibility and reliability when loading data into Snowflake.

---

### What happens when you click Debug?

Debug executes the pipeline without publishing it, allowing validation of configurations and testing before deployment.

---

### What is the difference between Debug and Trigger?

| Debug | Trigger |
|--------|----------|
| Used for testing | Used for production execution |
| Temporary run | Scheduled or manual execution |
| Does not require publishing | Runs the published pipeline |

---

# Next Step

Proceed to **07_Snowflake.md** to create the Snowflake Warehouse, Database, Schemas, Tables, and load the hospital datasets.
