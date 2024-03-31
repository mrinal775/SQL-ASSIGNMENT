create database HR_DATABASE_MANAGMENT_SYSTEM

CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name VARCHAR (25) DEFAULT NULL
);


CREATE TABLE countries (
	country_id CHAR (2) PRIMARY KEY,
	country_name VARCHAR (40) DEFAULT NULL,
	region_id INT NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address VARCHAR (40) DEFAULT NULL,
	postal_code VARCHAR (12) DEFAULT NULL,
	city VARCHAR (30) NOT NULL,
	state_province VARCHAR (25) DEFAULT NULL,
	country_id CHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE jobs (
	job_id INT PRIMARY KEY,
	job_title VARCHAR (35) NOT NULL,
	min_salary DECIMAL (8, 2) DEFAULT NULL,
	max_salary DECIMAL (8, 2) DEFAULT NULL
);


CREATE TABLE departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR (30) NOT NULL,
	location_id INT DEFAULT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);






CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	relationship VARCHAR (25) NOT NULL,
	employee_id INT NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO regions(region_id,region_name) 
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) 
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) 
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) 
VALUES (4,'Middle East and Africa');



INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
 VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) 
VALUES ('ZW','Zimbabwe',4);



INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) 
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
 VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');




INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
 VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) 
VALUES (19,'Stock Manager',5500.00,8500.00);





INSERT INTO departments(department_id,department_name,location_id)
 VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
 VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id) 
VALUES (11,'Accounting',1700);



INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
 VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
 VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);



INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id)
 VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (29,'Alec','Partners','Child',146);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) 
VALUES (30,'Sandra','Taylor','Child',176);


-------------------------------------------------------

SELECT * from employees

SELECT employee_id, first_name, last_name, hire_date FROM employees;

ALTER TABLE employees ADD New_Salary int 

SELECT first_name, last_name, salary, new_salary
FROM employees;

UPDATE employees
SET New_SALARY = salary * 2;

-------------------------------------------------------------------

SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees;


SELECT *
FROM employees
ORDER BY first_name;

SELECT *
FROM employees
ORDER BY first_name ASC, last_name DESC;

SELECT *
FROM employees
ORDER BY salary DESC;

SELECT *
FROM employees
ORDER BY hire_date;

SELECT *
FROM employees
ORDER BY hire_date DESC;

------------------------------------------------------------------------------
--3.

SELECT salary
FROM employees
ORDER BY salary DESC;

SELECT DISTINCT salary
FROM employees;

SELECT job_id, salary
FROM employees;

SELECT job_id, salary
FROM employees
GROUP BY job_id, salary;

SELECT DISTINCT phone_number
FROM employees;

--------------------------------------------------------------------------------
--4

SELECT *
FROM employees
ORDER BY first_name;


SELECT TOP 5 * FROM employees;



SELECT *
FROM employees
ORDER BY first_name
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;


SELECT TOP 5 *
FROM employees
ORDER BY Salary DESC;


SELECT *
FROM employees
WHERE Salary = (SELECT MAX(Salary) FROM employees WHERE Salary <(SELECT MAX(Salary)FROM employees ));


-------------------------------------------------------------------------
--5.

-----A.
SELECT *
FROM employees
WHERE Salary > 14000
ORDER BY Salary DESC;

-----B.
SELECT *
FROM employees
WHERE department_id = 5;

-----C.
SELECT *
FROM employees
WHERE last_name = 'Chen';

----D.
SELECT *
FROM employees
WHERE hire_date > '1999-01-01';

-----E.
SELECT *
FROM employees
WHERE YEAR(hire_date) = 1999;

---F.
SELECT *
FROM employees
WHERE last_name = 'Himuro';

-----G.
SELECT *
FROM employees
WHERE last_name LIKE '%Himuro%';

-----H.
SELECT *
FROM employees
WHERE phone_number IS NULL;

-----I.
SELECT *
FROM employees
WHERE department_id != 8;

-----J.
SELECT *
FROM employees
WHERE department_id NOT IN (8, 10);

-----K.
SELECT *
FROM employees
WHERE Salary > 10000;

