-- ex1: leetcode-mmediate-food-delivery.
# Write your MySQL query statement below
WITH stt AS
(
SELECT
COUNT(*) AS immediate
FROM (
SELECT delivery_id,
CASE
    WHEN order_date = customer_pref_delivery_date THEN 'immediate'
    ELSE 'scheduled'
END AS status
FROM Delivery) AS a
WHERE status = 'immediate'
),
order_num AS
(
SELECT COUNT(*) AS first_order
FROM
(
SELECT delivery_id, customer_id, order_date,
DENSE_RANK () OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number
FROM Delivery
) AS c
WHERE order_number = 1    
)
SELECT stt.immediate/order_num.first_order AS immediate_percentage
FROM stt JOIN order_num ON stt.delivery_id = c.delivery_id
-- ex2: leetcode-game-play-analysis.
-- ex3: leetcode-exchange-seats.
-- ex4: leetcode-restaurant-growth.
-- ex5: leetcode-investments-in-2016.
-- ex6: leetcode-department-top-three-salaries.
-- ex7: leetcode-last-person-to-fit-in-the-bus.
-- ex8: leetcode-product-price-at-a-given-date.
