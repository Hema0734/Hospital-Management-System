-- Function : check_appointment_completed()
-- Purpose  : Prevents inserting a prescription unless
--            the related appointment status is 'Completed'.
CREATE OR REPLACE FUNCTION check_appointment_completed()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM APPOINTMENT
        WHERE Doctor_ID = NEW.Doctor_ID
          AND Patient_ID = NEW.Patient_ID
          AND Date = NEW.Appointment_Date
          AND Time = NEW.Appointment_Time
          AND Status = 'Completed'
    ) THEN
        RAISE EXCEPTION 'Cannot create prescription unless appointment is COMPLETED';
    END IF;

    RETURN NEW;
END;

$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_check_completed
BEFORE INSERT ON PRESCRIPTION
FOR EACH ROW
EXECUTE FUNCTION check_appointment_completed();

--Patient appointment history (JOIN query)
--Show full history of each patient with their doctors.
SELECT 
    P.Patient_ID,
    P.First_Name,
    P.Last_Name,
    A.Doctor_ID,
    A.Date,
    A.Time,
    A.Status
FROM PATIENT P JOIN APPOINTMENT A ON P.Patient_ID = A.Patient_ID;

-- Recursive Query (Transitive Closure of Doctor Supervision)
-- Goal:
-- Retrieve all doctors directly and indirectly supervised
-- by Doctor_ID = 1.

WITH RECURSIVE Doctor_Hierarchy AS (

    -- Base case: start from Doctor 1
    SELECT
        Doctor_ID,
        First_Name,
        Last_Name,
        Supervisor_ID
    FROM DOCTOR
    WHERE Doctor_ID = 1

    UNION ALL

    -- Recursive step: find doctors supervised by current doctors
    SELECT
        D.Doctor_ID,
        D.First_Name,
        D.Last_Name,
        D.Supervisor_ID
    FROM DOCTOR D
    INNER JOIN Doctor_Hierarchy DH
        ON D.Supervisor_ID = DH.Doctor_ID
)

SELECT *
FROM Doctor_Hierarchy;

--Display appointments for each doctor with a cumulative count of appointments over time
SELECT
    Doctor_ID,
    Date,
    Time,
    Status,

    COUNT(*) OVER (
        PARTITION BY Doctor_ID
        ORDER BY Date, Time
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Running_Total_Appointments

FROM APPOINTMENT
ORDER BY Doctor_ID, Date, Time;


--Display medicines ordered by the number of times they were prescribed.
SELECT 
    M.Medicine_Name,
    COUNT(PM.Prescription_ID) AS Times_Prescribed
FROM MEDICINE M JOIN PRESCRIPTION_MEDICINE PM ON M.Medication_ID = PM.Medication_ID
GROUP BY M.Medicine_Name
ORDER BY Times_Prescribed DESC;


--Average Medicine Price per Manufacturer
SELECT 
    Manufacturer,
    COUNT(*) AS Total_Medicines,
    AVG(Price) AS Average_Price,
    MAX(Price) AS Highest_Price,
    MIN(Price) AS Lowest_Price
FROM MEDICINE
GROUP BY Manufacturer
HAVING COUNT(*) >= 2;