-----L.
SELECT *
FROM employees
WHERE department_id = 8
AND Salary > 10000;

-----M.
SELECT *
FROM employees
WHERE Salary < 10000;

-----N.
SELECT *
FROM employees
WHERE Salary >= 9000;

-----O.
SELECT *
FROM employees
WHERE Salary <= 9000;

------------------------------------------------------------------------------------------------------------------------------
--6.
create table Courses(Course_id int,Course_Name varchar(25));

select * from Courses

ALTER TABLE Courses
ADD credit_hours INT;


ALTER TABLE Courses add fee int,max_limit int;


ALTER TABLE Courses
ALTER COLUMN fee DECIMAL(10, 2) NOT NULL; 

alter table Courses
drop column fee; 

alter table Courses
drop column max_limit ,credit_hours;


--------------------SQL FOREIGN KEY CONSTRAINT-------------------------------------

CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);

CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);


ALTER TABLE project_milestones
ADD CONSTRAINT project_milestones_projects
FOREIGN KEY (project_id) REFERENCES projects_id;




-------------------------------------------------------------------------------------------------------
------TASK 02-------------------------
-----1.
--A.
SELECT *
FROM employees
WHERE salary > 5000 AND salary < 7000;

--B.
SELECT *
FROM employees
WHERE salary = 7000 OR salary = 8000;

--C.
SELECT *
FROM employees
WHERE phone_number IS NULL;

--D
SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 12000;

--E.
SELECT *
FROM employees
WHERE department_id IN (8, 9);

--F.
SELECT *
FROM employees
WHERE first_name LIKE 'jo%';

--G.
SELECT *
FROM employees
WHERE first_name LIKE '_h%';

--H.
SELECT *
FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_id = 8);

----------------------------------------------------------------------------------------------------------------------------------
-----part02.
--A.
SELECT *
FROM employees
WHERE salary > ALL (SELECT AVG(salary) FROM employees GROUP BY department_id);

--B.
SELECT DISTINCT e.*
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;

--C.
SELECT *
FROM employees
WHERE salary BETWEEN 2500 AND 2900;

--D.
SELECT *
FROM employees
WHERE salary < 2500 OR salary > 2900;

--E.
SELECT *
FROM employees
WHERE hire_date >= '1999-01-01' AND hire_date <= '2000-12-31';

--F.
SELECT *
FROM employees
WHERE hire_date < '1989-01-01' OR hire_date > '1999-12-31';

--G.
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1993;

----------------------------------------------------------------------------------------------------------------------
--part03.
SELECT *
FROM employees
WHERE first_name LIKE 'Da%';

--b.
SELECT *
FROM employees
WHERE first_name LIKE '%er';

--c.
SELECT *
FROM employees
WHERE last_name LIKE '%an%';

--d.
SELECT *
FROM employees
WHERE first_name LIKE 'Jo__';

--e.
SELECT *
FROM employees
WHERE first_name LIKE '_%_';

--f.
SELECT *
FROM employees
WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';

-------------------------------------------------------------------------------------------------------------------------
-----part04----
SELECT * FROM employees WHERE department_id = 5;

---b.
SELECT * 
FROM employees 
WHERE department_id = 5 
AND salary <= 5000;

----c.
SELECT * 
FROM employees 
WHERE department_id NOT IN (1, 2, 3);

----d.
SELECT * 
FROM employees 
WHERE first_name NOT LIKE 'D%';

----e.
SELECT * 
FROM employees 
WHERE salary NOT BETWEEN 1000 AND 5000;

------------------------------------------------------------------------------------------------------------------------
---part05--
SELECT e.*
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.employee_id IS NULL;

SELECT *
FROM employees
WHERE phone_number IS NULL;

SELECT *
FROM employees
WHERE phone_number IS NOT NULL;
---------------------------------------------------------------------------------------------------------------------------------
-----task03-----------------------------------------------
SELECT *
FROM departments
WHERE department_id IN (1, 2, 3);

SELECT *
FROM employees
WHERE department_id IN (1, 2, 3);

SELECT e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (1, 2, 3);

