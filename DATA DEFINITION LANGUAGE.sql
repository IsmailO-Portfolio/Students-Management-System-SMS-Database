
-- ======================================================== --
-- DATA DEFINITION COMMANDS 
-- ======================================================== --

-- Create Database
CREATE DATABASE StudentManagementSystem;
GO

USE StudentManagementSystem;
GO

-- =============================================
-- Table 1: Departments
-- =============================================
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL UNIQUE,
);

-- =============================================
-- Table 2: Students
-- =============================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    Gender VARCHAR(10), 
    DOB DATE NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) 
    REFERENCES Departments(DepartmentID) 
);

-- =============================================
-- Table 3: Instructors
-- =============================================
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(50) NOT NULL,
    Gender VARCHAR(5),
    DepartmentID INT NOT NULL,
    Email VARCHAR(50) UNIQUE,
    PhoneNumber VARCHAR(15),
    Qualification VARCHAR(25),
    Specialization VARCHAR (50),
    HireDate DATE NOT NULL,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) 
    REFERENCES Departments(DepartmentID)
);

-- =============================================
-- Table 4: Courses
-- =============================================
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    CourseCode NVARCHAR(20) UNIQUE NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) 
    REFERENCES Departments(DepartmentID) 
);

-- =============================================
-- Table 5: Enrolments
-- =============================================
CREATE TABLE Enrolments (
    EnrolmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrolmentDate DATE NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);

-- =============================================
-- Table 6: CourseInstructors
-- =============================================

CREATE TABLE CourseInstructors (
    AssignmentID INT PRIMARY KEY IDENTITY(100, 1),
    InstructorID INT NOT NULL,
    CourseID INT NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    AssignmentDate DATE DEFAULT GETDATE(),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
);


-- ============================================= --
-- DATA INSERTION
-- ============================================= --

INSERT INTO Departments (DepartmentName) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Business Administration'),
('Engineering'),
('Biology'),
('Chemistry'),
('English Literature');

SELECT * FROM Departments;
-- ==========================================================================================

INSERT INTO Instructors (FullName, Gender, DepartmentID, Email, PhoneNumber, Qualification, Specialization, HireDate, Salary) 
VALUES
('Prof. Chiamaka Williams', 'F', 1, 'alice.w@university.edu', '+2348011234567', 'PhD', 'Database Systems', '2010-08-01', 85000.00),
('Dr. Mark Chukwuemeka', 'M', 1, 'mark.c@university.edu', '+2348022345678', 'PhD', 'Artificial Intelligence', '2012-01-15', 90000.00),
('Prof. Linda Ayeola', 'F', 2, 'linda.a@university.edu', '+2348033456789', 'PhD', 'Applied Mathematics', '2008-09-01', 82000.00),
('Dr. James Olaniyi', 'M', 3, 'james.o@university.edu', '+2348044567890', 'PhD', 'Quantum Physics', '2015-02-10', 88000.00),
('Prof. Tunde Andrews', 'M', 4, 'tunde.a@university.edu', '+2348055678901', 'MBA, PhD', 'Strategic Management', '2009-06-20', 95000.00),
('Dr. Christopher Godwin', 'M', 1, 'chris.g@university.edu', '+2348066789012', 'PhD', 'Software Engineering', '2011-03-12', 87000.00),
('Prof. Michelle Brown', 'F', 5, 'michelle.b@university.edu', '+2348077890123', 'PhD', 'Mechanical Engineering', '2007-05-20', 92000.00),
('Dr. Sarah Omoniyi', 'F', 2, 'sarah.o@university.edu', '+2348088901234', 'PhD', 'Statistics', '2013-09-15', 84000.00),
('Prof. Susan Ariyo', 'F', 6, 'susan.a@university.edu', '+2348099012345', 'PhD', 'Molecular Biology', '2006-01-10', 89000.00),
('Dr. David Benjamin', 'M', 3, 'david.b@university.edu', '+2348100123456', 'PhD', 'Astrophysics', '2016-07-01', 86000.00),
('Prof. Angela Adebayo', 'F', 7, 'angela.a@university.edu', '+2348111234567', 'PhD', 'Organic Chemistry', '2008-11-18', 88000.00),
('Dr. Musa Shuaibu', 'M', 4, 'musa.s@university.edu', '+2348122345678', 'PhD', 'Marketing', '2012-04-25', 83000.00),
('Prof. Rebecca Davis', 'F', 8, 'rebecca.d@university.edu', '+2348133456789', 'PhD', 'Victorian Literature', '2009-08-30', 81000.00),
('Dr. Rachel Eze', 'F', 5, 'rachel.e@university.edu', '+2348144567890', 'PhD', 'Electrical Engineering', '2014-02-14', 91000.00),
('Prof. Laura Jackson', 'F', 6, 'laura.j@university.edu', '+2348155678901', 'PhD', 'Genetics', '2007-10-05', 87000.00),
('Dr. Andrew Adewale', 'M', 7, 'andrew.a@university.edu', '+2348166789012', 'PhD', 'Physical Chemistry', '2013-03-22', 85000.00),
('Prof. Jessica Cole', 'F', 8, 'jessica.c@university.edu', '+2348177890123', 'PhD', 'Modern Poetry', '2010-09-12', 80000.00),
('Dr. Brian King', 'M', 4, 'brian.k@university.edu', '+2348188901234', 'PhD', 'Finance', '2011-06-18', 94000.00);

