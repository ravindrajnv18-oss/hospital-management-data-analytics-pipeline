/*============================================================
 Project : Hospital Management Data Analytics Pipeline
 File    : 04_Create_RAW_Tables.sql
 Purpose : Create STAGING tables using the structure of RAW tables
=============================================================*/


USE DATABASE HOSPITAL_DB;

USE SCHEMA RAW;

    ---create patiennts table--
    CREATE TABLE RAW.PATIENTS(
    patient_id varchar(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(20),
    date_of_birth DATE,
    contact_number varchar(100),
    address VARCHAR(255),
    registration_date DATE,
    insurance_provider VARCHAR(100),
    insurance_number varchar(100),
    email VARCHAR(100));
    


---CREATE DOCTOR TABLE
    CREATE TABLE RAW.DOCTORS(
    doctor_id varchar(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    specialization VARCHAR(100),
    phone_number VARCHAR(100),
    years_experience NUMBER,
    hospital_branch VARCHAR(100),
    email VARCHAR(100));


---CREATE APPONTMENTS TABLE
    CREATE TABLE RAW.APPOINTMENTS(
    appointment_id varchar(100),
    patient_id varchar(100),
    doctor_id varchar(100),
    appointment_date DATE,
    appointment_time TIME,
    reason_for_visit VARCHAR(100),
    status VARCHAR(100));
    
    
 -----CREATE BILLING TABLE   
    CREATE TABLE RAW.BILLING(
        bill_id VARCHAR(100),
        patient_id varchar(100),
        treatment_id varchar(100),
        bill_date DATE,
        amount NUMBER(10,2),
        payment_method VARCHAR(100),
        payment_status VARCHAR(100)
        );

    
    CREATE TABLE RAW.TREATMENTS(
    treatment_id varchar(100),
    appointment_id varchar(100),
    treatment_type VARCHAR(100),
    description VARCHAR(255),
    cost NUMBER(10,2),
    treatment_date DATE);
    
    
    