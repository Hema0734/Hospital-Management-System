INSERT INTO PATIENT
VALUES
(1, 'Ahmad', 'Ali', '2001-03-15', 'Male', 'O+'),
(2, 'Sara', 'Khaled', '1999-07-22', 'Female', 'A+'),
(3, 'Omar', 'Nasser', '1988-11-02', 'Male', 'B+'),
(4, 'Lina', 'Hassan', '2005-01-30', 'Female', 'AB+'),
(5, 'Yousef', 'Salem', '1995-09-18', 'Male', 'O-'),
(6, 'Mariam', 'Adel', '2000-06-12', 'Female', 'A-'),
(7, 'Kareem', 'Fadi', '1993-04-27', 'Male', 'B-'),
(8, 'Dana', 'Ibrahim', '2002-12-09', 'Female', 'O+'),
(9, 'Tariq', 'Mahmoud', '1985-08-14', 'Male', 'AB-'),
(10, 'Nour', 'Samir', '1998-10-05', 'Female', 'A+');


INSERT INTO PATIENT_PHONE
VALUES
(1, '0599123456'),
(1, '0568123456'),

(2, '0599234567'),
(2, '0568234567'),
(2, '0599345678'),

(3, '0599456789'),
(3, '0568456789'),

(4, '0599567890'),
(4, '0568567890'),
(4, '0599678901');

INSERT INTO DEPARTMENT
VALUES
(1, 'Cardiology', 'First Floor'),--طب القلب
(2, 'Neurology', 'Second Floor'),--طب الاعصاب
(3, 'Orthopedics', 'Third Floor'),--طب العظام
(4, 'Pediatrics', 'Fourth Floor'),--طب الاطفال
(5, 'Dermatology', 'Fifth Floor');--طب الامراض الجلدية

INSERT INTO DOCTOR
VALUES
(1, 'Khaled', 'Nasser', 120000, 1, NULL),
(2, 'Lina', 'Hassan', 95000, 2, 1),
(3, 'Ahmad', 'Saleh', 110000, 1, 1),
(4, 'Mariam', 'Adel', 98000, 3, 2),
(5, 'Omar', 'Yousef', 105000, 2, 1),
(6, 'Sara', 'Mahmoud', 92000, 4, 3),
(7, 'Tariq', 'Fadi', 115000, 1, 1),
(8, 'Dana', 'Khalil', 97000, 3, 4),
(9, 'Yazan', 'Ibrahim', 100000, 5, 2),
(10, 'Nour', 'Samer', 93000, 4, 6);


INSERT INTO DOCTOR_SPECIALITY
VALUES
(1, 'Cardiology'),
(1, 'Internal Medicine'),

(2, 'Neurology'),

(3, 'Cardiac Surgery'),
(3, 'Cardiology'),

(4, 'Orthopedics'),

(5, 'Pediatrics'),
(5, 'Neonatology'),

(6, 'Dermatology'),

(7, 'Internal Medicine'),
(7, 'Emergency Medicine'),

(8, 'Orthopedic Surgery'),

(9, 'Dermatology'),
(9, 'Cosmetic Dermatology'),

(10, 'Pediatrics');


INSERT INTO APPOINTMENT
VALUES
(1, 1, '2026-07-02', '09:00:00', 'Scheduled'),
(3, 1, '2026-07-03', '11:00:00', 'Completed'),

(2, 2, '2026-07-04', '10:00:00', 'Completed'),
(5, 2, '2026-07-05', '13:00:00', 'Scheduled'),

(4, 3, '2026-07-06', '08:30:00', 'Cancelled'),
(1, 3, '2026-07-07', '12:00:00', 'Completed'),

(6, 4, '2026-07-08', '09:30:00', 'Scheduled'),
(8, 4, '2026-07-09', '14:00:00', 'Completed'),

(7, 5, '2026-07-10', '10:30:00', 'Completed'),
(9, 5, '2026-07-11', '15:00:00', 'Scheduled'),

(10, 6, '2026-07-12', '11:30:00', 'Completed'),
(2, 6, '2026-07-13', '16:00:00', 'Scheduled'),

(3, 7, '2026-07-14', '09:15:00', 'Cancelled'),
(5, 7, '2026-07-15', '13:30:00', 'Completed'),

(4, 8, '2026-07-16', '10:45:00', 'Scheduled'),
(6, 8, '2026-07-17', '14:30:00', 'Completed'),

