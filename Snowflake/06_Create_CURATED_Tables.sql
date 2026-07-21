/*============================================================
 Project : Hospital Management Data Analytics Pipeline
 File    : 06_Create_CURATED_Tables.sql
 Purpose : Create CURATED tables using the structure of STAGING tables
=============================================================*/

-- ==========================================================
-- Select Database and Schema
-- ==========================================================

USE DATABASE HOSPITAL_DB;
USE SCHEMA CURATED;

-- ==========================================================
-- Create CURATED Tables
-- ==========================================================

CREATE OR REPLACE TABLE PATIENTS
LIKE STAGING.PATIENTS;

CREATE OR REPLACE TABLE DOCTORS
LIKE STAGING.DOCTORS;

CREATE OR REPLACE TABLE APPOINTMENTS
LIKE STAGING.APPOINTMENTS;

CREATE OR REPLACE TABLE TREATMENTS
LIKE STAGING.TREATMENTS;

CREATE OR REPLACE TABLE BILLING
LIKE STAGING.BILLING;