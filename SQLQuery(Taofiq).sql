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


--different sql clause where subquery is allowed

--SELECT --FROM --WHERE --HAVING

--USING a subquery in SELECT CLAUSE (NOT RECOMMENDED)

--QUESTION: Fetch all employee details and add remarks to those employess who earn more than the average pay

select *
, (case when salary > (select avg(salary) from employee) 
	then 'Higher than average' 
	else null 
	end) as remarks
from employee

--subqueries with HAVING 
-- question : find the stores who have sold more units than the average units sold by stores


select store_name, sum(quantity) as tia
from sales
group by store_name
having (sum(quantity)) > (select avg(quantity) from sales)


--subqueries can also be used in statement
--INSERT
--UPDATE
--DELETE
--QUESTION: Insert data to employee history table. Make sure not to insert duplicate records

select * from employee_history

insert into employee_history (emp_id, emp_name, salary, dept_name, location)
select e.EMP_ID, e.EMP_NAME, e.SALARY, d.dept_name, d.location
from employee e
join department d on d.dept_name = e.DEPT_NAME
where not exists(select 1
					from employee_history eh
					where eh.emp_id = e.EMP_ID
											)


--UPdate
--Question: Give 10% increment to all emplotess in Bangalore location based on the maximum salary earned by an emp in each dept. Only consider employees in employee_history table

update e
set e.salary =(select max(eh.salary) + max(eh.salary) * 0.1
				from employee_history eh
				where eh.dept_name = e.dept_name)
from EMPLOYEE e
where e.dept_name  in (select dept_name
						from department
						where location ='Bangalore')

and e.emp_id in (select emp_id from employee_history)


--DELETE
--qUESTION: Delete all departments who do not have any employee

delete from department
WHERE  dept_name in (
					select dept_name
					from department d
					where not exists (select 1
									  from employee e 
									  where e.dept_name = d.dept_name))



select * from EMPLOYEE

--CTE means Common Table Expression or Sub-Query Factoring

--fetch employees who earn more than average salary of al employees
with avg_salary (avg_sal) as (select avg(salary) 
							  from EMPLOYEE)
select *
from EMPLOYEE e, avg_salary av
where e.SALARY > av.avg_sal


select * from sales

--find stores who's sales where better than the avg sales accross all stores

select * from sales


with avg_sales (avg_salesUnit) as (select avg(price*quantity)
from sales)

select *
from sales s, avg_sales avs
where (s.price * s.quantity) > avs.avg_salesUnit

--anotherway
with Total_sales(store_id, total_sales_per_store) as  
						(select s.store_id, sum(price) as total_sales_per_store
											from sales s
											group by s.store_id),
		avg_sales (avg_sales_for_all_store) as 
		(select avg(total_sales_per_store) as  avg_sales_for_all_store
		 from Total_sales	)
select *
from Total_sales ts
join avg_sales av
on ts.total_sales_per_store > av.avg_sales_for_all_store


-- another way

select store_id, sum(price) as Total_sales
from sales
group by store_id


select avg(total_sales_per_store) as avg_sales_for_all_store
from (select s.store_id, sum(price) as total_sales_per_store
	  from sales s
	  group by s.store_id) x

select *
from (select s.store_id, sum(price) as total_sales_per_store
from sales s
group by store_id) as total_sales
join (select avg(total_sales_per_store) as avg_sales_for_all_store
		from (select s.store_id, sum(price) as total_sales_per_store
				from sales s
				 group by s.store_id) x) avg_sales
	on total_sales.total_sales_per_store > avg_sales.avg_sales_for_all_store

--Window Function
--window function includes rank, Dense_rank, row_number, lead, lag

select *
from EMPLOYEE

select max(salary ) from EMPLOYEE

select e.*,
max(salary) over(partition by dept_name) as max_salary
from EMPLOYEE e

