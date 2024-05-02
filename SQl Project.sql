create database hospital_managements_system_database;
use hospital_managements_system_database;
-- Create the Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactNumber VARCHAR(20),
    DateOfBirth DATE,
    Gender VARCHAR(10)
);

-- Create the Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(20)
);

-- Create the Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Create the MedicalRecords table
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    Medications VARCHAR(255),
    TestResults VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- Create the Inventory table
CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Quantity INT,
    Supplier VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create the Billing table
CREATE TABLE Billing (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert sample data into the Patients table
INSERT INTO Patients (PatientID, Name, ContactNumber, DateOfBirth, Gender)
VALUES
    (1, 'Rohit', '9854467644', '1990-05-15', 'Male'),
    (2, 'Ramlal', '9876543210', '1985-10-20', 'Male'),
    (3, 'Punnet',  '9894495454', '1992-03-30', 'Male'),
    (4, 'Reeta', '9654733356', '1996-05-29', 'Female'),
    (5, 'Akansha', '9568745749', '1994-06-25', 'Female');

-- Insert sample data into the Doctors table
INSERT INTO Doctors (DoctorID, Name, Specialization, ContactNumber)
VALUES
    (1, 'Dr. Singh', 'Cardiology', '6234547444'),
    (2, 'Dr. Hussain', 'Pediatrics', '7895454454'),
    (3, 'Dr. Jha', 'Gynecology', '8569457555'),
    (4, 'Dr. Anjan Dey', 'Physicion', '9354856979');

-- Insert sample data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'Cardiology'),
    (2, 'Pediatrics'),
    (3, 'Gynecology'),
    (4, 'Physicion');

-- Insert sample data into the Inventory table
INSERT INTO Inventory (ItemID, ItemName, Quantity, Supplier, DepartmentID)
VALUES
    (1, 'Stethoscope', 10, 'Medical Supplier A', 1),
    (2, 'Blood Pressure Monitor', 5, 'Medical Supplier B', 1),
    (3, 'Pediatric Scale', 8, 'Medical Supplier C', 2),
    (4, 'Vaginal Speculum', 5, 'Medical Supplier C', 3),
    (5, 'Forceps', 10, 'Medical Supplier C', 3),
    (6, 'Thermometer', 20, 'Medical Supplier A', 1);
    

-- Insert sample data into the Appointments table
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDateTime, Status)
VALUES
    (1, 1, 1, '2024-05-03 09:00:00', 'Scheduled'),
    (2, 2, 2, '2024-05-04 10:00:00', 'Scheduled'),
    (3, 3, 1, '2024-05-04 11:00:00', 'Scheduled'),
    (4, 4, 4, '2024-05-05 10:00:00', 'Scheduled'),
    (5, 5, 3, '2024-05-06 12:00:00', 'Scheduled'),
    (6, 5, 3, '2024-05-15 12:00:00', 'Scheduled');
    


-- Insert sample data into the MedicalRecords table
INSERT INTO MedicalRecords (RecordID, PatientID, Diagnosis, Treatment, Medications, TestResults)
VALUES
    (1, 1, 'Hypertension', 'Prescribed medication and lifestyle changes', 'Medication A', 'Blood pressure test normal'),
    (2, 2, 'Common cold', 'Prescribed rest and fluids', 'Medication B', 'Negative for flu'),
    (3, 3, 'ECG', 'Prescribed Excercise and walking', 'Medication C', 'ECG Reports are Normal'),
    (4, 4, 'Fever', 'Drink warm water and rest', 'Medication B', 'Cold'),
    (5, 5, 'Sonography', 'Do not eat spicy food', 'Medicaaion D', 'Reports are normal');

-- Insert sample data into the Billing table
INSERT INTO Billing (BillID, PatientID, Amount, PaymentStatus)
VALUES
    (1, 1, 150.00, 'Paid'),
    (2, 2, 100.00, 'Pending'),
    (3, 3, 200.00, 'Paid'),
    (4, 4, 500.00, 'Paid'),
    (5, 5, 1000.00, 'Paid');
    
    select * from patients;
    
-- Q1. Retrieve the names of all patients
select name from patients;

-- Q2. Retrieve the names and contact numbers of all doctors:
select Name, ContactNumber from Doctors;

-- Q3. Retrieve the appointments scheduled for a specific doctor:
select AppointmentDateTime, Status
from Appointments
where DoctorID = (select DoctorID from Doctors where Name = 'Dr. Singh');

-- Q4. Retrieve the medical records of a specific patient:
select * from medicalrecords;
select Diagnosis, Treatment, Medications, TestResults from Medicalrecords
where PatientID = 1;

-- Q5. Retrieve the names of all departments:
select Departmentname from departments;

-- Q6. Retrieve the inventory items in the Cardiology department:
select ItemName, Quantity from inventory
where DepartmentID = 1;

-- Q7. Retrieve the total amount billed for each patient:
select Patients.Name, SUM(Billing.Amount) as TotalAmountBilled
from Patients
join Billing on Patients.PatientID = Billing.PatientID
group by Patients.Name;

-- Q8. Retrieve the appointment details along with patient and doctor information:
select Appointments.AppointmentDateTime, Appointments.Status, Patients.Name as PatientName, Doctors.Name as DoctorName
from Appointments
join Patients on Appointments.PatientID = Patients.PatientID
join Doctors on Appointments.DoctorID = Doctors.DoctorID;

-- Q9. Retrieve the count of appointments for each doctor:
select doctors.name, COUNT(appointments.appointmentid) as AppointmentCount from Doctors
left join Appointments on Doctors.DoctorID = Appointments.DoctorID
group by Doctors.Name;

-- Q10. Retrieve the patients who have pending bills:
select patients.name from patients join billing on patients.PatientID = Billing.PatientID
where Billing.paymentstatus = 'Pending';




