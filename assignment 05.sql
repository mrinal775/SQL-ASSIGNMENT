-- 1. Create University Database
CREATE DATABASE UniversityMK_gandhi;


CREATE TABLE College_Table (
  College_ID int PRIMARY KEY,
  College_Name varchar(50) NOT NULL,
  College_Area varchar(50)
);

CREATE TABLE Department_Table (
  Dept_ID int PRIMARY KEY,
  Dept_Name varchar(50) NOT NULL,
  Dept_Facility varchar(50),
  College_ID int FOREIGN KEY REFERENCES College_Table(College_ID)
);

CREATE TABLE Professor_Table (
  Professor_ID int PRIMARY KEY,
  Professor_Name varchar(50) NOT NULL,
  Professor_Subject varchar(50)
);

CREATE TABLE Student_Table (
  Student_ID int PRIMARY KEY,
  Student_Name varchar(50) NOT NULL,
  Student_Stream varchar(50),
  Professor_ID int FOREIGN KEY REFERENCES Professor_Table(Professor_ID)
);

----------------------------------------------------------------------------------------------------------------------

INSERT INTO College_Table (College_ID, College_Name, College_Area) VALUES
(1, 'College of Engineering', 'Engineering Area 1'),
(2, 'College of Arts', 'Arts Area 1'),
(3, 'College of Science', 'Science Area 1'),
(4, 'College of Medicine', 'Medicine Area 1'),
(5, 'College of Business', 'Business Area 1'),
(6, 'College of Education', 'Education Area 1'),
(7, 'College of Law', 'Law Area 1'),
(8, 'College of Agriculture', 'Agriculture Area 1'),
(9, 'College of Architecture', 'Architecture Area 1'),
(10, 'College of Music', 'Music Area 1');

select * from College_Table

INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility, College_ID) VALUES
(1, 'Computer Science', 'Computer Lab', 1),
(2, 'Mathematics', 'Math Lab', 2),
(3, 'Physics', 'Physics Lab', 1),
(4, 'Chemistry', 'Chemistry Lab', 3),
(5, 'Biology', 'Biology Lab', 2),
(6, 'History', 'History Lab', 4),
(7, 'Literature', 'Literature Lab', 5),
(8, 'Economics', 'Economics Lab', 6),
(9, 'Psychology', 'Psychology Lab', 7),
(10, 'Sociology', 'Sociology Lab', 8);

select * from Department_Table

INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject) VALUES
(1, 'Michael Johnson', 'Physics'),
(2, 'Sarah Lee', 'Chemistry'),
(3, 'David Smith', 'Biology'),
(4, 'Emily Brown', 'English'),
(5, 'James Wilson', 'History'),
(6, 'Linda Martinez', 'Mathematics'),
(7, 'Daniel Taylor', 'Computer Science'),
(8, 'Jennifer Anderson', 'Economics'),
(9, 'Robert Clark', 'Psychology'),
(10, 'Karen Thomas', 'Sociology');

select * from Professor_Table

INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream, Professor_ID) VALUES
  (1, 'Alice', 'CS', 1),
  (2, 'Bob', 'Math', 2),
  (3, 'Charlie', 'Engineering', 3),
  (4, 'David', 'Business', 4),
  (5, 'Eve', 'Arts', 5),
  (6, 'Frank', 'CS', 1),
  (7, 'Grace', 'Math', 2),
  (8, 'Henry', 'Engineering', 3),
  (9, 'Isabella', 'Business', 4),
  (10, 'Jack', 'Arts', 5);

------------------------------------------------------------------------------------------------------------------------------
------task 02--------------------
-- 1. Information of College_ID and College_name from College_Table
SELECT College_ID, College_Name FROM College_Table;

-- 2. Top 5 rows from Student_Table
SELECT TOP 5 * FROM Student_Table;

-- 3. Name of professor whose ID is 5
SELECT Professor_Name FROM Professor_Table WHERE Professor_ID = 5;

-- 4. Convert name of Professor to uppercase
SELECT UPPER(Professor_Name) AS Professor_Name_Upper FROM Professor_Table;

-- 5. Names of students whose name starts with 'a'
SELECT Student_Name FROM Student_Table WHERE Student_Name LIKE 'a%';

-- 6. Names of colleges whose name ends with 'a'
SELECT College_Name FROM College_Table WHERE College_Name LIKE '%a';

-- 7. Add Salary Column in Professor_Table
ALTER TABLE Professor_Table ADD Salary DECIMAL(10, 2);

-- 8. Add Contact Column in Student_Table
ALTER TABLE Student_Table ADD Contact VARCHAR(20);

-- 9. Total Salary of Professors
SELECT SUM(Salary) AS Total_Salary FROM Professor_Table;

-- 10. Change datatype of any one column of any one Table
ALTER TABLE College_Table ALTER COLUMN College_Area VARCHAR(100);


-------------------------------------------------------------------------------------------------------------------
------task03------------------------------------------------
-- 1. First 5 records from Students table and Professor table combined
SELECT TOP 5 s.Student_ID, s.Student_Name, s.Student_Stream, p.Professor_ID, p.Professor_Name, p.Professor_Subject
FROM Student_Table s
INNER JOIN Professor_Table p ON s.Professor_ID = p.Professor_ID
ORDER BY s.Student_ID;


-- 2. Inner join on all 4 tables
SELECT * FROM College_Table
INNER JOIN Department_Table ON College_Table.College_ID = Department_Table.College_ID
INNER JOIN Professor_Table ON Department_Table.Dept_ID = Professor_Table.Professor_ID
INNER JOIN Student_Table ON Professor_Table.Professor_ID = Student_Table.Professor_ID;

-- 3. Show some null values from Department table and Professor table
SELECT * FROM Department_Table WHERE Dept_Facility IS NULL
UNION ALL
SELECT * FROM Professor_Table WHERE Professor_Subject IS NULL;

-- 4. Create a View from College Table whose name starts with 'C'
CREATE VIEW CollegesStartingWithC AS
SELECT * FROM College_Table WHERE College_Name LIKE 'C%';


-- 5. Create Stored Procedure to show records based on Professor_ID
CREATE PROCEDURE Get ProfessorRecords
    @ProfessorID INT
AS
BEGIN
    SELECT * FROM Professor_Table WHERE Professor_ID = @ProfessorID;
END;

-- 6. Rename the College_Table to College_Tables_Data
EXEC sp_rename 'College_Table', 'College_Tables_Data';
