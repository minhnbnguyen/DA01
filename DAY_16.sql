-- ex1: leetcode-mmediate-food-delivery.
-- 
SELECT
COUNT (*)
FROM
(
SELECT delivery_id, order_number
FROM
(
SELECT delivery_id, customer_id,
DENSE_RANK () OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number
FROM Delivery
) AS a
-- ex2: leetcode-game-play-analysis.
-- ex3: leetcode-exchange-seats.
-- ex4: leetcode-restaurant-growth.
-- ex5: leetcode-investments-in-2016.
-- ex6: leetcode-department-top-three-salaries.
-- ex7: leetcode-last-person-to-fit-in-the-bus.
-- ex8: leetcode-product-price-at-a-given-date.
