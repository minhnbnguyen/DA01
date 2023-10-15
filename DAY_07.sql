--- HackerRank More than 75 marks
SELECT
Name
FROM
STUDENTS
WHERE Marks > 75
ORDER BY RIGHT (Name, 3) ASC, ID ASC;
--- Leetcode Fix names in a table
SELECT
user_id,
CONCAT (UPPER (LEFT (name, 1)),LOWER (RIGHT (name, LENGTH (name)-1))) AS name
FROM Users
ORDER BY user_id;
--- Data Lemur CVS Health SQL Interview
SELECT manufacturer,
CONCAT ('$', ROUND (SUM (total_sales)/1000000), ' million')
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM (total_sales) DESC, manufacturer ASC;
--- Amazon SQL Interview Data Lemur reviews_Rating
SELECT 
EXTRACT (MONTH FROM submit_date) AS mth,
product_id AS product,
ROUND (AVG (stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT (MONTH FROM submit_date), product_id
ORDER BY EXTRACT (MONTH FROM submit_date), product_id;
--- Microsoft SQL Interview Data Lemur Teams Power use
SELECT
sender_id,
COUNT (message_id) AS count_messages
FROM messages
WHERE EXTRACT (MONTH from sent_date) = 8
AND EXTRACT (YEAR FROM sent_date) = 2022
GROUP BY sender_id
HAVING COUNT (message_id) >2
ORDER BY COUNT (message_id) DESC;
--- Leetcode Invalid Tweets
SELECT
tweet_id
FROM Tweets
WHERE LENGTH (content) > 15;
--- Leetcode User Activity for 30 days
SELECT
activity_date AS day,
COUNT (DISTINCT user_id) AS active_users
FROM Activity
GROUP BY activity_date
HAVING activity_date BETWEEN '2019-06-28' AND '2019-07-27';
--- Strata Scratch Number of Hires During Specific Time Period - Deloitte
SELECT
COUNT (ID),
EXTRACT (MONTH FROM joining_date) AS Month
FROM employees
GROUP BY EXTRACT (MONTH FROM joining_date)
HAVING EXTRACT (MONTH FROM joining_date) IN (1,2,3,4,5,6,7)
ORDER BY EXTRACT (MONTH FROM joining_date);
--- Strata Scratch Macedonia vintages Wine Magazine
SELECT
title,
CAST (SUBSTR (title,POSITION ('2' IN title),4) AS INTEGER) AS vintage_years
FROM winemag_p2
WHERE country = 'Macedonia';
--- Strata Scratch Position of letter a Amazon
SELECT
first_name,
POSITION ('a' IN first_name)
FROM
worker
WHERE first_name = 'Amitah';


