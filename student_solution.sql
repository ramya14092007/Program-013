CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

DROP TABLE IF EXISTS StudentCourse;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Faculty;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Student;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID)
        REFERENCES Faculty(FacultyID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL
);

CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- Department: 2 records
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

-- Faculty: 2 records
INSERT INTO Faculty VALUES
(101, 'Dr. Ravi', 1),
(102, 'Dr. Meena', 2);

-- Course: 3 records
INSERT INTO Course VALUES
(201, 'Database Systems', 101),
(202, 'Data Structures', 101),
(203, 'Mathematics', 102);

-- Student: 3 records
INSERT INTO Student VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');

-- StudentCourse: 4 records
INSERT INTO StudentCourse VALUES
(1001, 201),
(1001, 202),
(1002, 203),
(1003, 201);

-- Display normalized data
SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Student s
JOIN StudentCourse sc
    ON s.StudentID = sc.StudentID
JOIN Course c
    ON sc.CourseID = c.CourseID
JOIN Faculty f
    ON c.FacultyID = f.FacultyID
JOIN Department d
    ON f.DepartmentID = d.DepartmentID;
