--- Ex 1 Laptop vs. Mobile Viewership [New York Times SQL Interview Question]
SELECT
SUM (CASE
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) AS laptop_views,
SUM (CASE
  WHEN device_type = 'tablet' OR device_type = 'phone' THEN 1
  ELSE 0
END) AS mobile_views
FROM viewership;
--- Ex 2 Triangle Judgment LeetCode
SELECT
x,y,z,
CASE
  WHEN x+y>z AND x+z>y AND z+y>x THEN 'Yes'
  ELSE 'No'
END AS triangle
FROM triangle;
--- Ex 4 find customer referee Leetcode
SELECT
name
FROM Customer
WHERE
referee_id IS NULL
OR
referee_id != 2;
--- Ex 5 Strata Scratch Number of Survivors
SELECT
survived,
SUM (CASE
    WHEN pclass = 1 THEN 1
    ELSE 0
END) AS first_class,
SUM (CASE
    WHEN pclass = 2 THEN 1
    ELSE 0
    END) AS second_class,
SUM (CASE
    WHEN pclass = 3 THEN 1
    ELSE 0
    END) AS third_class
FROM titanic
GROUP BY survived;
