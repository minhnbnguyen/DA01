-- ex1: leetcode-mmediate-food-delivery.
# Write your MySQL query statement below
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
-- ex3: leetcode-exchange-seats.
-- ex4: leetcode-restaurant-growth.
-- ex5: leetcode-investments-in-2016.
-- ex6: leetcode-department-top-three-salaries.
-- ex7: leetcode-last-person-to-fit-in-the-bus.
-- ex8: leetcode-product-price-at-a-given-date.
