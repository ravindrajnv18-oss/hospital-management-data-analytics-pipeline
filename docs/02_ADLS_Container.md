# 02. Azure Data Lake Storage (ADLS) Container

## Objective

After creating the Azure Data Lake Storage Gen2 account, the next step is to create a container for storing the hospital management datasets.

The container acts as the logical storage location where all source files are uploaded before they are processed by Azure Data Factory.

---

# Business Requirement

The Hospital Management System generates multiple datasets such as:

- Patients
- Doctors
- Appointments
- Billing
- Treatments

These datasets should be stored in a centralized location so that Azure Data Factory can access them during the ETL process.

---

# Container Details

| Property | Value |
|----------|-------|
| Storage Account | sthospitalravindra01 |
| Container | hospital-data |
| Storage Type | Azure Data Lake Storage Gen2 |

---

# Container Structure

```text
Storage Account
sthospitalravindra01
│
└── hospital-data
      │
      ├── patients.csv
      ├── doctors.csv
      ├── appointments.csv
      ├── billing.csv
      ├── treatments.csv
      │
      └── STAGING/
```

---

# Why Create a Container?

A container is used to organize files inside the storage account.

Benefits include:

- Logical organization of datasets
- Easy integration with Azure Data Factory
- Centralized storage for raw data
- Scalable storage architecture

---

# Why Create the STAGING Directory?

The STAGING directory is reserved for temporary or intermediate files during data movement.

Although Azure Data Factory uses a Blob Storage linked service for staging during the Copy Activity, having a dedicated staging directory helps organize data and follows common ETL design practices.

> **Note:** In this project, the ADF Copy Activity uses `LS_BLOB_STAGING` (Azure Blob Storage with SAS URI authentication) for staging. The `STAGING` directory in ADLS is part of the storage organization and should not be confused with the ADF staging linked service.

---

# Source Dataset

The following datasets were uploaded:

| File Name | Description |
|-----------|-------------|
| patients.csv | Patient information |
| doctors.csv | Doctor details |
| appointments.csv | Appointment records |
| billing.csv | Billing transactions |
| treatments.csv | Treatment details |

---

# Implementation Steps

### Step 1

Open the Azure Storage Account.

```
sthospitalravindra01
```

---

### Step 2

Navigate to

```
Data Storage → Containers
```

---

### Step 3

Create a new container.

Container Name

```
hospital-data
```

---

### Step 4

Upload all hospital management CSV files.

---

### Step 5

Create the directory

```
STAGING
```

inside the container.

---

# Screenshots

Container Creation

```
../screenshots/azure/create-container.png
```

Dataset Upload

```
../screenshots/azure/upload-dataset.png
```

---

# Outcome

Successfully created the `hospital-data` container and uploaded the hospital management datasets.

The source data is now ready for Azure Data Factory.

---

# Interview Questions

### What is the purpose of a container?

A container is a logical storage unit inside an Azure Storage Account used to organize blobs (files).

---

### Why did you create a STAGING directory?

The STAGING directory provides a structured location for temporary or intermediate data as part of the overall storage organization. In this project, the actual Copy Activity staging is configured through the `LS_BLOB_STAGING` linked service in Azure Data Factory.

---

### Why upload CSV files instead of directly loading into Snowflake?

Keeping the raw files in Azure Data Lake Storage provides a reusable landing zone, allowing the same source data to be processed multiple times and supporting an ETL workflow.

---

# Next Step

Proceed to **03_Azure_Data_Factory.md** to create Azure Data Factory and prepare the ETL orchestration environment.
