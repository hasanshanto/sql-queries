-- BASIC QUERIES --

-- Fetch all columns and all records (rows) from table.
select *
from students;
 
-- Fetch only ID and FIRST_NAME columns from students table
select id, first_name
from students;

-- COMPARISON OPERATORS --

-- Fetch all records where subject name is Mathematics.
select *
from subjects
where subject_name = 'Mathematics';

-- Fetch all records where subject name is not Mathematics.
select *
from subjects
where subject_name != 'Mathematics';
-- where subject_name <> 'Mathematics';

-- Fetch all records where salary is greater than 10000.
select *
from staff_salary
where salary > 10000;

-- Fetch all records where salary is less than 10000.
select *
from staff_salary
where salary < 10000;

-- Fetch all records where salary is less than 10000 and the output is sorted in ascending order of salary.
select *
from staff_salary
where salary < 10000
order by salary asc;

-- Fetch all records where salary is less than 10000 and the output is sorted in descending order of salary.
select *
from staff_salary
where salary < 10000
order by salary desc;

-- Fecth all records where salary is greater than or equal to 10000.
select *
from staff_salary
where salary >= 10000;

-- Fecth all records where salary is less than or equal to 10000.
select *
from staff_salary
where salary <= 10000;


-- LOGICAL OPERATORS --

-- Fetch all records where salary is between 5000 and 10000.
select *
from staff_salary
where salary between 5000 and 10000;

-- Fetch all records where subjects is either Mathematics, Science or Arts.
select *
from subjects
where subject_name in ('Mathematics', 'Science', 'Arts');

-- Fectch all records where subjects is not Mathematics, Science or Arts.
select *
from subjects
where subject_name not in ('Mathematics', 'Science', 'Arts');

-- Fetch all records where subject name has Computer as prefixed.
select *
from subjects
where subject_name like 'Computer%';

-- Fetch all records where subject name does not have Computer as prefixed.
select *
from subjects
where subject_name not like 'Computer%';

-- Fetch all records where staff is female and is over 50 years of age.
select *
from staff
where gender = 'F' and age > 50;

-- Fetch all records where first name of staff starts with "A" AND last name starts with "S".
select *
from staff
where first_name like 'A%' and last_name like 'S%';

-- Fetch all records where first name of staff starts with "A" OR last name starts with "S".
select *
from staff
where first_name like 'A%' or last_name like 'S%';

-- Fetch all records where staff is over 50 years of age AND has his first name starting with "A" OR his last name starting with "S".
select *
from staff
where (first_name like 'A%' or last_name like 'S%') and age > 50;

-- 

SELECT (5+2) AS ADDITION;
SELECT (5-2) AS SUBTRACT; 
SELECT (5*2) AS MULTIPLY;
SELECT (5/2) AS DIVIDE;
SELECT (5%2) AS MODULUS;
SELECT STAFF_TYPE FROM STAFF;
SELECT DISTINCT STAFF_TYPE FROM STAFF;
SELECT STAFF_TYPE FROM STAFF LIMIT 5;

-- CASE statement -- 

select staff_id, salary,
case 
when salary > 10000 then 'High Salary'
when salary between 5000 and 10000 then 'Standard Salary'
when salary < 5000 then 'Lower Salary'
end salary_range
from staff_salary
order by salary;

-- TO_CHAR / TO_DATE -- 

select *
from students
where to_char(dob, 'YYYY') = '2010';

-- JOIN --

-- Fetch all the class name where Music is taught as a subject.
select cls.class_name, sub.subject_id, sub.subject_name
from classes cls
join subjects sub
on cls.subject_id = sub.subject_id
where sub.subject_name = 'Music';

-- Fetch the full name of all staff who teach Mathematics.
select distinct (stf.first_name || ' ' || stf.last_name) as full_name--, cls.class_name 
from staff stf
join classes cls
on stf.staff_id = cls.teacher_id
join subjects sub
on cls.subject_id = sub.subject_id
where sub.subject_name = 'Mathematics';

-- Fetch all staff who teach grade 8, 9, 10 and also fetch all the non-teaching staff
select stf.*
from staff stf
join classes cls
on cls.teacher_id = stf.staff_id
where cls.class_name in ('Grade 8', 'Grade 9', 'Grade 10')
union
select *
from staff
where staff_type = 'Non-Teaching';

-- Count no of students in each class
select class_id, count(1) as num_of_students
from student_classes
group by class_id
order by class_id;

-- Return only the records where there are more than 100 students in each class
select class_id, count(1) as num_of_students
from student_classes
group by class_id
having count(1) > 100
order by class_id;

-- Parents with more than 1 kid in school.
select parent_id, count(student_id)
from student_parent
group by parent_id
having count(student_id) > 1
order by parent_id;

--SUBQUERY: Query written inside a query is called subquery. -- 

-- Fetch all the details of parents having more than 1 kids going to this school. Also display student details.

select (st.first_name || ' ' || st.last_name) as student_name,
st.gender, st.age,
(parents.first_name || ' ' || parents.last_name) as parent_name,
(ad.street || ', ' || ad.city || ', ' || ad.state) as full_address
from parents 
join student_parent as sp
on parents.id = sp.parent_id
join students st
on st.id = sp.student_id
join address ad
on ad.address_id = parents.address_id
where parents.id in 
		(select parent_id
		from student_parent
		group by parent_id
		having count(student_id) > 1);

-- Staff details who’s salary is less than 5000
select stf.*, stf_sal.salary
from staff stf
join staff_salary stf_sal
on stf.staff_id = stf_sal.staff_id
where stf_sal.salary < 5000;

select first_name, last_name, age, gender
from staff 
where staff_id in 
		(select staff_id
		from staff_salary
		where salary < 5000);













