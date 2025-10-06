USE project2;
SELECT * FROM patient5;
SELECT * FROM doctor5;
SELECT * FROM visit5;
SELECT * FROM treatments5;
SELECT * FROM lab_result5;


-- 1] TOTAL PATIENT
CREATE TABLE total_patients AS
SELECT CONCAT(ROUND((COUNT(DISTINCT patient_id)/1000),0), "K") AS total_patient_count
FROM patient5;
SELECT * FROM total_patients;


-- 2] TOTAL DOCTORS
CREATE TABLE total_doctors AS
SELECT CONCAT(ROUND((COUNT(DISTINCT doctor_id)/1000),0), "K") AS total_doctors
FROM doctor5;
SELECT * FROM total_doctors;


-- 3] TOTAL VISIT
CREATE TABLE total_visit AS
SELECT CONCAT(ROUND((COUNT(visit_id)/1000),0), "K") AS total_visit_count
FROM visit5;
SELECT * FROM total_visit;



-- 4] AVERAGE AGE OF PATIENT
CREATE TABLE average_age AS
SELECT ROUND(AVG(age),0) AS average_patient_age
FROM patient5;
SELECT * FROM average_age;


-- 5] TOP 5 DIAGNOSED CONDITION
CREATE TABLE top_5_diagnosed_condition AS
SELECT diagnosis, COUNT(*) AS diagnosis_count
FROM visit5
GROUP BY diagnosis
ORDER BY diagnosis_count DESC
LIMIT 5;
SELECT * FROM top_5_diagnosed_condition;


-- 6] FOLLOW UP RATE
CREATE TABLE follow_up_rate AS
SELECT

  CONCAT(
 ROUND(
        (SUM(CASE WHEN `follow_up_required` = 'yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ),
    '%')
    AS follow_up_rate_percentage
FROM visit5;
SELECT * FROM follow_up_rate;


-- 7]
CREATE TABLE average_treatment_cost_per_visit AS
SELECT CONCAT('$', ROUND(AVG(tratment_cost), 0)) AS average_treatment_cost
FROM treatments5;

SELECT * FROM average_treatment_cost_per_visit;




-- 8] TOTAL LAB TEST CONDUCTED
CREATE TABLE total_lab_test_conducted AS
SELECT CONCAT(ROUND((COUNT(lab_result_id)/1000)), "K") AS total_lab_test
FROM lab_result5;
SELECT * FROM total_lab_test_conducted;

-- 9]
CREATE TABLE percentage_of_abnormal_lab_result AS
SELECT 
    CONCAT(ROUND(
        (SUM(CASE WHEN test_results LIKE '%abnormal%' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ), '%')
    AS abnormal_percentage
FROM lab_result5;
SELECT * FROM percentage_of_abnormal_lab_result;


-- 10] DOCTOR WORKLOAD
CREATE TABLE doctor_workload AS
SELECT 
    ROUND((COUNT(visit_id) * 1.0 / COUNT(DISTINCT doctor_id)),0)AS workload
FROM 
    visit5;
SELECT * FROM doctor_workload;

-- 11]
CREATE TABLE total_revenue AS
SELECT 
    CONCAT(ROUND(((SUM(tratment_cost) + SUM(cost))/1000000),0), " M")AS total_revenue
FROM treatments5;
SELECT * FROM total_revenue;


















