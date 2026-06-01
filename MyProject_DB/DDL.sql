CREATE TABLE PATIENT (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male','Female')),
    Blood_Type VARCHAR(5) CHECK (
        Blood_Type IN ('A+','A-','B+','B-','AB+','AB-','O+','O-')
    )
);


CREATE TABLE PATIENT_PHONE (
    Patient_ID     INT NOT NULL,
    Phone_Number   VARCHAR(15) NOT NULL,
    PRIMARY KEY (Patient_ID, Phone_Number),
    FOREIGN KEY (Patient_ID)
        REFERENCES PATIENT(Patient_ID)
        ON DELETE CASCADE
);

CREATE TABLE DEPARTMENT (
    Department_ID INT NOT NULL,
    Dept_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100),

    CONSTRAINT PK_DEPARTMENT
        PRIMARY KEY (Department_ID)
);

CREATE TABLE DOCTOR (
    Doctor_ID       INT PRIMARY KEY,
    First_Name      VARCHAR(50) NOT NULL,
    Last_Name       VARCHAR(50) NOT NULL,
    Salary          INT NOT NULL
                    CHECK (Salary >= 0),
    Department_ID   INT,
    Supervisor_ID   INT,
    FOREIGN KEY (Department_ID)
        REFERENCES DEPARTMENT(Department_ID)
        ON DELETE SET NULL,
    FOREIGN KEY (Supervisor_ID)
        REFERENCES DOCTOR(Doctor_ID)
        ON DELETE SET NULL
);


CREATE TABLE DOCTOR_SPECIALITY (
    Doctor_ID INT REFERENCES DOCTOR(Doctor_ID) ON DELETE CASCADE,
    Speciality VARCHAR(100),
    PRIMARY KEY (Doctor_ID, Speciality)
);


CREATE TABLE APPOINTMENT (
    Doctor_ID INT REFERENCES DOCTOR(Doctor_ID) ON DELETE CASCADE,
    Patient_ID INT REFERENCES PATIENT(Patient_ID) ON DELETE CASCADE,
    Date DATE,
    Time TIME,
    Status VARCHAR(50) CHECK (Status IN ('Scheduled','Completed','Cancelled', 'Expired')),
	PRIMARY KEY (Doctor_ID, Patient_ID, Date, Time)
);


CREATE TABLE MEDICINE (
    Medication_ID INT PRIMARY KEY,
    Medicine_Name VARCHAR(150) NOT NULL,
    Manufacturer VARCHAR(150),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE PRESCRIPTION (
    Prescription_ID INT PRIMARY KEY,
    Prescription_Date DATE NOT NULL,
    Diagnosis VARCHAR(255),
    Notes TEXT,

    Doctor_ID INT,
    Patient_ID INT,
    Appointment_Date DATE,
    Appointment_Time TIME,

    FOREIGN KEY (Doctor_ID, Patient_ID, Appointment_Date, Appointment_Time)
    REFERENCES APPOINTMENT (Doctor_ID, Patient_ID, Date, Time)
);

CREATE TABLE PRESCRIPTION_MEDICINE (
    Prescription_ID INT REFERENCES PRESCRIPTION(Prescription_ID) ON DELETE CASCADE,
    Medication_ID INT REFERENCES MEDICINE(Medication_ID),
    Dosage VARCHAR(100),
    Frequency VARCHAR(100),
    Duration VARCHAR(100),
    PRIMARY KEY (Prescription_ID, Medication_ID)
);

--DROP ORDER
--(Reverse Dependency Order)
-- =========================
-- 1. Child / Junction tables
-- =========================
DROP TABLE IF EXISTS PRESCRIPTION_MEDICINE;
DROP TABLE IF EXISTS PATIENT_PHONE;
DROP TABLE IF EXISTS DOCTOR_SPECIALITY;

-- =========================
-- 2. Dependent tables
-- =========================
DROP TABLE IF EXISTS PRESCRIPTION;
DROP TABLE IF EXISTS APPOINTMENT;

-- =========================
-- 3. Main entities
-- =========================
DROP TABLE IF EXISTS DOCTOR;
DROP TABLE IF EXISTS PATIENT;
DROP TABLE IF EXISTS MEDICINE;
DROP TABLE IF EXISTS DEPARTMENT;