-- =====================================================
-- HEALTHCARE DATA ANALYSIS PROJECT
-- SQL + Data Cleaning + Business Analysis
-- =====================================================

USE healthcare;

-- =====================================================
-- DATA CLEANING
-- =====================================================

SET SQL_SAFE_UPDATES = 0;

-- 1. Ensure Correct Data Types

ALTER TABLE healthcare
MODIFY name VARCHAR(255),
MODIFY age INT,
MODIFY gender VARCHAR(50),
MODIFY blood_type VARCHAR(10),
MODIFY medical_condition VARCHAR(255),
MODIFY date_of_admission DATE,
MODIFY doctor VARCHAR(255),
MODIFY hospital VARCHAR(255),
MODIFY insurance_provider VARCHAR(255),
MODIFY billing_amount DECIMAL(10,2),
MODIFY room_number INT,
MODIFY admission_type VARCHAR(50),
MODIFY discharge_date DATE,
MODIFY medication VARCHAR(255),
MODIFY test_results VARCHAR(50);

-- 2. Capitalize Patient Names (Proper Case approximation)

UPDATE healthcare
SET name = CONCAT(
    UPPER(LEFT(name,1)),
    LOWER(SUBSTRING(name,2))
);

-- 3. Replace "-" with space in Hospital 

UPDATE healthcare
SET hospital = REPLACE(hospital, '-', ' ');

-- 4. Round Billing Amount to 0 decimal places

UPDATE healthcare
SET billing_amount = ROUND(billing_amount, 0);

-- 5. Remove Duplicate Records (based on Name + Admission Date

CREATE TABLE healthcare_clean AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY name, date_of_admission
               ORDER BY billing_amount DESC
           ) AS rn
    FROM healthcare
) t
WHERE rn = 1;

-- =====================================================
-- DATA EXPLORATION
-- =====================================================

-- Preview cleaned dataset

SELECT *
FROM healthcare_clean;

-- Age Distribution

SELECT 
    age,
    COUNT(*) AS patient_count
FROM healthcare_clean
GROUP BY age
ORDER BY age DESC;

-- =====================================================
-- BUSINESS QUESTIONS
-- =====================================================

-- Q1: Patients by Admission Type

SELECT 
    admission_type,
    COUNT(*) AS number_of_patients
FROM healthcare_clean
GROUP BY admission_type
ORDER BY number_of_patients DESC;

-- Q2: Patients by Insurance Provider

SELECT 
    insurance_provider,
    COUNT(*) AS number_of_patients
FROM healthcare_clean
GROUP BY insurance_provider
ORDER BY number_of_patients DESC;

-- Q3: Top 4 Most Common Medical Conditions

SELECT 
    medical_condition,
    COUNT(*) AS number_of_patients
FROM healthcare_clean
GROUP BY medical_condition
ORDER BY number_of_patients DESC
LIMIT 4;

-- Q4: Average Billing Amount by Gender

SELECT 
    gender,
    round(AVG(billing_amount)) AS avg_billing_amount
FROM healthcare_clean
GROUP BY gender;

-- Q5: Highest Average Billing by Condition & Admission 

SELECT 
    medical_condition,
    admission_type,
    AVG(billing_amount) AS avg_billing
FROM healthcare_clean
GROUP BY medical_condition, admission_type
ORDER BY avg_billing DESC;

-- =====================================================
-- ADVANCED ANALYSIS
-- =====================================================

-- Q6: Compare Each Patient's Length of Stay to Hospital Average

WITH hospital_avg AS (
    SELECT 
        hospital,
        AVG(DATEDIFF(discharge_date, date_of_admission)) AS avg_length_stay
    FROM healthcare_clean
    GROUP BY hospital
)
SELECT 
    h.name,
    h.hospital,
    DATEDIFF(h.discharge_date, h.date_of_admission) AS length_of_stay,
    ha.avg_length_stay,
    DATEDIFF(h.discharge_date, h.date_of_admission) - ha.avg_length_stay 
        AS difference_from_avg
FROM healthcare_clean h
JOIN hospital_avg ha 
    ON h.hospital = ha.hospital;

-- Q7: Top 5 Highest Billing Patients per Medical Condition

SELECT *
FROM (
    SELECT 
        name,
        medical_condition,
        billing_amount,
        RANK() OVER (
            PARTITION BY medical_condition 
            ORDER BY billing_amount DESC
        ) AS billing_rank
    FROM healthcare_clean
) ranked
WHERE billing_rank <= 5;

-- Q8: Hospitals with Above-Average Abnormal Test Results

WITH hospital_abnormal AS (
    SELECT 
        hospital,
        COUNT(*) AS abnormal_count
    FROM healthcare_clean
    WHERE test_results = 'Abnormal'
    GROUP BY hospital
),
avg_abnormal AS (
    SELECT AVG(abnormal_count) AS avg_count
    FROM hospital_abnormal
)
SELECT 
    h.hospital,
    h.abnormal_count
FROM hospital_abnormal h
JOIN avg_abnormal a ON 1=1
WHERE h.abnormal_count > a.avg_count
ORDER BY h.abnormal_count DESC;

-- =====================================================
-- END OF PROJECT
-- =====================================================
