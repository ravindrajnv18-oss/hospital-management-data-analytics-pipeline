# 05. Azure Data Factory - Datasets

## Objective

The objective of this step is to create Azure Data Factory Datasets that define the source files stored in Azure Data Lake Storage Gen2.

Datasets act as references to the actual data that Azure Data Factory reads during pipeline execution.

---

# What is a Dataset?

A Dataset is a named object in Azure Data Factory that describes the structure and location of data.

A Dataset does not store any data.

Instead, it tells Azure Data Factory:

- Where the data is located
- Which Linked Service should be used
- File format
- Container
- Directory
- File Name

Think of it as a pointer to a data source.

---

# Why are Datasets Required?

Azure Data Factory cannot directly access a file.

The process is:

```
Linked Service
        │
        ▼
Dataset
        │
        ▼
Copy Activity
```

The Linked Service establishes the connection.

The Dataset tells Azure Data Factory exactly which file to read.

---

# Dataset Architecture

```
Azure Data Factory
        │
        ▼
Linked Service
(LS_ADLS_Hospital)
        │
        ▼
Dataset
        │
        ▼
patients.csv
```

---

# Datasets Created

| Dataset | Source File | Linked Service |
|----------|-------------|----------------|
| DS_PATIENTS | patients.csv | LS_ADLS_Hospital |
| DS_DOCTORS | doctors.csv | LS_ADLS_Hospital |
| DS_APPOINTMENTS | appointments.csv | LS_ADLS_Hospital |
| DS_BILLING | billing.csv | LS_ADLS_Hospital |
| DS_TREATMENTS | treatments.csv | LS_ADLS_Hospital |

---

# Why Create Separate Datasets?

Each hospital CSV file contains different business entities.

Creating separate datasets provides:

- Better maintainability
- Reusability
- Easier debugging
- Independent pipeline activities

---

# Dataset Configuration

Each Dataset was configured using:

| Property | Value |
|----------|-------|
| Linked Service | LS_ADLS_Hospital |
| File Format | Delimited Text (CSV) |
| Container | hospital-data |
| Encoding | UTF-8 |
| First Row as Header | Yes |

---

# Implementation Steps

### Step 1

Open Azure Data Factory Studio.

Navigate to

```
Author
```

---

### Step 2

Select

```
Datasets
```

---

### Step 3

Click

```
New Dataset
```

---

### Step 4

Choose

```
Azure Data Lake Storage Gen2
```

---

### Step 5

Choose

```
Delimited Text
```

---

### Step 6

Select Linked Service

```
LS_ADLS_Hospital
```

---

### Step 7

Browse to

```
hospital-data
```

Select the required CSV file.

---

### Step 8

Repeat the process for all hospital datasets.

---

# Screenshots

Create Dataset

```
../screenshots/azure/create-dataset.png
```

Dataset Configuration

```
../screenshots/azure/dataset-configuration.png
```

Datasets

```
../screenshots/azure/datasets.png
```

---

# Real Project Notes

✔ Created five Azure Data Factory Datasets.

✔ Each Dataset points to one CSV file.

✔ All Datasets use the same Linked Service:

```
LS_ADLS_Hospital
```

✔ File format:

```
Delimited Text (CSV)
```

---

# Key Learning

A Dataset does not store data.

It simply tells Azure Data Factory where the source file is located and how it should be interpreted.

---

# Interview Questions

### What is a Dataset?

A Dataset is a metadata object in Azure Data Factory that defines the location and structure of the source or destination data.

---

### Does a Dataset store data?

No.

It only contains metadata about the data source.

---

### Why create multiple datasets?

Each CSV file represents a different business entity and can be reused independently across pipelines.

---

### Difference between Linked Service and Dataset?

| Linked Service | Dataset |
|----------------|----------|
| Creates the connection | Identifies the data |
| Stores authentication | Stores metadata |
| Connects to Storage | Points to a specific file |

---

# Next Step

Proceed to **06_Pipeline.md** to build the ETL pipeline using Copy Activities.
