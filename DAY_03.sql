--- Japanese Cities Attributes on Hacker Rank
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';
--- Revising the select query on HackerRank
SELECT NAME
FROM CITY
WHERE population > 120000
AND COUNTRYCODE = 'USA';
--- Weathere Observation Station 1 HackerRank
SELECT CITY, STATE
FROM STATION;
--- Weather Observation Station 6 HackerRank
SELECT city
FROM station
WHERE city LIKE 'A%'
OR city LIKE 'E%'
OR city LIKE 'I%'
OR city LIKE 'O%'
OR city LIKE 'U%';
--- Weather Observation Station 7 HackerRank
SELECT distinct city
FROM station
WHERE city LIKE '%a'
OR city LIKE '%e'
OR city LIKE '%i'
OR city LIKE '%o'
OR city LIKE '%u';
---  Weather Observation Station 9 HackerRank
SELECT distinct city
FROM station
WHERE city NOT LIKE 'A%'
AND city NOT LIKE 'E%'
AND city NOT LIKE 'I%'
AND city NOT LIKE 'O%'
AND city NOT LIKE 'U%';
--- HackerRank name of employees
SELECT name
FROM Employee
ORDER BY name;
--- HackerRank salary of employees
SELECT name
FROM Employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id;
--- Leetcode recyclable and low fat products
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y';
--- Leetcode find customer referee
SELECT name
FROM Customer
WHERE referee_id != 2
OR referee_id IS null;
--- Leetcode big countries
SELECT name,population,area
FROM World
WHERE area >= 3000000
OR population >= 25000000;
--- Leetcode article views
SELECT DISTINCT (author_id) AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
--- datalemur tesla unfinished part
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
--- datalemur lyft drivers wages
select *
from lyft_drivers
WHERE yearly_salary <= 30000
OR yearly_salary >= 70000;
--- datalemur find the advertising chanel
select advertising_channel
from uber_advertising
WHERE year = 2019
AND money_spent > 100000;

