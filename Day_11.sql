--- HackerRAnk Average Population of Each Continent
SELECT
b.continent,
FLOOR(AVG (a.population))
FROM city AS a
JOIN country AS b
ON a.countrycode=b.code
GROUP BY b.continent
ORDER BY ROUND (AVG (a.population),0);
--- DataLemur Signup Activation Rate [TikTok SQL Interview Question]
SELECT
ROUND (AVG(CASE
  WHEN a.signup_action = 'Confirmed' THEN 1
  ELSE 0
END),2) AS activation_rate
FROM texts AS a
JOIN emails AS b
ON a.email_id=b.email_id;
--- Data Lemur Sending vs. Opening Snaps [Snapchat SQL Interview Question]
--- Data Lemur Supercloud Customer [Microsoft SQL Interview Question]
SELECT
a.customer_id
FROM customer_contracts AS a
LEFT JOIN products AS b
ON a.product_id=b.product_id
GROUP BY a.customer_id
HAVING COUNT (DISTINCT b.product_category) >= 3;
--- Leetcode The Number Of Employees which report to each employee
SELECT
emp.employee_id,
emp.name,
COUNT(mng.reports_to) AS reports_count,
ROUND (AVG (mng.age),0) AS average_age
FROM
employees AS emp
LEFT JOIN employees AS mng
ON emp.employee_id=mng.reports_to
WHERE mng.reports_to IS NOT NULL
GROUP BY emp.employee_id
ORDER BY emp.employee_id;
--- Leetcode List the products order in a period
--- Leetcode SQL Page with no like