(7, 9, '2026-07-18', '08:45:00', 'Completed'),
(8, 9, '2026-07-19', '12:30:00', 'Scheduled'),

(9, 10, '2026-07-20', '11:15:00', 'Completed'),
(10, 10, '2026-07-21', '15:30:00', 'Scheduled');

INSERT INTO MEDICINE
VALUES
(1, 'Paracetamol', 'Pfizer', 5.50),
(2, 'Ibuprofen', 'Bayer', 7.25),
(3, 'Amoxicillin', 'GlaxoSmithKline', 12.00),
(4, 'Metformin', 'Novartis', 15.75),
(5, 'Aspirin', 'Bayer', 4.20),
(6, 'Atorvastatin', 'Pfizer', 18.40),
(7, 'Omeprazole', 'AstraZeneca', 10.60),
(8, 'Azithromycin', 'Teva', 14.30),
(9, 'Ciprofloxacin', 'Sanofi', 16.80),
(10, 'Losartan', 'Merck', 13.50),

(11, 'Insulin', 'Novo Nordisk', 35.00),
(12, 'Salbutamol', 'GSK', 9.90),
(13, 'Cetirizine', 'Johnson & Johnson', 6.40),
(14, 'Diclofenac', 'Novartis', 8.70),
(15, 'Prednisone', 'Pfizer', 11.20),
(16, 'Clopidogrel', 'Sanofi', 19.50),
(17, 'Warfarin', 'Bristol Myers Squibb', 17.60),
(18, 'Lisinopril', 'Merck', 12.90),
(19, 'Hydrocortisone', 'Teva', 9.30),
(20, 'Doxycycline', 'Pfizer', 13.80);


INSERT INTO PRESCRIPTION
VALUES
(1, '2026-07-03', 'Migraine', 'Rest and avoid stress', 3, 1, '2026-07-03', '11:00:00'),

(2, '2026-07-04', 'Flu', 'Drink fluids and rest', 2, 2, '2026-07-04', '10:00:00'),

(3, '2026-07-07', 'Back Pain', 'Physical therapy recommended', 1, 3, '2026-07-07', '12:00:00'),

(4, '2026-07-09', 'Skin Allergy', 'Use topical cream', 8, 4, '2026-07-09', '14:00:00'),

(5, '2026-07-10', 'Bronchitis', 'Antibiotics course', 7, 5, '2026-07-10', '10:30:00'),

(6, '2026-07-12', 'Diabetes Checkup', 'Control sugar intake', 10, 6, '2026-07-12', '11:30:00'),

(7, '2026-07-15', 'Cold', 'Rest and warm fluids', 5, 7, '2026-07-15', '13:30:00'),

(8, '2026-07-17', 'Knee Injury', 'Avoid pressure on knee', 6, 8, '2026-07-17', '14:30:00'),

(9, '2026-07-18', 'High Cholesterol', 'Diet control', 7, 9, '2026-07-18', '08:45:00'),

(10, '2026-07-20', 'Dermatitis', 'Apply ointment twice daily', 9, 10, '2026-07-20', '11:15:00');


INSERT INTO PRESCRIPTION_MEDICINE
VALUES
(1, 10, '50 mg', 'Once daily', '30 days'),
(1, 18, '10 mg', 'Once daily', '30 days'),

(2, 2, '400 mg', 'Twice daily', '7 days'),
(2, 13, '10 mg', 'Once daily', '5 days'),

(3, 14, '50 mg', 'Twice daily', '10 days'),
(3, 1, '500 mg', 'Three times daily', '5 days'),

(4, 19, '20 mg', 'Twice daily', '14 days'),
(4, 13, '10 mg', 'Once daily', '7 days'),

(5, 3, '500 mg', 'Three times daily', '7 days'),
(5, 7, '20 mg', 'Once daily', '7 days'),

(6, 4, '500 mg', 'Twice daily', '30 days'),
(6, 11, '15 units', 'Once daily', '30 days'),

(7, 1, '500 mg', 'Three times daily', '5 days'),
(7, 12, '2 puffs', 'As needed', '7 days'),

(8, 14, '50 mg', 'Twice daily', '10 days'),
(8, 5, '100 mg', 'Once daily', '7 days'),

(9, 6, '20 mg', 'Once daily', '30 days'),
(9, 16, '75 mg', 'Once daily', '30 days'),

(10, 19, '20 mg', 'Twice daily', '14 days'),
(10, 13, '10 mg', 'Once daily', '7 days');