--row_number, rank, dense_rank, lead and lag
 select e.*,
 row_number() over(partition by dept_name ORDER BY e.EMP_ID) as rn
 from EMPLOYEE e


 select * from (
  SELECT e.*, ROW_NUMBER() OVER (partition by dept_name ORDER BY e.EMP_ID) AS rn
FROM EMPLOYEE e
 ) x
 where x.rn < 3

 --rank
 --fetch the top 3 employees in each department earning the max salary

 select * from (
 select e.*,
 rank() over(partition by dept_name order by salary desc ) as rnk
 from EMPLOYEE e) x
 where x.rnk < 4
 

 --denserank

 select e.*,
 rank() over(partition by dept_name order by salary desc ) as rnk,
 dense_rank() over(partition by dept_name order by salary desc ) as DENSE_rnk,
 row_number() over(partition by dept_name order by salary desc ) as rnk

 from EMPLOYEE e

 --lag and lead
 -- fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee

 select e.*,
 lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary
 from EMPLOYEE e


 select e.*,
 lag(salary, 2, 0) over(partition by dept_name order by emp_id) as prev_emp_salary
 from EMPLOYEE e


 select e.*,
 lead(salary) over(partition by dept_name order by emp_id) as next_emp_salary
 from EMPLOYEE e


 select e.*,
 lag(salary) over(partition by dept_name order by emp_id) as prev_emp_salary,
 case when e.salary > lag(salary) over (partition by dept_name order by emp_id)  then 'Higher than Previous employee'
		when e.salary < lag(salary) over (partition by dept_name order by emp_id)  then 'Lower than Previous employee'
		when e.salary = lag(salary) over (partition by dept_name order by emp_id)  then 'same as the Previous employee'
		end sal_range
 from EMPLOYEE e


 --first value, last value, 


 create table product (
 product_category varchar(255),
 brand varchar(255),
 product_name varchar(255),
 price int
 )

 insert into product values
 ('Phone', 'Apple', 'iPhone 12 Pro Max' ,1300),
 ('Phone', 'Apple', 'iPhone 12 Pro ' ,1100),
 ('Phone', 'Apple', 'iPhone 12  ' ,1000),
 ('Phone', 'Samsung', 'Galaxy Z Fold 3' ,1800),
 ('Phone', 'Samsung', 'Galaxy Z Flip 3' ,1000),
 ('Phone', 'Samsung', 'Galaxy Note 20' ,1200),
 ('Phone', 'Samsung', 'Galaxy S21' ,1000),
 ('Phone', 'OnePlus', 'OnePlus Nord' ,300),
 ('Phone', 'OnePlus', 'OnePlus 9' ,800),
 ('Phone', 'Google', 'Pixel 5' ,600),
 ('Laptop', 'Apple', 'MacBook Pro 13' ,2000),
 ('Laptop', 'Apple', 'MacBook Air' ,1200),
 ('Laptop', 'Micrsoft', 'Surface Laptop 4' ,2100),
 ('Laptop', 'Dell', 'XPS 13' ,2000),
 ('Laptop', 'Dell', 'XPS 15' ,2300),
 ('Laptop', 'Dell', 'XPS 17' ,2500),
 ('Earphone', 'Apple', 'AirPods Pro' ,280),
 ('Earphone', 'Samsung', 'Galaxy Buds Pro' ,220 ),
 ('Earphone', 'SamSung', 'Galaxy Buds Live' ,170),
 ('Earphone', 'Sony', 'WF-1000XM4' ,250),
 ('Headphone', 'Sony', 'WF-1000XM4' ,400),
 ('Headphone', 'Apple', 'AirPods Max', 550),
 ('Headphone', 'Microsoft', 'Surface Headphones 2' ,250),
 ('Smartwatch', 'Apple', 'Apple Watch series 6' ,1000),
 ('Smartwatch', 'Apple', 'Apple Watch SE' ,400),
  ('Smartwatch', 'Samsung', 'Galaxy Watch 4',600),
 ('Smartwatch', 'OnePlus', 'OnePlus Watch ', 200)



 --first_value
 --write query to display the most expensive product under each category (corresponfing to each record)


 select * ,
 first_value(product_name) over(partition by product_category order by price desc) as Most_exp_product
 from product

  --last_value
 --write query to display the least expensive product under each category (corresponfing to each record)


 --frame clause -- frame is a subset of partition

 select * ,
 first_value(product_name) over(partition by product_category order by price desc) as Most_exp_product,
 last_value(product_name) over(partition by product_category order by price desc range between unbounded preceding and unbounded following) as least_exp_product
 from product

 --today
 --alternate why of write queries

 
 select * ,
	 first_value(product_name) over w as Most_exp_product,
	 last_value(product_name) over w as least_exp_product
 from product
	where product_category='Phone'
