create database PROJECT

use project;

select * from hr;

-- DATA CLEANING

ALTER TABLE hr
change column ï»¿id emp_id varchar(20);


describe hr;

select birthdate from hr;

set sql_safe_updates=0;
    
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END

ALTER TABLE hr
modify birthdate date;


select birthdate from hr

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END

ALTER TABLE hr 
MODIFY hire_date date


UPDATE hr
SET termdate = DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

select termdate from hr

ALTER TABLE hr
MODIFY COLUMN termdate DATE;


ALTER TABLE hr add column age int;


UPDATE hr
SET age = timestampdiff(YEAR,Birthdate,curdate());

select birthdate,age from hr;

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;


select count(*) from hr where age<18;

select birthdate from hr