/*============================================================
 Project : Hospital Management Data Analytics Pipeline
 File    : 07_Data_Transformation.sql
 Purpose : Transform and load data from RAW → STAGING → CURATED
=============================================================*/

-- ==========================================================
-- Select Database
-- ==========================================================

USE DATABASE HOSPITAL_DB;

-- ==========================================================
-- Load Patients
-- ==========================================================

INSERT INTO STAGING.PATIENTS
SELECT DISTINCT
    TRIM(patient_id)                         AS patient_id,
    INITCAP(TRIM(first_name))                AS first_name,
    INITCAP(TRIM(last_name))                 AS last_name,
    UPPER(TRIM(gender))                      AS gender,
    date_of_birth,
    TRIM(contact_number)                     AS contact_number,
    TRIM(address)                            AS address,
    registration_date,
    TRIM(insurance_provider)                 AS insurance_provider,
    TRIM(insurance_number)                   AS insurance_number,
    LOWER(TRIM(email))                       AS email
FROM RAW.PATIENTS
WHERE patient_id IS NOT NULL;

-- ==========================================================
-- Load Doctors
-- ==========================================================

INSERT INTO STAGING.DOCTORS
SELECT DISTINCT
    TRIM(doctor_id)                          AS doctor_id,
    INITCAP(TRIM(first_name))                AS first_name,
    INITCAP(TRIM(last_name))                 AS last_name,
    INITCAP(TRIM(specialization))            AS specialization,
    TRIM(phone_number)                       AS phone_number,
    years_experience,
    INITCAP(TRIM(hospital_branch))           AS hospital_branch,
    LOWER(TRIM(email))                       AS email
FROM RAW.DOCTORS
WHERE doctor_id IS NOT NULL;

-- ==========================================================
-- Load Appointments
-- ==========================================================

INSERT INTO STAGING.APPOINTMENTS
SELECT DISTINCT
    TRIM(appointment_id)                     AS appointment_id,
    TRIM(patient_id)                         AS patient_id,
    TRIM(doctor_id)                          AS doctor_id,
    appointment_date,
    appointment_time,
    TRIM(reason_for_visit)                   AS reason_for_visit,
    UPPER(TRIM(status))                      AS status
FROM RAW.APPOINTMENTS
WHERE appointment_id IS NOT NULL;

-- ==========================================================
-- Load Treatments
-- ==========================================================

INSERT INTO STAGING.TREATMENTS
SELECT DISTINCT
    TRIM(treatment_id)                       AS treatment_id,
    TRIM(appointment_id)                     AS appointment_id,
    INITCAP(TRIM(treatment_type))            AS treatment_type,
    TRIM(description)                        AS description,
    cost,
    treatment_date
FROM RAW.TREATMENTS
WHERE treatment_id IS NOT NULL;

-- ==========================================================
-- Load Billing
-- ==========================================================

INSERT INTO STAGING.BILLING
SELECT DISTINCT
    TRIM(bill_id)                            AS bill_id,
    TRIM(patient_id)                         AS patient_id,
    TRIM(treatment_id)                       AS treatment_id,
    bill_date,
    amount,
    UPPER(TRIM(payment_method))              AS payment_method,
    UPPER(TRIM(payment_status))              AS payment_status
FROM RAW.BILLING
WHERE bill_id IS NOT NULL;

-- ==========================================================
-- Load CURATED Layer
-- ==========================================================

INSERT INTO CURATED.PATIENTS
SELECT * FROM STAGING.PATIENTS;

INSERT INTO CURATED.DOCTORS
SELECT * FROM STAGING.DOCTORS;

INSERT INTO CURATED.APPOINTMENTS
SELECT * FROM STAGING.APPOINTMENTS;

INSERT INTO CURATED.TREATMENTS
SELECT * FROM STAGING.TREATMENTS;

INSERT INTO CURATED.BILLING
SELECT * FROM STAGING.BILLING;