window w as(partition by product_category order by price desc range between unbounded preceding and unbounded following)

--nth_value
--write query to display the second most expensive product under each category

 select * ,
	 first_value(product_name) over w as Most_exp_product,
	 last_value(product_name) over w as least_exp_product
	-- nth_value(product_name, 2) over w as second_most_exp_product
 from product
	where product_category='Phone'
window w as(partition by product_category order by price desc range between unbounded preceding and unbounded following)


--NTILE
--Write a query to segregate all the expensive phones, mid range phones and the cheaper phones

select product_name, 
case 
	when x.buckets = 1 then 'Expensive Phones'
	when x.buckets = 2 then 'Mid Range Phones'
	when x.buckets = 3 then 'Cheapere Phones'
END phone_category
from(
	select *,
	ntile(3) over(order by price desc) as buckets
	from product
	where product_category ='phone') x

--Cume_Dist(cumulatiove distribution);
--Value --> <= CUME_Dsist > 0 
--Formula - Current Row no (or Row No with value same as current row) /Total no of rows 

--Query to fetch all products with are constituting the first 30%
--of the data in products table based on price


select product_name, (cume_dis_percentage) as cume_dis_percentage
from 
		(select * ,
		cume_dist() over (order by price desc )as cume_distribution,
		round(cume_dist() over (order by price desc )  * 100, 2) as cume_dis_percentage
		from product) x

where x.cume_dis_percentage <= 30;


--Percent_rank(relative rank of the cuttent row/ percentage ranking)
--vale ---> 1 <= PERCENT_RANK > 0
--formuar = current row no -1 total no of rows -1


--Query to identify how much percentage more expensive is "Galaxy z Fold 3" whne compare to all products


select *,
percent_rank() over(order by price) as percentage_rank,
round(percent_rank() over(order by price) * 100, 2 )as percentage_rank
from product


--VIEW
--View is a  database object which is created over an SQL Query
--View return data that is return by an sql query, view does not store any data, view is like a virtual data

drop table if exists tb_customer_data ;
drop table if exists tb_product_info ;
drop table if exists tb_order_details ;
drop view if exists order_summary;


if not exists ( SELECT * FROM sys.tables WHERE name = 'tb_product_info')
if not exists ( SELECT * FROM sys.tables WHERE name = 'tb_product_info')
if not exists ( SELECT * FROM sys.tables WHERE name = 'tb_order_details')
if not exists ( SELECT * FROM sys.tables WHERE name = 'order_summary')

create table  tb_customer_data
(
    cust_id         varchar(10) primary key,
    cust_name       varchar(50) not null,
    phone           bigint,
    email           varchar(50),
    address         varchar(250)
);

create table tb_product_info
(
    prod_id         varchar(10) primary key,
    prod_name       varchar(50) not null,
    brand           varchar(50) not null,
    price           int
);

create table  tb_order_details
(
    ord_id          bigint primary key,
    prod_id         varchar(10) references tb_product_info(prod_id),
    quantity        int,
    cust_id         varchar(10) references tb_customer_data(cust_id),
    disc_percent    int,
    date            date
);

insert into tb_customer_data values
('C1', 'Mohan Kumar', 9900807090, 'mohan@demo.com', 'Bangalore'),
('C2', 'James Xavier', 8800905544, 'james@demo.com', 'Mumbai'),
('C3', 'Priyanka Verma', 9900223333, 'priyanka@demo.com', 'Chennai'),
('C4', 'Eshal Maryam', 9900822111, 'eshal@demo.com', 'Delhi');

