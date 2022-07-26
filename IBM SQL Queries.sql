-- github.com/hasanshanto

/*
Database: SanFranciscoFilmLocations

FilmLocations(
    Title:              titles of the films, 
    ReleaseYear:        time of public release of the films, 
    Locations:          locations of San Francisco where the films were shot, 
    FunFacts:           funny facts about the filming locations, 
    ProductionCompany:  companies who produced the films, 
    Distributor:        companies who distributed the films, 
    Director:           people who directed the films, 
    Writer:             people who wrote the films, 
    Actor1:             person 1 who acted in the films, 
    Actor2:             person 2 who acted in the films, 
    Actor3:             person 3 who acted in the films
)

*/


-- ***SELECT***

-- 1.Retrieve all records with all columns from the “FilmLocations” table.

-- ANS:
SELECT * 
FROM FilmLocations;

--2. Retrieve the names of all films with director names and writer names.

--ANS:
SELECT Title, Director, Writer
FROM FilmLocations;

-- 3. Retrieve the names of all films released in the 21st century and onwards (release years after 2001 including 2001), along with filming locations and release years.

-- ANS:
SELECT Title, ReleaseYear, Locations
FROM FilmLocations
WHERE ReleaseYear >= 2001;

-- 4. Retrieve the fun facts and filming locations of all films.

-- ANS: 
SELECT FunFacts, Locations
FROM FilmLocations;

-- 5. Retrieve the names of all films released in the 20th century and before (release years before 2000 including 2000) that, along with filming locations and release years.

-- ANS: 
SELECT Title, Locations, ReleaseYear
FROM FilmLocations
WHERE ReleaseYear <= 2000;

-- 6. Retrieve the names, production company names, filming locations, and release years of the films which are not written by James Cameron.

-- ANS:
SELECT Title, Locations, ReleaseYear, ProductionCompany
FROM FilmLocations
WHERE Director <> "James Cameron";


-- ***COUNT***

-- 1. Retrieve the number of locations of the films which are directed by Woody Allen.

-- ANS:
SELECT COUNT(Locations) 
FROM FilmLocations
WHERE Director = "Woody Allen";

-- 2. Retrieve the number of films shot at Russian Hill.

-- ANS:
SELECT COUNT(Locations) 
FROM FilmLocations
WHERE Locations = "Russian Hill";

-- 3. Retrieve the number of rows having a release year older than 1950 from the “FilmLocations” table.

-- ANS:
SELECT COUNT(*) 
FROM FilmLocations
WHERE ReleaseYear < 1950;

-- ***DISTINCT***

-- 1. Retrieve the number of release years of the films distinctly, produced by Warner Bros. Pictures.

-- ANS: 
SELECT COUNT(DISTINCT ReleaseYear)
FROM FilmLocations
WHERE ProductionCompany = "Warner Bros. Pictures";

--2. Retrieve the name of all unique films released in the 21st century and onwards, along with their release years.

--ANS: 
SELECT DISTINCT Title, ReleaseYear
FROM FilmLocations
WHERE ReleaseYear >= 2001;

--3. Retrieve the names of all the directors and their distinct films shot at City Hall.

--ANS:
SELECT DISTINCT Title, Director
FROM FilmLocations
WHERE Locations = "City Hall";

--4. Retrieve the number of distributors distinctly who distributed films acted by Clint Eastwood as 1st actor.

--ANS:
SELECT COUNT(DISTINCT Distributor)
FROM FilmLocations
WHERE Actor1 = "Clint Eastwood";

--***LIMIT***

--1. Retrieve the first 15 rows from the “FilmLocations” table starting from row 11.

--ANS:
SELECT *
FROM FilmLocations
LIMIT 15
OFFSET 10:

--2. Retrieve the name of first 50 films distinctly.

--ANS:
SELECT DISTINCT(Title)
FROM FilmLocations 
LIMIT 50;

--3. Retrieve first 10 film names distinctly released in 2015.

--ANS:
SELECT DISTINCT(Title)
FROM FilmLocations 
WHERE ReleaseYear = 2015
LIMIT 10;

--4. Retrieve the next 3 film names distinctly after first 5 films released in 2015.

--ANS:
SELECT DISTINCT(Title)
FROM FilmLocations 
WHERE ReleaseYear = 2015
LIMIT 3
OFFSET 5;

/*
Database:


Instructor (
    ins_id:     unique identification number of the instructors,    
    lastname:   last name of the instructors,
    firstname:  first name of the instructors,
    city:       name of the cities where instructors are located,
    country:    two-letter country code of the countries where instructors are located
)
*/

--***INSERT***

--1. Insert a new instructor record with id 7 for Antonio Cangiano who lives in Vancouver, CA into the “Instructor” table.

--ANS:
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(7, 'Cangiano', 'Antonio', 'Vancouver', 'CA');

