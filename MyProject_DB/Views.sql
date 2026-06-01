-- Patient details with calculated age
CREATE VIEW patient_with_age AS
SELECT
    Patient_ID,
    First_Name,
    Last_Name,
    DATE_PART('year', AGE(Date_of_Birth)) AS Age,
    Gender,
    Blood_Type
FROM PATIENT;

-- Shows only completed appointments
CREATE VIEW completed_appointments AS
SELECT
    Doctor_ID,
    Patient_ID,
    Date,
    Time,
    Status
FROM APPOINTMENT
WHERE Status = 'Completed';

-- Patient medical history with all appointments
CREATE VIEW patient_history AS
SELECT
    P.Patient_ID,
    P.First_Name,
    P.Last_Name,
    A.Doctor_ID,
    A.Date,
    A.Time,
    A.Status
FROM PATIENT P
JOIN APPOINTMENT A ON P.Patient_ID = A.Patient_ID;

-- Counts number of distinct patients per doctor
CREATE VIEW doctor_workload AS
SELECT
    Doctor_ID,
    COUNT(DISTINCT Patient_ID) AS Total_Patients
FROM APPOINTMENT
GROUP BY Doctor_ID;

-- Prescription basic details with patient information
CREATE VIEW prescription_details AS
SELECT
    PR.Prescription_ID,
    PR.Prescription_Date,
    PR.Diagnosis,
    P.First_Name AS Patient_Name,
    PR.Doctor_ID
FROM PRESCRIPTION PR
JOIN PATIENT P ON PR.Patient_ID = P.Patient_ID;

-- Full prescription details linked with appointment data
CREATE VIEW prescription_full AS
SELECT
    PR.Prescription_ID,
    PR.Diagnosis,
    A.Date,
    A.Time,
    A.Status,
    PR.Doctor_ID,
    PR.Patient_ID
FROM PRESCRIPTION PR
JOIN APPOINTMENT A
ON PR.Doctor_ID = A.Doctor_ID
AND PR.Patient_ID = A.Patient_ID
AND PR.Appointment_Date = A.Date
AND PR.Appointment_Time = A.Time;