insert into tb_product_info values
('P1', 'Samsung S22', 'Samsung', 800),
('P2', 'Google Pixel 6 Pro', 'Google', 900),
('P3', 'Sony Bravia TV', 'Sony', 600),
('P4', 'Dell XPS 17', 'Dell', 2000),
('P5', 'iPhone 13', 'Apple', 800),
('P6', 'Macbook Pro 16', 'Apple', 5000);

insert into tb_order_details values
(1, 'P1', 2, 'C1', 10, '01-01-2020'),
(2, 'P2', 1, 'C2', 0, '01-01-2020'),
(3, 'P2', 3, 'C3', 20, '02-01-2020'),
(4, 'P3', 1, 'C1', 0, '02-01-2020'),
(5, 'P3', 1, 'C1', 0, '03-01-2020'),
(6, 'P3', 4, 'C1', 25, '04-01-2020'),
(7, 'P3', 1, 'C1', 0, '05-01-2020'),
(8, 'P5', 1, 'C2', 0, '02-01-2020'),
(9, 'P5', 1, 'C3', 0, '03-01-2020'),
(10, 'P6', 1, 'C2', 0, '05-01-2020'),
(11, 'P6', 1, 'C3', 0, '06-01-2020'),
(12, 'P6', 5, 'C1', 30, '07-01-2020');


select * from tb_customer_data;
select * from tb_product_info;
select * from tb_order_details;

--fetch the order summary(to be given to client/vendor)
IF OBJECT_ID('order_summary', 'V') IS NOT NULL
    DROP VIEW order_summary;
GO
create view order_summary
as
select o.ord_id, o.date, p.prod_name, c.cust_name, (p.price * o.quantity) - ((p.price * o.quantity) * disc_percent /100) as cost
from tb_customer_data c
join tb_order_details o on o.cust_id = c.cust_id
join tb_product_info p on p.prod_id = o.prod_id

select * from order_summary

--what is the main purpose of using a view/advantages of views
--security
--to simplify complex sql queries

--updatable views is not advisable
--rules of updatable table
--1 View query formed using just 1 table/view
--2 cannot have distinct clase
--3 view query cannot have groupby clause
-- view query cannot have with clause or window functions



create view expensive_products
as
select * from tb_product_info where price > 1000
select * from expensive_products

update expensive_products
set prod_name = 'Airpods pro' , brand= 'Apple'
where prod_id = 'p4'

drop view apple_products

---With Check Option
create view apple_products
as
select * from tb_product_info where brand = 'Apple'
with check option

select * from apple_products
select * from tb_product_info
insert into apple_products values
('P22', 'Note 20', 'Apple', 2500);



--Resursive SQl queries

WITH  CTE_name AS
	(
     SELECT query (Non Recursive query or the Base query)
	    UNION ALL
	 SELECT query (Recursive query using CTE_name [with a termination condition])
	)
SELECT * FROM CTE_name;


DROP TABLE emp_details;
CREATE TABLE emp_details
    (
        id           int PRIMARY KEY,
        name         varchar(100),
        manager_id   int,
        salary       int,
        designation  varchar(100)

    );

INSERT INTO emp_details VALUES (1,  'Shripadh', NULL, 10000, 'CEO');
INSERT INTO emp_details VALUES (2,  'Satya', 5, 1400, 'Software Engineer');
INSERT INTO emp_details VALUES (3,  'Jia', 5, 500, 'Data Analyst');
INSERT INTO emp_details VALUES (4,  'David', 5, 1800, 'Data Scientist');
INSERT INTO emp_details VALUES (5,  'Michael', 7, 3000, 'Manager');
INSERT INTO emp_details VALUES (6,  'Arvind', 7, 2400, 'Architect');
INSERT INTO emp_details VALUES (7,  'Asha', 1, 4200, 'CTO');
INSERT INTO emp_details VALUES (8,  'Maryam', 1, 3500, 'Manager');
INSERT INTO emp_details VALUES (9,  'Reshma', 8, 2000, 'Business Analyst');
INSERT INTO emp_details VALUES (10, 'Akshay', 8, 2500, 'Java Developer');