--2. Insert two new instructor records into the “Instructor” table. First record with id 8 for Steve Ryan who lives in Barlby, GB. Second record with id 9 for Ramesh Sannareddy who lives in Hyderabad, IN.
--ANS:
INSERT INTO Instructor(ins_id, lastname, firstname, city, country)
VALUES(8, 'Ryan', 'Steve', 'Barlby', 'GB'), 
(9, 'Sannareddy', 'Ramesh', 'Hyderabad', 'IN');

--***UPDATE***

--1. Update the city of the instructor record to Markham whose id is 1.

--ANS:
UPDATE Instructor
SET city = "Markham"
WHERE ins_id = 1;

--2. Update the city and country for Sandip with id 4 to Dhaka and BD respectively.

--ANS:
UPDATE Instructor
SET city = "Dhaka", Country = "BD"
WHERE ins_id = 4;


--***DELETE***

--1. Remove the instructor record of Hima.

--ANS:
DELETE FROM Instructor
WHERE firstname = "Hima";


--***DDL***

--How does the syntax of a CREATE statement look?

/*
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
*/

--How does the syntax of an ALTER statement look?

ALTER TABLE table_name
ADD COLUMN column_name data_type column_constraint;

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE table_name
ALTER COLUMN column_name SET DATA TYPE data_type;

ALTER TABLE table_name
RENAME COLUMN current_column_name TO new_column_name;

--How does the syntax of a TRUNCATE statement look?

TRUNCATE TABLE table_name;

--How does the syntax of a DROP statement look?

DROP TABLE table_name;

--***CREATE***

--You need to create two tables, PETSALE and PET. To create the two tables PETSALE and PET

CREATE TABLE PETSALE (
    ID INTEGER NOT NULL,
    PET CHAR(20),
    SALEPRICE DECIMAL(6,2),
    PROFIT DECIMAL(6,2),
    SALEDATE DATE
    );

CREATE TABLE PET (
    ID INTEGER NOT NULL,
    ANIMAL VARCHAR(20),
    QUANTITY INTEGER
    );


--Now insert some records into the two newly created tables and show all the records of the two tables.

INSERT INTO PETSALE VALUES
    (1,'Cat',450.09,100.47,'2018-05-29'),
    (2,'Dog',666.66,150.76,'2018-06-01'),
    (3,'Parrot',50.00,8.9,'2018-06-04'),
    (4,'Hamster',60.60,12,'2018-06-11'),
    (5,'Goldfish',48.48,3.5,'2018-06-14');

INSERT INTO PET VALUES
    (1,'Cat',3),
    (2,'Dog',4),
    (3,'Hamster',2);

SELECT * FROM PETSALE;
SELECT * FROM PET;

--***ALTER***

--Task A: ALTER using ADD COLUMN
--1. Add a new QUANTITY column to the PETSALE table and show the altered table.

--ALTER TABLE PETSALE
ADD COLUMN QUANTITY INTEGER;

SELECT * FROM PETSALE;

--Task B: ALTER using DROP COLUMN
--2. Delete the PROFIT column from the PETSALE table and show the altered table. 

ALTER TABLE PETSALE
DROP COLUMN PROFIT;

SELECT * FROM PETSALE;

--Task C: ALTER using ALTER COLUMN
--3. Change the data type to VARCHAR(20) type of the column PET of the table PETSALE and show the altered table.

ALTER TABLE PETSALE CHANGE PET  PET VARCHAR(20);
SELECT * FROM PETSALE;

--Task D: ALTER using RENAME COLUMN
--4. Rename the column PET to ANIMAL of the PETSALE table and show the altered table.

ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20);

SELECT * FROM PETSALE;


--***TRUNCATE***

--Remove all rows from the PET table and show the empty table.

TRUNCATE TABLE PET ;

SELECT * FROM PET;


--***DROP***

--Delete the PET table and verify if the table still exists or not (SELECT statement won't work if a table doesn't exist).

DROP TABLE PET;

SELECT * FROM PET;




--***LIKE, AS, IN , BETWEEN, ORDER BY, GROUP BY, HAVING, WHERE***

--1. Retrieve all employees whose address is in Elgin,IL.

--ANS: 
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

--2. Retrieve all employees who were born during the 1970's.

--ANS:
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';

--3. Retrieve all employees in department 5 whose salary is between 60000 and 70000.

--ANS:
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000)
AND DEP_ID = 5;

--4. Retrieve a list of employees ordered by department ID.

--ANS:
SELECT *
FROM EMPLOYEES
ORDER BY DEP_ID;

--5. Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.

--ANS:
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

--6. In SQL problem 2 (Exercise 2 Problem 2), use department name instead of department ID. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.

--ANS:
SELECT D.DEP_NAME , E.F_NAME, E.L_NAME
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

--7. For each department ID retrieve the number of employees in the department.

--ANS: 
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

--8. For each department retrieve the number of employees in the department, and the average employee salary in the department..

--ANS:
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

