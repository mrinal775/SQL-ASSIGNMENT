create database assignment04

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    BirthDate DATE,
    Gender VARCHAR(10),
    Class VARCHAR(20),
    Point INT
);

-- Insert 20 records into the Student table

INSERT INTO Student (StudentID, Name, Surname, BirthDate, Gender, Class, Point)
VALUES
    (1, 'John', 'Doe', '2000-01-05', 'Male', '10A', 85),
    (2, 'Jane', 'Smith', '2001-03-15', 'Female', '11B', 92),
    (3, 'Alice', 'Johnson', '2000-07-20', 'Female', '10C', 78),
    (4, 'Bob', 'Williams', '1999-12-10', 'Male', '12A', 91),
    (5, 'Emily', 'Brown', '2001-09-25', 'Female', '11A', 88),
    (6, 'Michael', 'Jones', '2000-04-30', 'Male', '10B', 79),
    (7, 'Emma', 'Garcia', '2001-06-08', 'Female', '11C', 90),
    (8, 'James', 'Martinez', '2000-02-18', 'Male', '12B', 87),
    (9, 'Olivia', 'Lopez', '2001-11-12', 'Female', '10D', 82),
    (10, 'William', 'Hernandez', '1999-08-07', 'Male', '11D', 93),
    (11, 'Sophia', 'Young', '2000-10-03', 'Female', '12C', 84),
    (12, 'Benjamin', 'King', '2001-04-16', 'Male', '10E', 89),
    (13, 'Ava', 'Lee', '2000-12-22', 'Female', '11E', 86),
    (14, 'Alexander', 'Scott', '2001-05-29', 'Male', '12D', 80),
    (15, 'Mia', 'Nguyen', '2000-03-08', 'Female', '10F', 94),
    (16, 'Daniel', 'Chan', '1999-06-14', 'Male', '11F', 77),
    (17, 'Chloe', 'Wong', '2001-01-17', 'Female', '12E', 81),
    (18, 'Ethan', 'Chan', '2000-08-04', 'Male', '10G', 95),
    (19, 'Isabella', 'Chen', '2001-07-11', 'Female', '11G', 83),
    (20, 'Liam', 'Kim', '1999-09-28', 'Male', '12F', 88);


-------------------------------------------------------------------------------------------------------------------------------------
---01
select * from Student

-----02
SELECT Name, Surname, Class
FROM Student;

---03
SELECT *
FROM Student
WHERE Gender = 'Female';

---04
SELECT DISTINCT Class
FROM Student;

---05
SELECT *
FROM Student
WHERE Gender = 'Female' AND Class = '10F';

----06
SELECT Name, Surname, Class
FROM Student
WHERE Class IN ('10D','11A');

-----07
SELECT Name, Surname, Point
FROM Student;

-----08
SELECT Name + ' ' + Surname AS [Name Surname]
FROM Student;

----09
SELECT *
FROM Student
WHERE Name LIKE 'A%';

-----10
SELECT *
FROM Student
WHERE Name LIKE 'E%' OR Name LIKE 'S%' OR Name LIKE 'R%';

---------------------------------------------------------------------------------------------------------------