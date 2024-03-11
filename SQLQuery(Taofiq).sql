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