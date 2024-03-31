create database capstoneproject03

create table EmployeesDetails_table(Employee_ID int, FirstName varchar(225), LastName varchar(225),
Salary int , JoiningDate varchar(max), Department varchar(225), Gender varchar(225));



INSERT INTO EmployeesDetails_table(Employee_ID,FirstName,LastName, Salary, JoiningDate, Department, Gender)
VALUES
  (1, 'Vikas', 'Ahlawat', 600000, '2013-02-12', 'IT', 'Male'),
  (2, 'Nikita', 'Jain', 530000, '2013-02-14', 'HR', 'Female'),
  (3, 'Ashish', 'Kumar', 1000000, '2013-02-14', 'IT', 'Male'),
  (4, 'Nikhil', 'Sharma', 480000, '2013-02-15', 'HR', 'Male'),
  (5, 'Anish', 'Kadian', 500000, '2013-02-16', 'Paroll', 'Male');

  select * from EmployeesDetails_table

create table ProjectDetails_table(ProjectDetailID int,EmployeeDetailID int,ProjectName varchar(max));

insert into ProjectDetails_table(ProjectDetailID,EmployeeDetailID,ProjectName) values
(1,1,'Task_Track'),
(2,1,' CLP'),
(3,1,'Survey_Managment'),
(4,2,'HR_Managment'),
(5,3,'Task_Track'),
(1,3,'GRS'),
(1,3,' DDS'),
(1,4,'HR_Managment'),
(1,6,'GL_Management');

select * from ProjectDetails_table

---------------------------------------------------------------------------------------------------------------
-- 1) Write a query to get all employee details from "EmployeeDetail" table
SELECT * FROM EmployeesDetails_table;

-- 2) Write a query to get only the "FirstName" column from the "EmployeeDetail" table
SELECT FirstName FROM EmployeesDetails_table;

-- 3) Write a query to get FirstName in upper case as "First Name"
SELECT UPPER(FirstName) AS "First Name" FROM EmployeesDetails_table;

-- 4) Write a query to get FirstName in upper case as "First Name"
SELECT UPPER(FirstName) AS "First Name" FROM EmployeesDetails_table;

-- 5) Write a query to combine FirstName and LastName and display it as "Name" (including whitespace between first name & last name)
SELECT FirstName + ' ' + LastName AS "Name" FROM EmployeesDetails_table;

-- 6) Select employee details whose name is "Vikas"
SELECT * FROM EmployeesDetails_table WHERE FirstName = 'Vikas';

-- 7) Get all employee details from the EmployeeDetail table whose "FirstName" starts with the letter 'a'
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE 'a%';

-- 8) Get all employee details from the EmployeeDetail table whose "FirstName" starts with the letter 'a'
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE 'a%';

-- 9) Get all employee details from the EmployeeDetail table whose "FirstName" ends with 'h'
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE '%h';

-- 10) Get all employee details from the EmployeeDetail table whose "FirstName" starts with any single character between 'a-p'
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE '[a-p]%';

-- 11) Get all employee details from the EmployeeDetail table whose "FirstName" does not start with any single character between 'a-p'
SELECT * FROM EmployeesDetails_table WHERE FirstName NOT LIKE '[a-p]%';

-- 12) Get all employee details from the EmployeeDetail table whose "Gender" ends with 'le' and contains 4 letters
SELECT * FROM EmployeesDetails_table WHERE Gender LIKE '_le';

-- 13) Get all employee details from the EmployeeDetail table whose "FirstName" starts with 'A' and contains 5 letters
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE 'A____';

-- 14) Get all employee details from the EmployeeDetail table whose "FirstName" contains '%'. ex:-"Vik%as".
SELECT * FROM EmployeesDetails_table WHERE FirstName LIKE '%[%]%';

-- 15) Get all unique "Department" from EmployeeDetail table
SELECT DISTINCT Department FROM EmployeesDetails_table;

-- 16) Get the highest "Salary" from EmployeeDetail table
SELECT MAX(Salary) AS "Highest Salary" FROM EmployeesDetails_table;

-- 17) Get the lowest "Salary" from EmployeeDetail table
SELECT MIN(Salary) AS "Lowest Salary" FROM EmployeesDetails_table;

