# Student Management System (SMS) Database

## 📘 Overview
The Student Management System (SMS) is a relational database project designed to manage academic and administrative data within a university environment. It centralizes information related to students, departments, courses, instructors, and enrollments, ensuring structured data storage, integrity, and efficient querying.
This project was implemented using Microsoft SQL Server Management Studio (SSMS) and follows standard relational database design principles, including normalization, primary and foreign key constraints, and referential integrity.

## 🎯 Project Objectives

- The primary goals of this project are to:
- Design and implement a normalized relational database using SQL
- Efficiently manage student, instructor, department, and course data
- Support academic operations such as course allocation and student enrollment
- Enable data-driven reporting and analysis using structured SQL queries

## 🏗️ Database Architecture

The SMS database consists of six interrelated tables, each serving a specific functional role. Relationships between tables are enforced using primary and foreign keys to maintain data consistency.

### Tables Included

1. Students
2. Departments
3. Courses
4. Instructors
5. Enrolments
6. CourseInstructors

## 🗂️ Table Definitions

### 👨‍🎓 1. Students Table

Stores personal and academic information for students.
#### Columns
- StudentID (VARCHAR, Primary Key): Unique student identifier
- FullName (VARCHAR): Student full name
- Gender (VARCHAR): Student gender
- DOB (DATE): Date of birth
- DepartmentID (INT, Foreign Key): References Departments.DepartmentID

 ### 🏫 2. Department Table
 
Contains records of academic departments.
#### Columns
- DepartmentID (INT, Primary Key, Not Null): Unique department identifier
- DepartmentName (VARCHAR, Not Null): Department name

### 📚 3. Courses Table

Defines courses offered by departments.
#### Columns
- CourseID (INT, Primary Key, Not Null): Unique course identifier
- CourseName (VARCHAR, Not Null): Course title
- CourseCode (VARCHAR, Not Null): Course code
- DepartmentID (INT, Foreign Key, Not Null): References Departments.DepartmentID

### 👩‍🏫 4.  Instruuctors Table

Stores instructor details and departmental affiliations.
#### Columns
- InstructorID (INT, Primary Key, Not Null): Unique instructor identifier
- FullName (VARCHAR, Not Null): Instructor full name
- Gender (VARCHAR, Not Null): Gender
- DepartmentID (INT, Foreign Key, Not Null): References Departments.DepartmentID
- Email (VARCHAR, Not Null): Email address
- PhoneNumber (VARCHAR, Not Null): Contact number
- Qualification (VARCHAR, Not Null): Academic qualification
- Specialization (VARCHAR, Not Null): Area of specialization
- HireDate (DATE, Not Null): Employment date
- Salary (DECIMAL(10,2)): Salary amount

### 📝 5. Enrollments Table

Tracks student course registrations.
#### Columns
- EnrolmentID (INT, Primary Key, Not Null): Unique enrollment identifier
- StudentID (INT, Foreign Key, Not Null): References Students.StudentID
- CourseID (INT, Foreign Key, Not Null): References Courses.CourseID
- EnrolmentDate (DATE, Not Null): Date of enrollment

### 🔗 6. CourseInstructors Table

Manages the many-to-many relationship between courses and instructors.
#### Columns
- AssignmentID (INT, Primary Key, Not Null): Unique assignment identifier
- InstructorID (INT, Foreign Key, Not Null): References Instructors.InstructorID
- CourseID (INT, Foreign Key, Not Null): References Courses.CourseID
- CourseName (VARCHAR, Not Null): Course name
- AssignmentDate (DATE): Date of assignment

## 🧩 Entity Relationship Overview

- One Department can have many Students, Courses, and Instructors
- One Student can enroll in multiple Courses
- One Course can have multiple Enrolments
- One Instructor can be assigned to multiple Courses
- Courses and Instructors have a many-to-many relationship via CourseInstructors

## ![Entity Relationship Diagram-ERD](https://github.com/IsmailO-Portfolio/Students-Management-System-SMS-Database/blob/main/Student%20Management%20System%20ERD%20.jpeg)

## 🧪 Data Population

The database was populated with realistic sample data to simulate real university operations.

#### Dataset Summary
- 8 Departments
- 22 Courses
- 18 Instructors
- 61 Students
- 100 Enrolment records
- 30 Course-Instructor assignments


## 📊 SQL Reporting and Analysis

Structured SQL queries were written to generate academic and administrative insights.

## [Data Definition Language Queries](https://github.com/IsmailO-Portfolio/Students-Management-System-SMS-Database/blob/main/DATA%20DEFINITION%20LANGUAGE.sql)

## 👥 Student and Enrollment Insights

- Electrical Circuits has the highest enrollment with 15 students
- Organic Chemistry and Physical Chemistry follow with 8 enrollments each
- 30 students are enrolled in multiple courses
- Chibueze Johnson has the highest course load with four enrollments
- Engineering Department has the highest student population (16 students)
- Physics Department has the lowest enrollment (7 students)

## 🎓 Course and Instructor Insights

- Electrical Circuits is the most subscribed course
- Dr. Rachel Eze teaches courses with the highest total student enrollment


## ✅ Data Integrity Findings

- Three students are not enrolled in any course
- Average enrollment per student is two courses
- Gender distribution across students is balanced
- Electrical Circuits enrollment includes 8 female and 7 male students


## 🧠 Query Logic Summary

The project makes extensive use of core SQL concepts, including:

- JOIN operations across multiple tables
- GROUP BY for aggregation and categorization
- COUNT and other aggregate functions for metrics
- HAVING clauses to filter grouped data
- ORDER BY for result organization
- Aliases (AS) for clarity and readability

## 🛠️ Tools and Technologies

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Relational Database Design Principles

## 🏁 Conclusion

The Student Management System database demonstrates a structured and scalable approach to managing academic data. Through proper normalization, enforced constraints, and well-defined relationships, the system supports efficient data storage, integrity, and advanced reporting suitable for real-world university environments.