-- Q1: Display number from 1 to 10 without using any in built functions.


with numbers as
	(select 1 as n
	union all
	select n + 1
	from numbers where n < 10)
select * from numbers

-- Q2: Find the hierarchy of employees under a given manager "Asha".
select * from emp_details

with  emp_hierarchy as
	(select id, name, manager_id, designation, 1 as lvl
	from emp_details where name='Asha'
	union all
	select E.id, E.name, E.manager_id, E.designation, H.lvl+ 1 as lvl
	from emp_hierarchy H
	join emp_details E on H.id = E.manager_id
	)
select H2.id as emp_id, h2.name as emp_name, e2.name as manager_name, h2.lvl as level
from emp_hierarchy H2
join emp_details E2 on E2.id = H2.manager_id


-- Q3: Find the hierarchy of managers for a given employee "David".

with  emp_hierarchy as
	(select id, name, manager_id, designation, 1 as lvl
	from emp_details where name='David'
	union all
	select E.id, E.name, E.manager_id, E.designation, H.lvl+ 1 as lvl
	from emp_hierarchy H
	join emp_details E on H.manager_id = E.id
	)
select H2.id as emp_id, h2.name as emp_name, e2.name as manager_name, h2.lvl as level
from emp_hierarchy H2
join emp_details E2 on E2.id = H2.manager_id



-- Microsoft SQL Server
drop table sales_data;
create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );
insert into sales_data values (convert(datetime, '01-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '02-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '03-Jan-2021',105), 'Cust-1', '50$');
insert into sales_data values (convert(datetime, '01-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '02-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '03-Jan-2021',105), 'Cust-2', '100$');
insert into sales_data values (convert(datetime, '01-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '02-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '03-Feb-2021',105), 'Cust-2', '-100$');
insert into sales_data values (convert(datetime, '01-Mar-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Apr-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-May-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Jun-2021',105), 'Cust-3', '1$');
insert into sales_data values (convert(datetime, '01-Jul-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Aug-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Sep-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Oct-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Nov-2021',105), 'Cust-3', '-1$');
insert into sales_data values (convert(datetime, '01-Dec-2021',105), 'Cust-3', '-1$');

select * from sales_data;








-- SOLUTIONS:
/*
Different parts of the query:
1) Aggregate the sales amount for each customer per month:
    - Build the base SQL query:
        - Remove $ symbol
        - Transform sales_date to fetch only the month and year.
2) Aggregate the sales amount per month irrespective of the customer.
3) Aggregate the sales amount per each customer irrespective of the month.
4) Transform final output:
    - Replace negative sign with parenthesis.
    - Suffix amount with $ symbol.

	*/




-- SQL Server
select * from sales_data

SELECT customer_id as customer, 
FORMAT(sales_date, 'MMM-yy') as sales_date, 
replace(amount, '$', '') AS amount
from sales_data;

WITH pivot_data
as
		(select * 
from
	(
	SELECT customer_id as customer, 
	FORMAT(sales_date, 'MMM-yy') as sales_date, 
	cast(replace(amount, '$', '') as int) AS amount
	from sales_data
	) as sales_data
pivot(
	sum(amount)
	for sales_date in ([Jan-21], [Feb-21], [Mar-21], [Apr-21]
                       ,[May-21], [Jun-21], [Jul-21], [Aug-21]
                       ,[Sep-21], [Oct-21], [Nov-21], [Dec-21])
	) as pivot_table

union
select * 
from
	(
	SELECT 'Total' as customer, 
	FORMAT(sales_date, 'MMM-yy') as sales_date, 
	cast(replace(amount, '$', '') as int) AS amount
	from sales_data
	) as sales_data
pivot(
	sum(amount)
	for sales_date in ([Jan-21], [Feb-21], [Mar-21], [Apr-21]
                       ,[May-21], [Jun-21], [Jul-21], [Aug-21]
                       ,[Sep-21], [Oct-21], [Nov-21], [Dec-21])
	) as pivot_table),
		final_data As
		(select customer
		, coalesce([Jan-21], 0) as Jan_21
        , coalesce([Feb-21], 0) as Feb_21
        , coalesce([Mar-21], 0) as Mar_21
        , coalesce([Apr-21], 0) as Apr_21
        , coalesce([May-21], 0) as May_21
        , coalesce([Jun-21], 0) as Jun_21
        , coalesce([Jul-21], 0) as Jul_21
        , coalesce([Aug-21], 0) as Aug_21
        , coalesce([Sep-21], 0) as Sep_21
        , coalesce([Oct-21], 0) as Oct_21
        , coalesce([Nov-21], 0) as Nov_21
        , coalesce([Dec-21], 0) as Dec_21
		from pivot_data)