--9. Label the computed columns in the result set of SQL problem 2 (Exercise 3 Problem 2) as NUMEMPLOYEES and AVGSALARY.

--ANS:
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

--10. In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..

--ANS:
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY;

--11. In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.

--ANS:
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;


--***BUILT IN FUNCTIONS***
--***AGGREGATE FUNCTIONS***

--1.  Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.

--ANS:
SELECT SUM(COST)
FROM PETRESCUE;

--2. Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUMOFCOST.

--ANS:
SELECT SUM(COST) AS SUM_OF_COST
FROM PETRESCUE;

--3. Enter a function that displays the maximum quantity of animals rescued.

--ANS:
SELECT MAX(QUANTITY)
FROM PETRESCUE;

--4. Enter a function that displays the average cost of animals rescued.

--ANS: 
SELECT AVG(COST)
FROM PETRESCUE;

--5. Enter a function that displays the average cost of rescuing a dog.

--ANS:
SELECT AVG(COST/QUANTITY)
FROM PETRESCUE
WHERE ANIMAL = 'Dog';

--6. Enter a function that displays the rounded cost of each rescue.

--ANS: 
SELECT ROUND(COST)
FROM PETRESCUE;

--7. Enter a function that displays the length of each animal name.

--ANS:
SELECT LENGTH(ANIMAL)
FROM PETRESCUE;

--8. Enter a function that displays the animal name in each rescue in uppercase.

--ANS:
SELECT UCASE(ANIMAL)
FROM PETRESCUE;

--9. Enter a function that displays the animal name in each rescue in uppercase without duplications.

--ANS:
SELECT DISTINCT(UCASE(ANIMAL))
FROM PETRESCUE;

--10. Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.

--ANS:
SELECT *
FROM PETRESCUE
WHERE LCASE(ANIMAL) = 'cat';

--11. Enter a function that displays the day of the month when cats have been rescued.

--ANS:
SELECT DAY(RESCUEDATE)
FROM PETRESCUE
WHERE ANIMAL = 'Cat';

--12. Enter a function that displays the number of rescues on the 5th month.

--ANS:
SELECT SUM(QUANTITY)
FROM PETRESCUE
WHERE MONTH(RESCUEDATE) = '05';

--13. Enter a function that displays the number of rescues on the 14th day of the month.

--ANS:
SELECT SUM(QUANTITY)
FROM PETRESCUE
WHERE DAY(RESCUEDATE) = '14';

--14. Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.

--ANS:
SELECT DATE_ADD(RESCUEDATE, INTERVAL 3 DAY)
FROM PETRESCUE;

--15. Enter a function that displays the length of time the animals have been rescued; the difference between todayâ€™s date and the rescue date.

--ANS:
SELECT DATEDIFF(CURRENT_TIME, RESCUEDATE)
FROM PETRESCUE;



--***SUB-QUERIES, NESTED QUERIES***

--1. Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.

--ANS:
select * 
from EMPLOYEES 
where salary < AVG(salary);

--2. Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.

--ANS:
SELECT *
FROM EMPLOYESS
WHERE SALARY < 
(SELECT AVG(SALARY) 
FROM EMPLOYEES);

--3. Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMPID, SALARY and maximum salary as MAXSALARY in every row.

--ANS: 
select EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
from EMPLOYEES;  

--4. Execute a Column Expression that retrieves all employees records with EMPID, SALARY and maximum salary as MAXSALARY in every row.

--ANS:
SELECT EMPID, SALARY,
(SELECT MAX(SALARY) FROM EMPLOYEES) AS MAX_SALARY
FROM EMPLOYEES;

--5. Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).

--ANS:
SELECT * FROM
(SELECT EMP_ID, F_NAME, L_NAME, SALARY FROM EMPLOYEES) AS EMP4ALL;


--***USING MULTIPLE TABLES***

--1. Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

--ANS:
select * 
from EMPLOYEES 
where JOB_ID IN (select JOB_IDENT from JOBS);

--2. Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.

--ANS:
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = 'Jr. Designer')

--3. Retrieve JOB information and list of employees who earn more than $70,000.

--ANS:
SELECT JOB_TITLE 
FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000);

--4. Retrieve JOB information and list of employees whose birth year is after 1976.

--ANS:
SELECT JOB_TITLE
FROM JOBS 
WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976);

--5. Retrieve JOB information and list of female employees whose birth year is after 1976.
--ANS:
SELECT JOB_TITLE
FROM JOBS
WHERE JOB_IDENT IN(SELECT JOB_ID FROM EMPLOYEES WHERE SEX = 'F' AND YEAR(B_DATE) > 1976);

--6. Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.

--ANS:
SELECT * 
FROM EMPLOYEES, JOBS

--7. Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.

--ANS:
SELECT *
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

--8. Redo the previous query, using shorter aliases for table names.

--ANS:
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

--9. Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.

--ANS:
SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

--10. Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.

--ANS:
SELECT E.EMP_ID, E.F_NAME, E.L_NAME, J.JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;


