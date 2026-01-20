-- ======================================================== --
-- DATA MANIPULATION QUERIES 
-- ======================================================== --

-- Student & Enrollment Reports

-- 1. How many students are currently enrolled in each course?
SELECT 
    c.courseID, c.CourseName, 
    COUNT(e.StudentID) AS TotalStudents
FROM Courses c
LEFT JOIN Enrolments e
    ON c.CourseID = e.CourseID
GROUP BY c.courseID, c.CourseName
ORDER BY TotalStudents DESC; 

/* The result shows the number of students enrolled in each of the 22 Courses with eletrical circuits being the course with the most students (15) */
---------------------------------------------------------------------------------


-- 2. Which students are enrolled in multiple courses, and which courses are they taking?
------------------------------------------------------------------------------------------

SELECT
    s.StudentID,
    s.FullName AS StudentName,
    COUNT(e.CourseID) AS NumberOfCourses,
    STRING_AGG(c.CourseName, ', ') AS CoursesTaken
FROM Students s
JOIN Enrolments e
    ON s.StudentID = e.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
GROUP BY
    s.StudentID,
    s.FullName
HAVING COUNT(e.CourseID) > 1
ORDER BY NumberOfCourses DESC;

/* The result shows that 30 students are enrolled in multiple courses, and Chibueze Johnson registered 4 courses 
making him the student with the highest number of courses' enrolments. */
---------------------------------------------------------------------------------

-- 3. What is the total number of students per department across all courses?
------------------------------------------------------------------------------------------
SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
JOIN Enrolments e
    ON c.CourseID = e.CourseID
GROUP BY
    d.DepartmentID,
    d.DepartmentName
ORDER BY TotalStudents DESC;

/* 
Engineering department has the highest number of students (16 students). 
Physics deparment has the least number of students (7students).
*/
---------------------------------------------------------------------------------_

-- Course & Instructor Analysis
---------------------------------------------------------------------------------_
-- 4 Which courses have the highest number of enrollments?

SELECT
    c.CourseID,
    c.CourseName,
    COUNT(e.StudentID) AS TotalEnrolments
FROM Courses c
JOIN Enrolments e
    ON c.CourseID = e.CourseID
GROUP BY
    c.CourseID,
    c.CourseName
ORDER BY TotalEnrolments DESC;

/* 
Electrical Circuits with CourseID 33 has the highest number of  Enrolments (15) 
*/
---------------------------------------------------------------------------------_

--5. Which department has the least number of students?
SELECT TOP 1
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrolments e
    ON c.CourseID = e.CourseID
GROUP BY
    d.DepartmentID,
    d.DepartmentName
ORDER BY TotalStudents ASC;

-- Physics Department has the least number  of students (7 Students) --
---------------------------------------------------------------------------------_

-- Data Integrity & Operational Insights
---------------------------------------------------------------------------------_
-- 6. Are there any students not enrolled in any course? 
SELECT
    s.StudentID,
    s.FullName AS StudentName
FROM Students s
LEFT JOIN Enrolments e
    ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

-- There are three students that are not enrolled in any course namely, Adeola Martinez, Anthony Oluwafemi and Layla Ezinne. 
---------------------------------------------------------------------------------_

-- 7. How many courses does each student take on average? 
SELECT
    ROUND(AVG(CourseCount * 1.0), 0) AS AverageCoursesPerStudent
FROM (
    SELECT
        StudentID,
        COUNT(CourseID) AS CourseCount
    FROM Enrolments
    GROUP BY StudentID
) AS StudentCourseCounts;

-- Each student takes two courses on average.
---------------------------------------------------------------------------------_

-- 8. What is the gender distribution of students across courses and instructors?

SELECT
    i.FullName,
    s.Gender,
    COUNT(DISTINCT s.StudentID) AS TotalStudents
FROM CourseInstructors ci
JOIN Instructors i
    ON ci.InstructorID = i.InstructorID
JOIN Enrolments e
    ON ci.CourseID = e.CourseID
JOIN Students s
    ON e.StudentID = s.StudentID
GROUP BY
    i.FullName,
    s.Gender
ORDER BY
     TotalStudents DESC;

-- Dr. Rachel Eze is the instructor with the most students.
-- The gender breakdown is 8 female students and 7 male students, showing a fairly balanced participation from both genders.
---------------------------------------------------------------------------------_

-- 9. Which course has the highest number of male or female students enrolled?
SELECT
    c.CourseName,
    s.Gender,
    COUNT(s.StudentID) AS TotalStudents
FROM Enrolments e
JOIN Students s
    ON e.StudentID = s.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
GROUP BY
    c.CourseName,
    s.Gender
ORDER BY
    TotalStudents DESC;
-- Among all courses, Electrical Circuits stands out as the most popular, enrolling 15 students in total (8 Female Students & 7 Male Students)
