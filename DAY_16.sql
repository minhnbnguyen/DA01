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
SELECT id,
CASE
    WHEN id != (SELECT MAX(id) FROM Seat) AND id % 2 != 0 THEN LEAD (student) OVER (ORDER BY id)
    WHEN id != (SELECT MAX(id) FROM Seat) AND id % 2 = 0 THEN LAG (student) OVER (ORDER BY id)
    WHEN id = (SELECT MAX(id) FROM Seat) AND id % 2 = 0 THEN LAG (student) OVER (ORDER BY id)
    ELSE (SELECT student FROM Seat WHERE id IN (SELECT MAX(id) FROM Seat))
END AS student
FROM Seat
-- ex4: histogram-of-tweets Data Lemur
SELECT tweet_bucket,
COUNT (user_id) AS user_nums
FROM
(
SELECT user_id,
COUNT(tweet_id) AS tweet_bucket
FROM tweets
WHERE tweet_date BETWEEN '01/01/2022 00:00:00' AND '12/31/2022 00:00:00'
GROUP BY user_id
) AS a
GROUP BY tweet_bucket
-- ex5: App Click-through Rate (CTR) [Facebook SQL Interview Question] Data Lemur
SELECT app_id,
ROUND (100.0*clicks/impressions,2) AS ctr
FROM
(
SELECT app_id,
SUM (CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impressions,
SUM (CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS clicks
FROM events
WHERE timestamp BETWEEN '01/01/2022 00:00:00' AND '12/31/2022 23:59:59'
GROUP BY app_id
) AS a
GROUP BY app_id, clicks, impressions
-- ex6: Second Day Confirmation [TikTok SQL Interview Question] Data Lemur
SELECT user_id
FROM emails AS a JOIN texts AS b ON a.email_id = b.email_id
WHERE a.signup_date = b.action_date - INTERVAL '1' DAY
AND b.signup_action = 'Confirmed'
-- ex7: Pharmacy Analytics (Part 1) [CVS Health SQL Interview Question] Data Lemur
SELECT drug,
total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3
-- ex8: Top 5 Artists [Spotify SQL Interview Question] Data Lemur
WITH stt AS (SELECT
a.artist_name,
a.artist_id,
s.name,
SUM (CASE
  WHEN g.rank BETWEEN 1 AND 10 THEN 1
  ELSE 0
END) OVER (PARTITION BY s.artist_id) AS days 
FROM artists AS a 
JOIN songs AS s
ON a.artist_id=s.artist_id
JOIN global_song_rank AS g
ON s.song_id=g.song_id
ORDER BY
SUM (CASE
  WHEN g.rank BETWEEN 1 AND 10 THEN 1
  ELSE 0
END) OVER (PARTITION BY s.artist_id) DESC),
haha AS(
SELECT
DISTINCT stt.artist_name,
DENSE_RANK () OVER (ORDER BY stt.days DESC) AS artist_rank
FROM stt
ORDER BY DENSE_RANK () OVER (ORDER BY stt.days DESC))
SELECT
DISTINCT stt.artist_name, haha.artist_rank
FROM stt JOIN haha ON stt.artist_name=haha.artist_name
WHERE haha.artist_rank IN (1,2,3,4,5)
ORDER BY haha.artist_rank, stt.artist_name;
