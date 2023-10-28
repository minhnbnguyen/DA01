-- Ex 4: Page With No Likes [Facebook SQL Interview Question] DataLemur
SELECT
a.page_id
FROM pages AS a
LEFT JOIN page_likes AS b
ON a.page_id=b.page_id
WHERE b.liked_date IS NULL
ORDER BY page_id;
-- Ex 5: Active User Retention [Facebook SQL Interview Question] DataLemur
WITH twt_jun AS (
SELECT
user_id
FROM user_actions
GROUP BY EXTRACT (month FROM event_date), user_id
HAVING EXTRACT (month FROM event_date) = 6),
twt_july AS (
SELECT
user_id
FROM user_actions
GROUP BY EXTRACT (month FROM event_date), user_id
HAVING EXTRACT (month FROM event_date) = 7)
SELECT
EXTRACT (month FROM event_date),
COUNT (DISTINCT a.user_id) AS monthly_active_users
FROM user_actions AS a
JOIN twt_jun ON a.user_id=twt_jun.user_id
JOIN twt_july ON twt_jun.user_id=twt_july.user_id
GROUP BY EXTRACT (month FROM event_date)
HAVING EXTRACT (month FROM event_date) IN (7);
-- Ex 6: 1193. Monthly Transactions I Leetcode
WITH time 
AS (
  SELECT
  TO_CHAR (trans_date,'YYYY-MM') AS month,
  id
  FROM Transactions
)
SELECT
time.month,
a.country,
COUNT (a.id) AS trans_count,
SUM (CASE
  WHEN a.state='approved' THEN 1
  ELSE 0
END) AS approved_count,
SUM (a.amount) AS trans_total_amount,
SUM (CASE
  WHEN a.state='approved' THEN a.amount
  ELSE 0
END) AS approved_total_amount
FROM Transactions AS a JOIN time ON time.id=a.id
GROUP BY time.month, a.country
ORDER BY time.month, a.country DESC
-- Ex 7: 1070. Product Sales Analysis III Leetcode
SELECT
a.product_id, b.year AS first_year, b.quantity, b.price
FROM Product AS a
LEFT JOIN Sales AS b ON a.product_id=b.product_id
WHERE (a.product_id, b.year) IN
(SELECT c.product_id, MIN (c.year)FROM Sales AS c GROUP BY c.product_id)
-- Ex 8: 1045. Customers Who Bought All Products Leetcode
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT (DISTINCT product_key) = (SELECT
COUNT (DISTINCT product_key)
FROM Product);
-- Ex 9: 1978. Employees Whose Manager Left the Company Leetcode
SELECT
employee_id
FROM Employees
WHERE salary <30000 
AND manager_id NOT IN (SELECT employee_id FROM employees)
ORDER BY employee_id
-- Ex 10: Duplicate Job Listings [Linkedin SQL Interview Question] DataLemur
SELECT
COUNT (DISTINCT company_id) AS duplicate_companies
FROM job_listings
WHERE company_id IN (SELECT
company_id
FROM job_listings
GROUP BY description, company_id
HAVING COUNT (*) >1);
