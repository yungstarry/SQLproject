SELECT * FROM SCHOOL;
SELECT * FROM SUBJECTS;
SELECT * FROM STAFF;
SELECT * FROM STAFF_SALARY;
SELECT * FROM CLASSES;   
SELECT * FROM STUDENTS;
SELECT * FROM PARENTS;
SELECT * FROM STUDENT_CLASSES;
SELECT * FROM STUDENT_PARENT;
SELECT * FROM ADDRESS;


select * from STAFF_SALARY
order by SALARY

select * from STAFF_SALARY
where SALARY between 6500 and 8000
order by SALARY

select * from staff
where AGE > 50 and gender = 'f' or FIRST_NAME = 'violet'

select (5+2) Total

select * from STAFF
select distinct STAFF_TYPE from STAFF
select top 5 Age from staff


select STAFF_ID, SALARY,
case 
  when salary > 10000 then 'High Salary'
  when salary between 5000 and 10000  then'Average Salary'
  when salary <= 4999 then 'Low Income'
  end as Range
from STAFF_SALARY
order by salary desc


select sta.AGE, sta.DOB, sal.SALARY
from STAFF as sta
join STAFF_SALARY as sal
on sta.STAFF_ID = sal.STAFF_ID
order by DOB


select distinct (sta.FIRST_NAME + ' '+ sta.LAST_NAME) as FullName
from SUBJECTS sub
join CLASSES cla
on sub.SUBJECT_ID = cla.SUBJECT_ID
join STAFF sta
on cla.TEACHER_ID = sta.STAFF_ID
where SUBJECT_NAME = 'mathematics' 

select sta.STAFF_TYPE, (sta.FIRST_NAME + ' '+ sta.LAST_NAME) as FullName, sta.AGE,(case
when sta.GENDER = 'M' then 'Male'
when sta.GENDER = 'F' then 'Female'
end
) as Gender, sta.JOIN_DATE
from staff sta
join CLASSES cls
on sta.STAFF_ID = cls.TEACHER_ID and sta.STAFF_ID = sta.STAFF_ID
where CLASS_NAME in ('grade 8','grade 9','grade 10')

union all 
select sta.STAFF_TYPE, (sta.FIRST_NAME + ' '+ sta.LAST_NAME) as FullName, sta.AGE,(case
when sta.GENDER = 'M' then 'Male'
when sta.GENDER = 'F' then 'Female'
end
) as Gender, sta.JOIN_DATE
from STAFF sta
where STAFF_TYPE = 'Non-Teaching'


select * 
from STUDENT_CLASSES

--kkkkkkkkkkkkkk
select sc.CLASS_ID, COUNT(1) as 'no_of_students'
from STUDENT_CLASSES sc
group by sc.CLASS_ID
having COUNT(1) > 100
order by sc.CLASS_ID

select sp.PARENT_ID, COUNT(1) as 'no of kids'
from STUDENT_PARENT as sp
group by sp.PARENT_ID
having COUNT(1) > 1
order by sp.PARENT_ID


select (p.FIRST_NAME + ' ' + p.LAST_NAME) as Parent_name, 
(s.FIRST_NAME + ' ' + s.LAST_NAME) as Student_Name,
(a.CITY + ' ' + a.COUNTRY) as Address_Details
from PARENTS as p
join STUDENT_PARENT sp on p.id = sp.PARENT_ID
join STUDENTS s on s.ID =sp.STUDENT_ID
join ADDRESS A on p.ADDRESS_ID = a.ADDRESS_ID
where p.ID in 
(
				select  sp.PARENT_ID
				from STUDENT_PARENT as sp
				group by sp.PARENT_ID
				having COUNT(1) > 1
)
order by 1

select ss.salary, sum(ss.Salary) as AvgSalary
from STAFF_SALARY as ss
join STAFF as s on s.STAFF_ID = ss.STAFF_ID
where s.STAFF_TYPE = 'Non-Teaching'
group by ss.SALARY

 select s.STAFF_TYPE, sum(ss.salary) as avg_salary
 from STAFF_SALARY as ss
 join STAFF as s on s.STAFF_ID = ss.STAFF_ID
group by s.STAFF_TYPE

 select s.STAFF_TYPE, min(ss.salary) as avg_salary
 from STAFF_SALARY as ss
 join STAFF as s on s.STAFF_ID = ss.STAFF_ID
group by s.STAFF_TYPE

 select s.STAFF_TYPE, max(ss.salary) as avg_salary
 from STAFF_SALARY as ss
 join STAFF as s on s.STAFF_ID = ss.STAFF_ID