-- 18) Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"
SELECT CONVERT(varchar, JoiningDate, 106) AS "Joining Date" FROM EmployeesDetails_table;

-- 19) Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
SELECT CONVERT(varchar, JoiningDate, 111) AS "Joining Date" FROM EmployeesDetails_table;

-- 20) Show only the time part of the "JoiningDate"
SELECT CONVERT(varchar, JoiningDate, 108) AS "Joining Time" FROM EmployeesDetails_table;

-- 21) Get only the Year part of "JoiningDate"
SELECT YEAR(JoiningDate) AS "Joining Year" FROM EmployeesDetails_table;

-- 22) Get only the Month part of "JoiningDate”
SELECT MONTH(JoiningDate) AS "Joining Month" FROM EmployeesDetails_table;

-- 23) Get system date
SELECT GETDATE() AS "System Date";

-- 24) Get UTC date
SELECT GETUTCDATE() AS "UTC Date";

-- 25) Get the first name, current date, joining date, and the difference between the current date and joining date in months
SELECT FirstName, GETDATE() AS "Current Date", JoiningDate, DATEDIFF(MONTH, JoiningDate, GETDATE()) AS "Months Since Joining" FROM EmployeesDetails_table;

-- 26) Get the first name, current date, joining date, and the difference between the current date and joining date in days
SELECT FirstName, GETDATE() AS "Current Date", JoiningDate, DATEDIFF(DAY, JoiningDate, GETDATE()) AS "Days Since Joining" FROM EmployeesDetails_table;

-- 27) Get all employee details from the EmployeeDetail table whose joining year is 2013
SELECT * FROM EmployeesDetails_table WHERE YEAR(JoiningDate) = 2013;

-- 28) Get all employee details from the EmployeeDetail table whose joining month is Jan(1)
SELECT * FROM EmployeesDetails_table WHERE MONTH(JoiningDate) = 1;

-- 29) Get how many employees exist in the "EmployeeDetail" table
SELECT COUNT(*) AS "Total Employees" FROM EmployeesDetails_table;

-- 31) Select only one/top 1 record from "EmployeeDetail" table
SELECT TOP 1 * FROM EmployeesDetails_table;

-- 32) Select all employee details with First names "Vikas", "Ashish", and "Nikhil".
SELECT * FROM EmployeesDetails_table WHERE FirstName IN ('Vikas', 'Ashish', 'Nikhil');

-- 33) Select all employee details with First names not in "Vikas", "Ashish", and "Nikhil".
SELECT * FROM EmployeesDetails_table WHERE FirstName NOT IN ('Vikas', 'Ashish', 'Nikhil');

-- 34) Select first name from "EmployeeDetail" table after removing white spaces from the right side
SELECT RTRIM(FirstName) AS "First Name" FROM EmployeesDetails_table;

-- 35) Select first name from "EmployeeDetail" table after removing white spaces from the left side
SELECT LTRIM(FirstName) AS "First Name" FROM EmployeesDetails_table;

-- 36) Display first name and Gender as M/F (if male then M, if Female then F)
SELECT FirstName, CASE WHEN Gender = 'Male' THEN 'M' ELSE 'F' END AS "Gender" FROM EmployeesDetails_table;

-- 37) Select first name from "EmployeeDetail" table prefixed with "Hello"
SELECT 'Hello ' + FirstName AS "Hello First Name" FROM EmployeesDetails_table;

-- 38) Get employee details from "EmployeeDetail" table whose Salary is greater than 600000
SELECT * FROM EmployeesDetails_table WHERE Salary > 600000;

-- 39) Get employee details from "EmployeeDetail" table whose Salary is less than 700000
SELECT * FROM EmployeesDetails_table WHERE Salary < 700000;

-- 40) Get employee details from "EmployeeDetail" table whose Salary is between 500000 and 600000
SELECT * FROM EmployeesDetails_table WHERE Salary BETWEEN 500000 AND 600000;

-- 41) Give records of ProjectDetail table
SELECT * FROM ProjectDetails_table;

-- 42) Write the query to get the department and department-wise total(sum) salary from "EmployeeDetail" table
SELECT Department, SUM(Salary) AS "Total Salary" FROM EmployeesDetails_table GROUP BY Department;

