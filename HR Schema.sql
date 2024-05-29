create database HR;
use HR;
CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
-- HEre we import data from extrnal csv files

Select * from EMployees;

-- Q1 Retrive F_name , L_name who lives in Elgin IL

select F_NAME, L_NAME from Employees
where ADDRESS like '%Elgin,IL%';

-- Q2 -- find the person who born in 70's

select F_NAME, L_NAME from Employees
where B_DATE like '197%';

-- Q3 -- find the name of the person  whose salary is between 60000 and 70000.

select * from EMPLOYEES
where (SALARY between 60000 AND 70000) and DEP_ID = 5;

-- Q4 -- Sort EMployees table according to dep_id

select F_NAME, L_NAME, DEP_ID from EMPLOYEES
order by DEP_ID;    

-- Q5 -- Sort Employees table by dep_id and L-name in desecnding order

select F_NAME, L_NAME, DEP_ID from EMPLOYEES
order by DEP_ID DESC, L_NAME DESC;       

-- Q6 -- Group by dep_id      

select DEP_ID, COUNT(*)from EMPLOYEES
group by DEP_ID;

-- Q7 -- Retrieve the number of employees in the department and the average employee salary in the department.

select DEP_ID, COUNT(*), avg(SALARY) from EMPLOYEES
group by DEP_ID;

-- Q8 -- Retrive DATA by grouping dep_id and name the count column as num_employess and avg column as avg_salary

select DEP_ID, COUNT(*) as "NUM_EMPLOYEES", avg(SALARY) as "AVG_SALARY" from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;

-- Q9 -- Retrive DATA by grouping dep_id and name the count column as num_employess and avg column as avg_salary having count less than 4

select DEP_ID, COUNT(*) as "NUM_EMPLOYEES", avg(SALARY) as "AVG_SALARY" from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by AVG_SALARY;