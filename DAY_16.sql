-- ex1: leetcode-mmediate-food-delivery.
SELECT
    ROUND (avg(order_date=customer_pref_delivery_date)*100,2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN
(
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
)
-- ex2: leetcode-game-play-analysis.
WITH c AS
(
SELECT *
FROM
(
SELECT *,
DATEDIFF (prev_event_date, event_date) AS time_period
FROM
(
SELECT *,
LEAD (event_date,1,"2024-03-01") OVER (PARTITION BY player_id ORDER BY event_date) AS prev_event_date
FROM Activity
) AS a
) AS b
GROUP BY player_id
)
SELECT ROUND (avg(time_period=1),2) AS fraction
FROM c
-- ex3: leetcode-exchange-seats.
-- even number
SELECT *,
CASE
    WHEN id % 2 != 0 THEN LEAD (student) OVER (ORDER BY id)
    WHEN id % 2 = 0 THEN LAG (student) OVER (ORDER BY id)
END AS student
FROM Seat
-- odd number
SELECT
SELECT *,
CASE
    WHEN id = MAX(id) AND id % 2 != 0 THEN LEAD (student) OVER (ORDER BY id)
    WHEN id = MAX(id) AND id % 2 = 0 THEN LAG (student) OVER (ORDER BY id)
    ELSE NULL
END AS student
FROM Seat
-- ex4: leetcode-restaurant-growth.
-- ex5: leetcode-investments-in-2016.
-- ex6: leetcode-department-top-three-salaries.
-- ex7: leetcode-last-person-to-fit-in-the-bus.
-- ex8: leetcode-product-price-at-a-given-date.
