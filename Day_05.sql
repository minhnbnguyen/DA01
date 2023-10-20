--- /weather-observation-station-3/ HackerRank
SELECT DISTINCT CITY
FROM STATION
WHERE ID%2=0;
--- /weather-observation-station-4/ HackerRank
SELECT
COUNT (CITY) - COUNT (DISTINCT CITY)
FROM STATION;
--- HackerRank - The Blunder
--- DataLemur Alibaba SQL Interview
SELECT
ROUND (
SUM(item_count :: DECIMAL * order_occurrences) / SUM(order_occurrences),1)
AS MEAN
FROM items_per_order;
--- DataLemur Matching Skills LinkedIn SQL Interview
SELECT
candidate_id
FROM
candidates
WHERE
skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT (skill) = 3
ORDER BY candidate_id;
--- Average Post Hiatus (Part 1) [Facebook SQL Interview Question] DataLemur
SELECT
user_id,
MAX (DATE (post_date)) - MIN (DATE (post_date)) AS days_between
FROM
posts
WHERE post_date BETWEEN '01/01/2021' AND '12/31/2021'
GROUP BY
user_id
HAVING
COUNT (post_date) >= 2;
--- Cards Issued Difference [JPMorgan Chase SQL Interview Question] Data Lemur
SELECT
card_name,
MAX (issued_amount) - MIN (issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY MAX (issued_amount) - MIN (issued_amount) DESC;
--- Pharmacy Analytics (Part 2) [CVS Health SQL Interview Question] Data Lemur
SELECT
manufacturer,
COUNT (drug) AS drug_count,
SUM (cogs-total_sales) AS total_loss
FROM pharmacy_sales
WHERE total_sales < cogs
GROUP BY manufacturer
ORDER BY total_loss DESC;
--- Not boring movies leetcode
SELECT
*
FROM Cinema
WHERE description != 'boring'
AND id%2 = 1
ORDER BY rating DESC;
--- number of unique subjects teach by each teacher Leetcode
SELECT
teacher_id,
COUNT (DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
--- find followers count leetcode
SELECT
user_id,
COUNT (follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
--- classes more than 5 students leetcode
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT (DISTINCT student) >= 5;