SELECT * FROM Instructors;
-- ==========================================================================================

INSERT INTO Courses (CourseName, CourseCode, DepartmentID) 
VALUES
('Database Management Systems', 'CS301', 1),
('Data Structures and Algorithms', 'CS201', 1),
('Machine Learning', 'CS401', 1),
('Software Engineering', 'CS302', 1),
('Calculus I', 'MATH101', 2),
('Linear Algebra', 'MATH201', 2),
('Statistics and Probability', 'MATH301', 2),
('Classical Mechanics', 'PHY301', 3),
('Quantum Physics', 'PHY401', 3),
('Business Strategy', 'BUS401', 4),
('Financial Accounting', 'BUS201', 4),
('Marketing Management', 'BUS301', 4),
('Mechanical Engineering Design', 'MEC301', 5),
('Electrical Circuits', 'ENG201', 5),
('Molecular Biology', 'BIO301', 6),
('Genetics', 'BIO401', 6),
('Organic Chemistry', 'CHEM301', 7),
('Physical Chemistry', 'CHEM401', 7),
('Victorian Literature', 'ENG301', 8),
('Modern Poetry', 'ENG401', 8),
('Introduction to Programming', 'CS101', 1),
('Introduction to Business', 'BUS101', 4);

SELECT * FROM Courses;
-- ======================================================== --