---------------------------------------------------------------------------------------------------------------------------------
----SQL LEFT JOIN CLAUSE----------------------
SELECT country_name
FROM countries
WHERE country_name IN ('United state of America','United Kingdom','China');

select * from countries

select * from locations

SELECT *
FROM locations
WHERE country_id IN ('US', 'UK', 'China');

SELECT l.*, c.*
FROM locations l
INNER JOIN countries c ON l.country_id = c.country_name;

SELECT c.country_name
FROM countries c
LEFT JOIN locations l ON c.country_name = l.country_id
WHERE l.country_id IS NULL;

SELECT *
FROM regions r
JOIN countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id;
-------------------------------------------------------------------------------------------
SELECT e1.employee_id AS employee_id,
       e1.first_name AS employee_first_name,
       e1.last_name AS employee_last_name,
       e2.employee_id AS manager_id,
       e2.first_name AS manager_first_name,
       e2.last_name AS manager_last_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;
----------------------------------------------------------------------------------------------------------
CREATE  TABLE  fruits (
	fruit_id  INT PRIMARY KEY,
	fruit_name  VARCHAR (255) NOT NULL,
	basket_id  INTEGER);

CREATE TABLE baskets (
	basket_id  INT PRIMARY KEY,
	basket_name  VARCHAR (255) NOT NULL);

INSERT  INTO  baskets  (basket_id, basket_name)
VALUES
	(1, 'A'),
	(2, 'B'),
	(3, 'C');


INSERT  INTO  fruits (fruit_id,fruit_name,basket_id)VALUES
	(1, 'Apple', 1),
	(2, 'Orange', 1),
	(3, 'Banana', 2),
	(4, 'Strawberry', NULL);
----------------------------------------
SELECT b.basket_id, f.fruit_id
FROM baskets b
LEFT JOIN basket_contents bc ON b.basket_id = bc.basket_id
LEFT JOIN fruits f ON bc.fruit_id = f.fruit_id

UNION

SELECT b.basket_id, f.fruit_id
FROM fruits f
LEFT JOIN fruits ON f.fruit_id = bc.fruit_id
RIGHT JOIN baskets  ON basket_id = basket_id;

SELECT basket_id
FROM Baskets
WHERE basket_id NOT IN (SELECT DISTINCT basket_id FROM Fruits);


SELECT DISTINCT fruit_name
FROM Fruits
LEFT JOIN Baskets ON Fruits.basket_id = Baskets.basket_id
WHERE Baskets.basket_id IS NULL;

------------------------------------------------------------------------------------------------------------------
CREATE  TABLE  sales_organization (
	sales_org_id  INT PRIMARY KEY,
	sales_org  VARCHAR (255));

 CREATE  TABLE  sales_channel (
	channel_id  INT PRIMARY KEY,
	channel  VARCHAR (255));

INSERT INTO sales_organization (sales_org_id, sales_org)
VALUES
	(1, 'Domestic'),
	(2, 'Export');

INSERT INTO sales_channel (channel_id, channel)
VALUES
	(1, 'Wholesale'),
	(2, 'Retail'),
	(3, 'eCommerce'),
	(4, 'TV Shopping');

SELECT DISTINCT Channel
FROM Sales_Channel
WHERE channel_id = 'sales_org_id';

--------------------------------------------------------------------------------------------------------
-----task04-------------
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(employee_id) AS num_employees
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(employee_id) AS headcount
FROM employees
GROUP BY department_id
ORDER BY headcount DESC;

SELECT department_id, COUNT(employee_id) AS headcount
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;

SELECT department_id, 
 MIN(salary) AS min_salary, 
 MAX(salary) AS max_salary, 
 AVG(salary) AS avg_salary FROM employees GROUP BY department_id;

SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, COUNT(*) AS num_rows
FROM employees GROUP BY department_id, job_id;

---------------------------------------------------------------------------------------------------------------------
----SQL HAVING CLAUSE--------------------

SELECT 
    m.employee_id AS manager_id,
    m.first_name AS manager_name,
    COUNT(e.employee_id) AS num_direct_reports
FROM 
    employees m