-- 43) Write the query to get the department and department-wise total(sum) salary, display it in ascending order according to salary
SELECT Department, SUM(Salary) AS "Total Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY SUM(Salary) ASC;

-- 44) Write the query to get the department and department-wise total(sum) salary, display it in descending order according to salary
SELECT Department, SUM(Salary) AS "Total Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY SUM(Salary) DESC;

-- 45) Write the query to get the department, total number of departments, total(sum) salary with respect to department from "EmployeeDetail" table
SELECT Department, COUNT(*) AS "Total Employees", SUM(Salary) AS "Total Salary" FROM EmployeesDetails_table GROUP BY Department;

-- 46) Get department-wise average salary from "EmployeeDetail" table ordered by salary ascending
SELECT Department, AVG(Salary) AS "Average Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY AVG(Salary) ASC;

-- 47) Get department-wise maximum salary from "EmployeeDetail" table ordered by salary ascending
SELECT Department, MAX(Salary) AS "Max Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY MAX(Salary) ASC;

-- 48) Get department-wise minimum salary from "EmployeeDetail" table ordered by salary ascending
SELECT Department, MIN(Salary) AS "Min Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY MIN(Salary) ASC;

-- 49) Get department-wise minimum salary from "EmployeeDetail" table ordered by salary ascending
SELECT Department, MIN(Salary) AS "Min Salary" FROM EmployeesDetails_table GROUP BY Department ORDER BY MIN(Salary) ASC;

-- 50) Join both the tables that is Employee and ProjectDetail based on some common parameter
SELECT * FROM EmployeesDetails_table JOIN ProjectDetails_table ON EmployeesDetails_table.Employee_ID = ProjectDetails_table.EmployeeDetailID;

-- 51) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employees who have assigned projects already
SELECT e.FirstName AS "Employee Name", ProjectName AS "Project Name"
FROM EmployeesDetails_table e
JOIN ProjectDetails_table ON e.Employee_ID = ProjectDetailID;

-- 52) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employees even if they have not assigned projects
SELECT e.FirstName AS "Employee Name", COALESCE(p.ProjectName, '-No Project Assigned') AS "Project Name"
FROM EmployeesDetails_table e
LEFT JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;

-- 53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employees if project is not assigned then display "-No Project Assigned"
SELECT e.FirstName AS "Employee Name", COALESCE(p.ProjectName, '-No Project Assigned') AS "Project Name"
FROM EmployeesDetails_table e
LEFT JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;

-- 54) Get all project names even if they do not have matching employeeids, in the left table, order by firstname from "EmployeeDetail" and "ProjectDetail"
SELECT FirstName AS "Employee Name", COALESCE(p.ProjectName, '-No Employee Assigned') AS "Project Name"
FROM EmployeesDetails_table 
LEFT JOIN ProjectDetails_table p ON Employee_ID = ProjectDetailID;

-- 55) Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT e.FirstName AS "Employee Name", p.ProjectName AS "Project Name"
FROM EmployeesDetails_table e
FULL OUTER JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;

-- 56) Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT e.FirstName AS "Employee Name", p.ProjectName AS "Project Name"
FROM EmployeesDetails_table e
FULL OUTER JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;

-- 57) Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT e.FirstName AS "Employee Name", p.ProjectName AS "Project Name"
FROM EmployeesDetails_table e
FULL OUTER JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;

-- 58) Write down the query to fetch EmployeeName & Project who has assigned more than one project
SELECT e.FirstName AS "Employee Name", p.ProjectName AS "Project Name", COUNT(*) AS "Project Count"
FROM EmployeesDetails_table e
JOIN ProjectDetails_table p ON e.Employee_ID = ProjectDetailID;
GROUP BY e.FirstName, p.ProjectName
HAVING COUNT(*) > 1;

-- 59) Write down the query to fetch ProjectName on which more than one employee is working along with EmployeeName
SELECT ProjectName AS "Project Name", 'FirstName' AS "Employee Name", COUNT(*) AS "Employee Count"
FROM ProjectDetails_table 


-- 60) Apply Cross Join in Both the tables
SELECT * FROM EmployeesDetails_table CROSS JOIN ProjectDetails_table;