select customer
, case when Jan_21 < 0 then concat('(', Jan_21 * -1, ')$') else concat(Jan_21, '$') end as [Jan-21]
, case when Feb_21 < 0 then concat('(', Feb_21 * -1, ')$') else concat(Feb_21, '$') end as [Feb-21]
, case when Mar_21 < 0 then concat('(', Mar_21 * -1, ')$') else concat(Mar_21, '$') end as [Mar-21]
, case when Apr_21 < 0 then concat('(', Apr_21 * -1, ')$') else concat(Apr_21, '$') end as [Apr-21]
, case when May_21 < 0 then concat('(', May_21 * -1, ')$') else concat(May_21, '$') end as [May-21]
, case when Jun_21 < 0 then concat('(', Jun_21 * -1, ')$') else concat(Jun_21, '$') end as [Jun-21]
, case when Jul_21 < 0 then concat('(', Jul_21 * -1, ')$') else concat(Jul_21, '$') end as [Jul-21]
, case when Aug_21 < 0 then concat('(', Aug_21 * -1, ')$') else concat(Aug_21, '$') end as [Aug-21]
, case when Sep_21 < 0 then concat('(', Sep_21 * -1, ')$') else concat(Sep_21, '$') end as [Sep-21]
, case when Oct_21 < 0 then concat('(', Oct_21 * -1, ')$') else concat(Oct_21, '$') end as [Oct-21]
, case when Nov_21 < 0 then concat('(', Nov_21 * -1, ')$') else concat(Nov_21, '$') end as [Nov-21]
, case when Dec_21 < 0 then concat('(', Dec_21 * -1, ')$') else concat(Dec_21, '$') end as [Dec-21]
, case when Customer = 'Total' then null
       else case when (Jan_21 + Feb_21 + Mar_21 + Apr_21 + May_21 + Jun_21 + Jul_21 + Aug_21 + Sep_21 + Oct_21 + Nov_21 + Dec_21) < 0
                     then concat('(', (Jan_21 + Feb_21 + Mar_21 + Apr_21 + May_21 + Jun_21 + Jul_21 + Aug_21 + Sep_21 + Oct_21 + Nov_21 + Dec_21) * -1 , ')$')
                 else concat((Jan_21 + Feb_21 + Mar_21 + Apr_21 + May_21 + Jun_21 + Jul_21 + Aug_21 + Sep_21 + Oct_21 + Nov_21 + Dec_21), '$')
            end
  end as Total

from final_data



--Interview Questions

--- Q1: Delete duplicate data --- 