LEFT JOIN 
    employees e ON m.employee_id = e.manager_id
GROUP BY 
    m.employee_id, m.first_name;
-------------------------------------------------------------------------

SELECT  m.employee_id AS manager_id, m.first_name AS manager_name,
COUNT(e.employee_id) AS num_direct_reports FROM  employees m
LEFT JOIN 
employees e ON m.employee_id = e.manager_id
GROUP BY m.employee_id, m.first_name
HAVING COUNT(e.employee_id) >= 5;
------------------------------------------------------

SELECT department_id,SUM(salary) AS total_salary
FROM employees GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;
--------------------------------------------------------

SELECT department_id FROM employees WHERE salary = (SELECT MIN(salary)
FROM employees WHERE salary > 10000);
--------------------------------------------------------

SELECT department_id FROM employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;
-------------------------------------------------------------------------------------------------------------------------------------
---------TASK05---------------

--1.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
UNION
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM dependents;
---------------------------------------------------------------
--2.

SELECT employee_id
FROM employees
INTERSECT
SELECT department_id
FROM departments
ORDER BY manager_id DESC;

------------------------------------------------------------------------
---3.-
SELECT DISTINCT e.*
FROM employees e
JOIN dependents d ON e.employee_id = d.employee_id;


SELECT e.*
FROM employees e
LEFT JOIN dependents d ON e.employee_id = d.employee_id
WHERE d.employee_id IS NULL;

--------------------------------------------------------------------------
--4.--
SELECT 
    employee_id,
    first_name,
    last_name,
    CASE  WHEN YEAR(hire_date) = 2000 THEN 'Work Anniversary in 2000'
        ELSE 'No Work Anniversary in 2000'
    END AS anniversary_status
FROM employees;

----
SELECT employee_id, first_name, last_name, salary,CASE WHEN salary < 3000 THEN 'Low'
WHEN salary >= 3000 AND salary <= 5000 THEN 'Average'
WHEN salary > 5000 THEN 'High'
ELSE 'Unknown'  END AS salary_category FROM employees;

------------------------------------------------------------------------------------------------------------
---5.---
UPDATE employees
SET last_name = 'Lopez'
WHERE first_name = 'Sarah' AND last_name = 'Bell';

-------------------FINAL TASK--------------------------------------------------------------------------------------------------

SELECT * FROM departments
WHERE location_id = 1700;


SELECT employee_id, first_name, last_name FROM employees
WHERE department_id IN (1 , 3, 8, 10, 11)
ORDER BY first_name , last_name
--------------------------------------------------

SELECT e.* FROM employees e WHERE e.department_id IN ( SELECT d.department_id
FROM departments d WHERE d.location_id = 1700);


SELECT * FROM employees WHERE department_id NOT IN (SELECT location_id
FROM departments WHERE location_id = 1700);


SELECT * FROM employees WHERE salary = (SELECT MAX(salary)
FROM employees);


SELECT * FROM employees WHERE salary > (SELECT AVG(salary)
FROM employees);


SELECT DISTINCT d.*
FROM departments d INNER JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 10000;


SELECT DISTINCT d.*
FROM departments d
WHERE d.department_id NOT IN (SELECT DISTINCT e.department_id FROM employees e
WHERE e.salary > 10000);


SELECT department_id, MIN(salary) AS lowest_salary
FROM employees GROUP BY department_id;


SELECT * FROM employees e
WHERE e.salary > ( SELECT MIN(salary) FROM employees
WHERE department_id = e.department_id);


SELECT * FROM employees e WHERE e.salary >= (SELECT MAX(salary) FROM employees
WHERE department_id = e.department_id);


SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;


SELECT AVG(average_salary) AS avg_of_avg_salary
FROM (SELECT AVG(salary) AS average_salary FROM employees
GROUP BY department_id) AS department_avg_salary;


SELECT  employee_id,salary,(SELECT AVG(salary) FROM employees) AS average_salary,
salary - (SELECT AVG(salary) FROM employees) AS salary_difference
FROM employees;



-----------------------------------------------------END------------------------------------------------------------------------------------------------