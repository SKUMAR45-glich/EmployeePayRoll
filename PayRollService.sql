--UC1_Creation_of_Payroll_Services_Database
create database PayRollService;

--UC2_Create_Employee_Payroll_Table
use PayRollService;

create table Employee_PayRoll
(
id int identity(1,1),
name varchar(25) not null,
salary money,
start date not null
);

--UC3_InsertintoEmployeePayrollTable
insert into Employee_PayRoll values
('Bill',100000.00,'2018-01-03'),
('Terisa',200000.00,'2019-11-03'),
('Charlie',300000.00,'2020-05-21');

--UC4_Retrieve_Data_from_EmplyeeTable
select * from Employee_PayRoll;


--UC5_Retrieve_Data_Using_Condition
select * from Employee_PayRoll
where name = 'Bill';

select * from Employee_PayRoll
where start between CAST('2020-01-01' AS date) and GETDATE();



--UC6_Update_Existing_Rows_and_Add new_column
ALTER TABLE Employee_PayRoll
ADD gender char;

select * from Employee_PayRoll;

UPDATE Employee_PayRoll
SET gender = 'M'
where name = 'Bill';

UPDATE Employee_PayRoll
SET gender = 'F'
where name = 'Charlie';

select * from Employee_PayRoll;

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
