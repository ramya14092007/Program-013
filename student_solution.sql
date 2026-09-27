7CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE StudentCourse (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student VALUES
(1001, 'Arun'),
(1002, 'Priya'),
(1003, 'Kumar');

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Faculty VALUES
(1, 'Dr. Ravi', 1),
(2, 'Dr. Meena', 2);

INSERT INTO Course VALUES
(101, 'Database Systems', 1),
(102, 'Data Structures', 1),
(103, 'Mathematics', 2);

INSERT INTO StudentCourse VALUES
(1001, 101),
(1001, 102),
(1002, 103),
(1003, 101);