INSERT INTO Students (FullName, Gender, DOB, DepartmentID) 
VALUES
('Chibueze Johnson', 'M', '2003-04-12', 1),
('Michael Okonkwo', 'M', '2003-11-30', 2),
('Emma Adebayo', 'F', '2002-08-25', 1),
('Michael Okonkwo', 'M', '2003-11-30', 2),
('Amara Anderson', 'F', '2003-03-25', 2),
('Sophia Nwosu', 'F', '2002-06-18', 3),
('Daniel Okafor', 'M', '2003-02-22', 4),
('Olivia Okeke', 'F', '2003-09-05', 1),
('Adeola Martinez', 'F', '2003-07-20', 4),
('James Adeleke', 'M', '2004-01-08', 5),
('William Eze', 'M', '2002-12-14', 2),
('Isabella Chukwu', 'F', '2003-05-17', 1),
('Ethan Musa', 'M', '2002-10-30', 6),
('Alexander Bello', 'M', '2004-02-14', 7),
('Chiamaka Harris', 'F', '2004-04-28', 1),
('Charlotte Adeyemi', 'F', '2002-09-20', 3),
('Benjamin Oyewole', 'M', '2003-12-03', 8),
('Chinedu Thompson', 'M', '2004-03-06', 2),
('Lucas Ibrahim', 'M', '2002-07-15', 4),
('Harper Oluwaseun', 'F', '2003-08-11', 5),
('Evelyn Abiola', 'F', '2002-11-22', 6),
('Logan Uche', 'M', '2003-06-09', 1),
('Abigail Onyeka', 'F', '2004-01-18', 7),
('Jackson Emeka', 'M', '2002-05-27', 3),
('Folake Rodriguez', 'F', '2003-10-13', 8),
('Aiden Tijani', 'M', '2004-02-21', 4),
('Elizabeth Nnamdi', 'F', '2002-08-07', 1),
('Sebastian Olayinka', 'M', '2003-12-29', 5),
('Ifeoma Allen', 'F', '2004-04-16', 2),
('Jack Yusuf', 'M', '2002-09-03', 6),
('Avery Adaeze', 'F', '2003-07-24', 1),
('Samuel Chukwudi', 'M', '2004-03-12', 7),
('Ella Nkechi', 'F', '2002-11-08', 3),
('Nneka Hill', 'F', '2004-01-26', 4),
('Matthew Babatunde', 'M', '2003-05-31', 8),
('Henry Ngozi', 'M', '2002-06-14', 1),
('Grace Funmilayo', 'F', '2003-09-19', 5),
('Chloe Chinonso', 'F', '2002-10-25', 6),
('Owen Obinna', 'M', '2004-02-08', 2),
('Nathan Kelechi', 'M', '2002-07-11', 3),
('Tunde Nelson', 'M', '2003-04-04', 1),
('Zoey Amina', 'F', '2004-03-22', 7),
('Lily Chioma', 'F', '2003-11-05', 8),
('Hannah Ogochukwu', 'F', '2002-08-18', 1),
('Christian Ifeanyi', 'M', '2004-01-29', 4),
('Ryan Olumide', 'M', '2002-12-07', 6),
('Isaac Chidiebere', 'M', '2003-06-23', 5),
('Adaora Campbell', 'F', '2004-04-10', 2),
('Natalie Ebube', 'F', '2003-03-14', 1),
('Brooklyn Blessing', 'F', '2002-09-28', 3), 
('Caleb Azubuike', 'M', '2004-02-01', 7),
('Andrew Segun', 'M', '2002-10-05', 1),
('Joshua Oluwatobiloba', 'M', '2003-07-16', 8),
('Leah Oluwatoyin', 'F', '2004-03-09', 4),
('Zoe Omolara', 'F', '2003-05-21', 5),
('Gabriel Chukwuemeka', 'M', '2004-01-13', 2),
('Aubrey Uchenna', 'F', '2002-11-30', 6),
('Penelope Adanna', 'F', '2004-04-19', 7),
('Jason Chukwuma', 'M', '2002-06-02', 3),
('Anthony Oluwafemi', 'M', '2003-08-26', 1),
('Layla Ezinne', 'F', '2003-12-18', 8);

SELECT * FROM Students;
-- ======================================================== --