group by s.STAFF_TYPE


select *
from STAFF s
right outer join STAFF_SALARY ss on s.STAFF_ID = ss.STAFF_ID
order by (1)

drop table manager

create Table employee (
emp_id varchar(20),
emp_name varchar(50),
salary int,
dept_id varchar(20),
manager_id varchar(20)
)

insert into employee values
('E1', 'Rahul', 15000, 'D1', 'M1'),
('E2', 'Manoj', 15000, 'D1', 'M1'),
('E3', 'James', 55000, 'D2', 'M2'),
('E4', 'Micheal', 25000, 'D1', 'M2'),
('E5', 'Ali', 20000, 'D10', 'M3'),
('E6', 'Robin', 35000, 'D10', 'M3')

create table department (
dept_id varchar(20),
dept_name varchar(50),
)

insert into department values 
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin')

create Table manager (
manager_id varchar(20),
manager_name varchar(50),
dept_id varchar(20),
)

insert into manager values
('M1', 'Prem', 'D3'),
('M2', 'Shripadh', 'D4'),
('M3', 'Nick', 'D1'),
('M4', 'Cory', 'D1')

create Table project (
project_id varchar(20),
project_name varchar(100),
team_member_id varchar(20),
)



insert into project values
('P1', 'Data Migration', 'E1'),
('P1', 'Data Migration', 'E2'),
('P1', 'Data Migration', 'M3'),
('P2', 'ETL Tool', 'E1'),
('P2', 'ETL Tool', 'M4')

--drop table company
create Table company (
company_id varchar(20),
company_name varchar(100),
location varchar(200),
)

insert into company values
('C001', 'Adordev Solutions', 'London United Kingdom')


select * from employee
select * from department
select * from manager
select * from project

select e.emp_name, d.dept_name
from employee as E
join department as D on e.dept_id = d.dept_id

select e.emp_name, d.dept_name
from employee as E
right join department as D on e.dept_id = d.dept_id

select e.emp_name, d.dept_name
from employee as E
full join department as D on e.dept_id = d.dept_id

select e.emp_name, d.dept_name
from employee as E
full join department as D on d.dept_id = e.dept_id

select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee as E
left  join department as D on e.dept_id = d.dept_id
inner join manager as M on m.manager_id = e.manager_id
left join project as P on p.team_member_id = e.emp_id


--cross join
--cross join also known as cartesian join that returns cartesian products

select e.emp_name, d.dept_name
from employee e
cross join department d



select e.emp_name, e.salary, c.company_name, c.location
from employee e
cross join company c


--use inner join  instead of Natural JOin

--self join
--self join is when u join a table to it self

create table family (
member_id varchar(10),
name varchar(50),
age int,
parent_id varchar(10)
)

insert into family values
('F1', 'David', 4, 'F5'),
('F2', 'Carol', 10, 'F5'),
('F3', 'Micheal', 12, 'F5'),
('F4', 'Johnson', 36, '' ),
('F5', 'Maryam', 40, 'F6'),
('F6', 'Stewart', 70, ''),
('F7', 'Rohan', 6, 'F4'),
('F8', 'Asha', 8, 'F4')

select * from family


select child.name as child_name, child.age as child_age, parent.name as parent_name, parent.age as parent_age
from family as child
join family as parent on child.parent_id = parent.member_id

DROP TABLE employee_history;
DROP TABLE employee;
drop table department;
DROP table sales ;

create table department
(
	dept_id		int ,
	dept_name	varchar(50) PRIMARY KEY,
	location	varchar(100)
);
insert into department values (1, 'Admin', 'Bangalore');
insert into department values (2, 'HR', 'Bangalore');
insert into department values (3, 'IT', 'Bangalore');
insert into department values (4, 'Finance', 'Mumbai');
insert into department values (5, 'Marketing', 'Bangalore');
insert into department values (6, 'Sales', 'Mumbai');

CREATE TABLE EMPLOYEE
(
    EMP_ID      INT PRIMARY KEY,
    EMP_NAME    VARCHAR(50) NOT NULL,
    DEPT_NAME   VARCHAR(50) NOT NULL,
    SALARY      INT,
    constraint fk_emp foreign key(dept_name) references department(dept_name)
);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);


CREATE TABLE employee_history
(
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50) NOT NULL,
    dept_name   VARCHAR(50),
    salary      INT,
    location    VARCHAR(100),
    constraint fk_emp_hist_01 foreign key(dept_name) references department(dept_name),
    constraint fk_emp_hist_02 foreign key(emp_id) references employee(emp_id)
);

