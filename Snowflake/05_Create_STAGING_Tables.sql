/*============================================================
 Project : Hospital Management Data Analytics Pipeline
 File    : 05_Create_STAGING_Tables.sql
 Purpose : Create STAGING tables using the structure of RAW tables
=============================================================*/

-- Select Database
USE DATABASE HOSPITAL_DB;

-- Select Schema
USE SCHEMA STAGING;

-- ==========================================================
-- Create STAGING Tables
-- ==========================================================

CREATE OR REPLACE TABLE PATIENTS
LIKE RAW.PATIENTS;

CREATE OR REPLACE TABLE DOCTORS
LIKE RAW.DOCTORS;

CREATE OR REPLACE TABLE APPOINTMENTS
LIKE RAW.APPOINTMENTS;

CREATE OR REPLACE TABLE TREATMENTS
LIKE RAW.TREATMENTS;

CREATE OR REPLACE TABLE BILLING
LIKE RAW.BILLING;