INSERT INTO Enrolments (StudentID, CourseID, EnrolmentDate) 
VALUES
(1, 20, '2024-08-20'),
(1, 21, '2024-08-20'),
(1, 22, '2024-08-21'),
(2, 23, '2024-08-20'),
(2, 22, '2024-08-20'),
(6, 20, '2024-08-19'),
(6, 21, '2024-08-21'),
(10, 40, '2024-08-20'),
(10, 23, '2024-08-19'),
(16, 41, '2024-08-19'),
(21, 20, '2024-08-20'),
(21, 22, '2024-08-21'),
(26, 40, '2024-08-20'),
(30, 23, '2024-08-19'),
(35, 20, '2024-08-20'),
(3, 24, '2024-08-20'),
(3, 25, '2024-08-21'),
(7, 25, '2024-08-20'),
(7, 26, '2024-08-21'),
(12, 24, '2024-08-20'),
(19, 25, '2024-08-21'),
(28, 26, '2024-08-20'),
(37, 26, '2024-08-20'),
(46, 24, '2024-08-21'),
(55, 25, '2024-08-20'),
(4, 27, '2024-08-22'),
(4, 28, '2024-08-20'),
(14, 28, '2024-08-22'),
(23, 27, '2024-08-22'),
(32, 27, '2024-08-22'),
(41, 27, '2024-08-22'),
(50, 28, '2024-08-22'),
(59, 28, '2024-08-22'),
(5, 41, '2024-08-19'),
(5, 30, '2024-08-23'),
(5, 31, '2024-08-23'),
(8, 30, '2024-08-19'),
(8, 31, '2024-08-23'),
(17, 41, '2024-08-19'),
(17, 30, '2024-08-23'),
(25, 41, '2024-08-23'),
(34, 29, '2024-08-19'),
(43, 31, '2024-08-23'),
(10, 35, '2024-01-15'),
(11, 34, '2024-01-15'),
(12, 34, '2024-01-16'),
(13, 34, '2024-01-16'),
(14, 35 ,'2024-01-17'),
(15, 35, '2024-01-17'),
(16, 35, '2024-01-18'), 
(17, 34, '2024-01-18'),
(18,35,'2024-01-19'),
(19, 34, '2024-01-19'),
(20,38, '2024-01-20'),
(21, 38, '2024-01-20'),
(22, 38, '2024-01-21'),
(23, 38, '2024-01-21'),
(24, 38, '2024-01-22'),
(25, 39, '2024-01-22'),
(26, 39, '2024-01-23'),
(27, 39, '2024-01-23'),
(28, 39, '2024-01-24'),
(29, 39, '2024-01-24'),
(30, 33, '2024-01-25'),
(31,33,'2024-01-25'),
(32,33,'2024-01-26'),
(33,33,'2024-01-26'),
(34,33,'2024-01-27'),
(35,33,'2024-01-27'),
(36,33,'2024-01-28'),
(37,33,'2024-01-28'),
(38,33,'2024-01-29'),
(39,33,'2024-01-29'),
(40,33,'2024-01-30'),
(41,33,'2024-01-30'),
(42,33,'2024-01-31'),
(43,33,'2024-01-31'),
(44,33,'2024-02-01'),
(45,36,'2024-02-01'),
(46,36,'2024-02-02'),
(47,36, '2024-02-02'),
(48,36,'2024-02-03'),
(49,36,'2024-02-03'),
(50,36,'2024-02-04'),
(51,37,'2024-02-04'),
(52,37,'2024-02-05'),
(53,37,'2024-02-05'),
(54,37,'2024-02-06'),
(55,37,'2024-02-06'),
(56,37,'2024-02-07'),
(57,36,'2024-02-07'),
(58,36,'2024-02-08'),
(59,37,'2024-02-08'),
(1,21,'2024-02-09'),
(2,22,'2024-02-09'),
(3,31,'2024-02-10'),
(4,32,'2024-02-10'),
(5,24,'2024-02-11'),
(6,37,'2024-02-11'),
(7,39,'2024-02-12');

SELECT * FROM Enrolments;
-- ======================================================== --

INSERT INTO CourseInstructors (InstructorID, CourseID, CourseName, AssignmentDate) 
VALUES
(3, 20, 'Database Management Systems', '2024-08-01'),
(3, 21, 'Data Structures and Algorithms', '2024-08-01'),
(4, 22, 'Machine Learning', '2024-08-01'),
(8, 23, 'Software Engineering', '2024-08-01'),
(8, 21, 'Introduction to Programming', '2024-08-01'),
(5, 24, 'Calculus I', '2024-08-01'),
(5, 25, 'Linear Algebra', '2024-08-01'),
(5, 26, 'Statistics and Probability', '2024-08-01'),
(6, 27, 'Classical Mechanics', '2024-08-01'),
(6, 28, 'Quantum Physics', '2024-08-01'),
(7, 29, 'Business Strategy', '2024-08-01'),
(20, 30, 'Financial Accounting', '2024-08-01'),
(14, 31, 'Marketing Management', '2024-08-01'),
(7, 41, 'Introduction to Business', '2024-08-01'),
(9, 32, 'Mechanical Engineering Design', '2024-08-01'),
(16, 33, 'Electrical Circuits', '2024-08-01'),
(11, 34, 'Molecular Biology', '2024-08-01'),
(17, 35, 'Genetics', '2024-08-01'),
(13, 36, 'Organic Chemistry', '2024-08-01'),
(18, 37, 'Physical Chemistry', '2024-08-01'),
(15, 38, 'Victorian Literature', '2024-08-01'),
(17, 39, 'Modern Poetry', '2024-08-01'),
(3, 21, 'Data Structures and Algorithms', '2024-08-01'),
(10, 26, 'Statistics and Probability', '2024-08-01'),
(14, 31, 'Marketing Management', '2024-08-01'),
(17, 35, 'Genetics', '2024-08-01'),
(18, 37, 'Physical Chemistry', '2024-08-01'),
(12, 28, 'Quantum Physics', '2024-08-01'),
(16, 33, 'Electrical Circuits', '2024-08-01'),
(19, 39, 'Modern Poetry', '2024-08-01');

SELECT * FROM CourseInstructors;
-- ======================================================== --