drop table if exists cars;
create table cars
(
	model_id		int primary key,
	model_name		varchar(100),
	color			varchar(100),
	brand			varchar(100)
);
insert into cars values(1,'Leaf', 'Black', 'Nissan');
insert into cars values(2,'Leaf', 'Black', 'Nissan');
insert into cars values(3,'Model S', 'Black', 'Tesla');
insert into cars values(4,'Model X', 'White', 'Tesla');
insert into cars values(5,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(6,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(7,'Ioniq 6', 'White', 'Hyundai');

select * from cars;

delete from cars
where model_id not in (select min(model_id)
from cars
group by model_name)


--- Q2: Display highest and lowest salary --- 

if OBJECT_ID('employees', 'U') is not null 
drop table employees;

create table employees
(
	id 			int primary key identity,
	name 		varchar(100),
	dept 		varchar(100),
	salary 		int
);
insert into employees values( 'Alexander', 'Admin', 6500);
insert into employees values( 'Leo', 'Finance', 7000);
insert into employees values( 'Robin', 'IT', 2000);
insert into employees values( 'Ali', 'IT', 4000);
insert into employees values( 'Maria', 'IT', 6000);
insert into employees values( 'Alice', 'Admin', 5000);
insert into employees values( 'Sebastian', 'HR', 3000);
insert into employees values( 'Emma', 'Finance', 4000);
insert into employees values( 'John', 'HR', 4500);
insert into employees values( 'Kabir', 'IT', 8000);

select * from employees;

select e.dept, max(salary)
from employees e
group by e.dept

select *,
max(salary) over(partition by dept order by salary desc) as highest_sal,
min(salary) over(partition by dept order by salary desc 
				 range between unbounded preceding and unbounded following) as lowest_sal
from employees

--- Q3 : Find actual distance --- 
if OBJECT_ID('car_travels', 'U') is not null
drop table car_travels;
create table car_travels
(
    cars                    varchar(40),
    days                    varchar(10),
    cumulative_distance     int
);
insert into car_travels values ('Car1', 'Day1', 50);
insert into car_travels values ('Car1', 'Day2', 100);
insert into car_travels values ('Car1', 'Day3', 200);
insert into car_travels values ('Car2', 'Day1', 0);
insert into car_travels values ('Car3', 'Day1', 0);
insert into car_travels values ('Car3', 'Day2', 50);
insert into car_travels values ('Car3', 'Day3', 50);
insert into car_travels values ('Car3', 'Day4', 100);

select * from car_travels;

select *, cumulative_distance - lag(cumulative_distance, 1, 0) over(partition by cars order by days) as distance_covered
from car_travels


--- Q4 : Convert the given input to expected output --- 
if OBJECT_ID('src_dest_distance', 'u') is not null
drop table src_dest_distance;
create table src_dest_distance
(
    source          varchar(20),
    destination     varchar(20),
    distance        int
);
insert into src_dest_distance values ('Bangalore', 'Hyderbad', 400);
insert into src_dest_distance values ('Hyderbad', 'Bangalore', 400);
insert into src_dest_distance values ('Mumbai', 'Delhi', 400);
insert into src_dest_distance values ('Delhi', 'Mumbai', 400);
insert into src_dest_distance values ('Chennai', 'Pune', 400);
insert into src_dest_distance values ('Pune', 'Chennai', 400);

select * from src_dest_distance;
with cte as (
			select *, ROW_NUMBER() over( order by distance) as rn
			from src_dest_distance
)
select t1.source, t1.destination, t1.distance
from cte t1
join cte t2
			on t1.rn < t2.rn
			and t1.source = t2.destination
			and t1.destination =  t2.source


--- Q5 : Ungroup the given input data --- 

if OBJECT_ID('travel_items', 'u') is not null
drop table travel_items;
create table travel_items
(
	id              int,
	item_name       varchar(50),
	total_count     int
);
insert into travel_items values (1, 'Water Bottle', 2);
insert into travel_items values (2, 'Tent', 1);
insert into travel_items values (3, 'Apple', 4);
			
select * from travel_items

with cte as
		(select id, item_name, total_count, 1 as level
		from travel_items
		union all
		select cte.id, cte.item_name, cte.total_count -1, level+1 as level
		from cte
		join travel_items t on t.item_name = cte.item_name and t.id = cte.id
		where cte.total_count > 1
		)
		select id, item_name, level
		from cte


--- Q6 : IPL Matches --- 

if OBJECT_ID('teams', 'u') is not null
drop table teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');

select * from teams

with matches as 
				(select ROW_NUMBER() over(order by team_name) as id, t.*
				from teams t)
	select team.team_name as team, opponent.team_name as opponent
	from matches team
	join matches opponent on team.id < opponent.id
	order by team


with matches as 
				(select ROW_NUMBER() over(order by team_name) as id, t.*
				from teams t)
	select team.team_name as team, opponent.team_name as opponent
	from matches team
	join matches opponent on team.id <> opponent.id
	order by team