create table sales
(
	store_id  		int,
	store_name  	varchar(50),
	product_name	varchar(50),
	quantity		int,
	price	     	int
);
insert into sales values
(1, 'Apple Store 1','iPhone 13 Pro', 1, 1000),
(1, 'Apple Store 1','MacBook pro 14', 3, 6000),
(1, 'Apple Store 1','AirPods Pro', 2, 500),
(2, 'Apple Store 2','iPhone 13 Pro', 2, 2000),
(3, 'Apple Store 3','iPhone 12 Pro', 1, 750),
(3, 'Apple Store 3','MacBook pro 14', 1, 2000),
(3, 'Apple Store 3','MacBook Air', 4, 4400),
(3, 'Apple Store 3','iPhone 13', 2, 1800),
(3, 'Apple Store 3','AirPods Pro', 3, 750),
(4, 'Apple Store 4','iPhone 12 Pro', 2, 1500),
(4, 'Apple Store 4','MacBook pro 16', 1, 3500);

select * from employee;
select * from department;
select * from employee_history;
select * from sales;

/* Question find the employees who's salary is more than average salary by all employee

*/

select *
from EMPLOYEE e
where e.SALARY >(select Avg(salary) as avg_sal 
from EMPLOYEE )

--types of subqueries
--scalar subquery -- will always return one column and one row


select *
from EMPLOYEE e
join (select Avg(salary) as sal
from EMPLOYEE) avg_sal 
on e.SALARY > avg_sal.sal


--mulltiple row subquery -- returns multiple column and multiple row or one column multiple row

-- Question: Find the employee who earn higest salary in each department

select e.DEPT_NAME, MAX(e.salary) as Max_Salary
from EMPLOYEE e
group by e.dept_name

select * 
from EMPLOYEE e
where Exists (
select e2.DEPT_NAME, MAX(e2.salary) as Max_Salary
from EMPLOYEE e2
where e.DEPT_NAME = e2.DEPT_NAME
group by e2.dept_name
having MAX(e2.SALARY) = e.SALARY
)


SELECT E1.*
FROM EMPLOYEE E1
WHERE EXISTS (
    SELECT 1
    FROM EMPLOYEE E2
    WHERE E1.DEPT_NAME = E2.DEPT_NAME
    GROUP BY DEPT_NAME
    HAVING MAX(E2.SALARY) = E1.SALARY
);


SELECT *
FROM Employee e
WHERE EXISTS (
    SELECT 1
    FROM Employee e2
    WHERE e2.EMP_ID = e.EMP_ID
    AND e2.Salary > (SELECT AVG(Salary) FROM Employee WHERE DEPT_NAME = e.DEPT_NAME)
);


SELECT e.DEPT_NAME, e.EMP_NAME
FROM Employee e
WHERE DEPT_NAME = (SELECT DEPT_NAME FROM Department WHERE DEPT_NAME = 'IT');

SELECT *
FROM department d
WHERE dept_id IN (SELECT dept_id FROM Employee WHERE Salary > 2000);


--single column and multiple row subquery
--Question: Find department who do not have any employees
select  avg(salary) as avgd
from EMPLOYEE


select * from department


select d.dept_name
from department d

--deptname != emp_name
select d.dept_name
from department d
where d.dept_name not in (select distinct dept_name from EMPLOYEE
)

--correlated subquery
-- a subquery which is depend on the outer query
--find the employees in each department who earn more than average salary in that department

select distinct e1.emp_name, e1.DEPT_NAME, e1.SALARY
from EMPLOYEE e1
where e1.SALARY > (
select  avg(e2.salary)
from EMPLOYEE e2
where e2.DEPT_NAME = e1.DEPT_NAME
)

--multiple nested subquery
--find stores who's sales were better than the average sales accross all stores

select * from sales

select *
from (select store_name, sum(price) as total_sales
from sales
group by store_name) sales

join (select avg(total_sales)as sales
from(select store_name, sum(price) as total_sales
from sales
group by store_name) x) as avg_sales

on sales.total_sales > avg_sales.sales


WITH sales as (
			select store_name, sum(price) as total_sales		
			from sales 
			group by store_name)
select *
from sales
join (select avg(total_sales)as sales
			from sales x) as avg_sales
			on sales.total_sales > avg_sales.sales






SELECT store_name, total_sales,avg_sales
FROM (
    SELECT store_name, SUM(price) AS total_sales,
           AVG(SUM(price)) OVER () AS avg_sales
    FROM sales
    GROUP BY store_name
) AS subquery
WHERE total_sales > avg_sales;



