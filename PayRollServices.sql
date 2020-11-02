--UC1_Creation_of_Payroll_Services_Database
create database payroll_services;


--UC2_Create_Employee_Payroll_Table
use payroll_service;

create table employee_payroll
(
id int identity(1,1),
name varchar(25) not null,
salary money not null,
start date not null
);


--UC3_InsertintoEmployeePayrollTable
insert into employee_payroll values
('Bill',100000.00,'2018-01-03'),
('Terisa',200000.00,'2019-11-03'),
('Charlie',300000.00,'2020-05-21');


--UC4_Retrieve_Data_from_EmplyeeTable
select * from employee_payroll;


--UC5_Retrieve_Data_Using_Condition
select * from employee_payroll
where name = 'Bill';

select * from employee_payroll
where start between '2020-01-01' and GETDATE();


--UC6_Update_Existing_Rows_and_Add new_column
ALTER TABLE employee_payroll
ADD gender char;

select * from employee_payroll;

UPDATE employee_payroll
SET gender = 'M'
where id in (1,2);

UPDATE employee_payroll
SET gender = 'F'
where id in (3,4);


--UC7_Use_DB_Functions
SELECT gender, SUM(salary) FROM employee_payroll
GROUP BY gender;

SELECT gender, MAX(salary) FROM employee_payroll
GROUP BY gender;

SELECT gender, MIN(salary) FROM employee_payroll
GROUP BY gender;

SELECT gender, AVG(salary) FROM employee_payroll
GROUP BY gender;

SELECT gender, COUNT(id) FROM employee_payroll
GROUP BY gender;