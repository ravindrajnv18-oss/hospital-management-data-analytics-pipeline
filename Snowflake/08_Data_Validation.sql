/*============================================================
 Project : Hospital Management Data Analytics Pipeline
 File    : 08_Data_Validation.sql
 Purpose : Validate data after ETL process
=============================================================*/

-- ==========================================================
-- Select Database
-- ==========================================================

USE DATABASE HOSPITAL_DB;

-- ==========================================================
-- Record Count Validation
-- ==========================================================

SELECT 'RAW.PATIENTS' AS table_name, COUNT(*) AS record_count
FROM RAW.PATIENTS

UNION ALL

SELECT 'STAGING.PATIENTS', COUNT(*)
FROM STAGING.PATIENTS

UNION ALL

SELECT 'CURATED.PATIENTS', COUNT(*)
FROM CURATED.PATIENTS;

--------------------------------------------------------------

SELECT 'RAW.DOCTORS' AS table_name, COUNT(*) AS record_count
FROM RAW.DOCTORS

UNION ALL

SELECT 'STAGING.DOCTORS', COUNT(*)
FROM STAGING.DOCTORS

UNION ALL

SELECT 'CURATED.DOCTORS', COUNT(*)
FROM CURATED.DOCTORS;

--------------------------------------------------------------

SELECT 'RAW.APPOINTMENTS' AS table_name, COUNT(*) AS record_count
FROM RAW.APPOINTMENTS

UNION ALL

SELECT 'STAGING.APPOINTMENTS', COUNT(*)
FROM STAGING.APPOINTMENTS

UNION ALL

SELECT 'CURATED.APPOINTMENTS', COUNT(*)
FROM CURATED.APPOINTMENTS;

--------------------------------------------------------------

SELECT 'RAW.TREATMENTS' AS table_name, COUNT(*) AS record_count
FROM RAW.TREATMENTS

UNION ALL

SELECT 'STAGING.TREATMENTS', COUNT(*)
FROM STAGING.TREATMENTS

UNION ALL

SELECT 'CURATED.TREATMENTS', COUNT(*)
FROM CURATED.TREATMENTS;

--------------------------------------------------------------

SELECT 'RAW.BILLING' AS table_name, COUNT(*) AS record_count
FROM RAW.BILLING

UNION ALL

SELECT 'STAGING.BILLING', COUNT(*)
FROM STAGING.BILLING

UNION ALL

SELECT 'CURATED.BILLING', COUNT(*)
FROM CURATED.BILLING;

-- ==========================================================
-- Sample Data Validation
-- ==========================================================

SELECT * FROM CURATED.PATIENTS LIMIT 10;

SELECT * FROM CURATED.DOCTORS LIMIT 10;

SELECT * FROM CURATED.APPOINTMENTS LIMIT 10;

SELECT * FROM CURATED.TREATMENTS LIMIT 10;

SELECT * FROM CURATED.BILLING LIMIT 10;