create database PETRESCUE;

-- Create the PETRESCUE table 
create table PETRESCUE (
	ID INTEGER NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE,
	PRIMARY KEY (ID)
	);
-- Insert sample data into PETRESCUE table
insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;
-- Exercise 1 -- Aggregate Functions
-- Q1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.
Select * from petrescue;

select SUM(COST) from PETRESCUE;

-- Q2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.

select SUM(COST) AS SUM_OF_COST from PETRESCUE;

-- Q3: Enter a function that displays the maximum quantity of animals rescued.

select MAX(QUANTITY) from PETRESCUE;

-- Q4: Enter a function that displays the average cost of animals rescued.

select AVG(COST) from PETRESCUE;

-- Q5: Enter a function that displays the average cost of rescuing a dog.

select AVG(COST/QUANTITY) from PETRESCUE where ANIMAL = 'Dog';

-- Exercise 2 : Scalar and String Functions
-- Q1: Enter a function that displays the rounded cost of each rescue.

select ROUND(COST) from PETRESCUE;

-- Q2: Enter a function that displays the length of each animal name.

select LENGTH(ANIMAL) from PETRESCUE;

-- Q3: Enter a function that displays the animal name in each rescue in uppercase.

select UCASE(ANIMAL) from PETRESCUE;

-- Q4: Enter a function that displays the animal name in each rescue in uppercase without duplications.

select DISTINCT(UCASE(ANIMAL)) from PETRESCUE;

-- Q5: Enter a query that displays all the columns from the PETRESCUE table, where the animal(s) rescued are cats. Use cat in lower case in the query.

select * from PETRESCUE where LCASE(ANIMAL) = 'cat';

-- Exercise 3 : Date and Time Functions
-- Q1: Enter a function that displays the day of the month when cats have been rescued.

select DAY(RESCUEDATE) from PETRESCUE where ANIMAL = 'Cat';

-- Q2: Enter a function that displays the number of rescues on the 5th month.

select SUM(QUANTITY) from PETRESCUE where MONTH(RESCUEDATE)='05';

-- Q3: Enter a function that displays the number of rescues on the 14th day of the month.

select SUM(QUANTITY) from PETRESCUE where DAY(RESCUEDATE)='14';


