create database SQLASSIGNMENT_03

create table EmployeeDetails(Empid int,fullname varchar(25),Managerid int,Dateofjoining int,City varchar(25));

create table Employeesalary(Empid int,Project varchar(25),salary int,variable int);

INSERT INTO EmployeeDetails (Empid, fullname, Managerid, dateofjoining, city)
VALUES (121, 'john snow', 321, 2019-01-31, 'Toronto'),
       (321, 'walter white', 986, 2020-01-30, 'California'),
       (421, 'kuldeep rana', 876, 2021-11-27, 'New delhi');

select * from EmployeeDetails

insert into Employeesalary (Empid,Project,salary,variable) values
   (121,'P1',8000,500),
   (321,'P2',10000,1000),
   (421,'P1',12000,0);

select * from Employeesalary

-----------01--

SELECT *
FROM EmployeeDetails
WHERE Empid NOT IN (
  SELECT Empid
  FROM Employeesalary);

---------------02=
SELECT Empid FROM EmployeeSalary WHERE Project IS NULL;

----03
SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020;

---04
SELECT *
FROM EmployeeDetails E
WHERE EXISTS (
  SELECT *
  FROM EmployeeSalary S
  WHERE E.EmpId = S.EmpId
);


----05
SELECT Project, COUNT(EmpId) EmpProjectCount
FROM EmployeeSalary
GROUP BY Project
ORDER BY EmpProjectCount DESC;

---06-
SELECT E.FullName, S.Salary
FROM EmployeeDetails E
LEFT JOIN EmployeeSalary S
ON E.EmpId = S.EmpId;

---07
SELECT *
FROM EmployeeDetails
WHERE Empid IN (SELECT Managerid FROM EmployeeDetails);

---08
SELECT *
FROM EmployeeDetails
GROUP BY Empid, fullname, Managerid, dateofjoining, city
HAVING COUNT(*) > 1;

---09
select * from EmployeeDetails where Empid %2=1;


----10
SELECT Salary
FROM (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
    FROM EmployeeSalary
) AS SalaryRank
WHERE RowNum = 3;


---------------------------------------------------------------------------------------------------------------------------------------------
-------------nos 02--------------------
---01
SELECT Empid, fullname
FROM EmployeeDetails
WHERE Managerid = 986;

----02
SELECT DISTINCT Project
FROM EmployeeSalary;

-----03
SELECT COUNT(*)
FROM EmployeeSalary
WHERE Project = 'P1';

-----04
SELECT
  MAX(Salary) AS MaximumSalary,
  MIN(Salary) AS MinimumSalary,
  AVG(Salary) AS AverageSalary
FROM EmployeeSalary;

----05
SELECT Empid
FROM EmployeeSalary
WHERE Salary BETWEEN 9000 AND 15000;

---06-
SELECT Empid, fullname
FROM EmployeeDetails
WHERE city = 'Toronto' AND Managerid = 321;

---07
SELECT ed.Empid, ed.fullname
FROM EmployeeDetails ed
WHERE ed.city = 'California'
   OR ed.Managerid = 321;

------08
SELECT EmpId FROM EmployeeSalary WHERE Project <> 'P1';

-----09
SELECT Empid, salary+variable AS TotalSalary FROM EmployeeSalary;

----10
SELECT fullname FROM employeedetails WHERE fullname LIKE '__hn%';

-------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------nos03------
----01
SELECT Empid
FROM EmployeeDetails
UNION
SELECT Empid
FROM EmployeeSalary;

----02
SELECT *
FROM employeedetails
INNER JOIN employeesalary
ON employeedetails.empid = employeesalary.empid;

---03
SELECT * FROM EmployeeDetails
WHERE NOT EXISTS (SELECT * FROM Employeesalary WHERE EmployeeDetails.Empid = Employeesalary.Empid);

---04
SELECT Empid
FROM EmployeeDetails
WHERE Empid IN (SELECT Empid FROM EmployeeSalary);

---05
SELECT Empid FROM EmployeeDetails where Empid Not IN (SELECT Empid FROM EmployeeSalary);

----06
SELECT REPLACE(FullName, ' ', '-') FROM EmployeeDetails;

---07
SELECT CHARINDEX('a', fullname) AS Position
FROM EmployeeDetails;


----08
SELECT Empid, Managerid
FROM EmployeeDetails;

---09
SELECT LEFT(FullName, CHARINDEX(' ', FullName + ' ') - 1) AS FirstName
FROM EmployeeDetails;

---10

SELECT UPPER(fullname), LOWER(city) FROM employeedetails;

------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------nos04-------------------------

---01
SELECT 
    (LEN(fullname) - LEN(REPLACE(fullname, 'n', ''))) AS CountOfN
FROM 
    EmployeeDetails;

---02
UPDATE EmployeeDetails
SET fullname = TRIM(fullname);

---03
SELECT Empid from employeesalary where project is NULL


---04
SELECT fullname
FROM EmployeeDetails
WHERE Empid IN (SELECT Empid FROM Employeesalary WHERE salary BETWEEN 5000 AND 10000);

----05
SELECT GETDATE() AS CurrentDateTime;

---06
SELECT * FROM EmployeeDetails WHERE YEAR(DateOfJoining) = '2020'

----07
SELECT * FROM EmployeeDetails WHERE EXISTS (SELECT * FROM EmployeeSalary  WHERE Empid = Empid);

----08
SELECT Project, COUNT(Empid) AS EmployeeCount
FROM Employeesalary
GROUP BY Project
ORDER BY EmployeeCount DESC;

-----09
SELECT E.FullName, S.Salary
FROM EmployeeDetails E
LEFT JOIN EmployeeSalary S ON E.EmpId = S.EmpId;

----10
SELECT *
FROM Employeedetails
INNER JOIN EmployeeSalary
ON Employeedetails.EmpId = EmployeeSalary.EmpId;