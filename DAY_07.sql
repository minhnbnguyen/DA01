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
--- Leetcode Invalid Tweets
SELECT
tweet_id
FROM Tweets
WHERE LENGTH (content) > 15;
--- Leetcode User Activity for 70 days

