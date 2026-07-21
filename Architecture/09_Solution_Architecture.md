                                    Hospital Management Data Analytics Pipeline

┌──────────────────────────┐
│     Hospital CSV Files   │
│──────────────────────────│
│ • patients.csv           │
│ • doctors.csv            │
│ • appointments.csv       │
│ • treatments.csv         │
│ • billing.csv            │
└─────────────┬────────────┘
              │
              ▼
┌──────────────────────────────────────────────┐
│ Azure Data Lake Storage Gen2 (ADLS Gen2)     │
│──────────────────────────────────────────────│
│ Storage Account : sthospitalravindra01       │
│ Container       : hospital-data              │
└─────────────┬────────────────────────────────┘
              │
              │ Linked Service
              │ LS_ADLS_Hospital
              ▼
┌──────────────────────────────────────────────┐
│ Azure Data Factory                           │
│──────────────────────────────────────────────│
│ Pipeline : PL_Load_Hospital_Data             │
│                                              │
│ • Copy_Patients                              │
│ • Copy_Doctors                               │
│ • Copy_Appointments                          │
│ • Copy_Treatments                            │
│ • Copy_Billing                               │
└─────────────┬────────────────────────────────┘
              │
              │ Blob Staging
              │ LS_BLOB_STAGING
              ▼
┌──────────────────────────────────────────────┐
│ Azure Blob Storage                           │
│──────────────────────────────────────────────│
│ Temporary Staging Area                       │
└─────────────┬────────────────────────────────┘
              │
              │ Linked Service
              │ LS_SNOWFLAKE_HOSPITAL
              ▼
┌──────────────────────────────────────────────┐
│ Snowflake Data Warehouse                     │
│──────────────────────────────────────────────│
│ Warehouse : HOSPITAL_WH                      │
│ Database  : HOSPITAL_DB                      │
│                                              │
│ RAW      → Source Data                       │
│ STAGING  → Data Transformation               │
│ CURATED  → Analytics-Ready Data              │
└─────────────┬────────────────────────────────┘
              │
              ▼
┌──────────────────────────────────────────────┐
│ Power BI Desktop                             │
│──────────────────────────────────────────────│
│ • KPI Dashboard                              │
│ • Interactive Charts                         │
│ • Slicers & Filters                          │
│ • Business Insights                          │
└──────────────────────────────────────────────┘
