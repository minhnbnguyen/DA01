-- Ex 1: Y-on-Y Growth Rate [Wayfair SQL Interview Question] Data Lemur
SELECT
EXTRACT (YEAR from transaction_date) AS year,
product_id,
spend AS curr_year_spend,
LAG (spend) OVER (PARTITION BY product_id ORDER BY EXTRACT (YEAR from transaction_date)) AS prev_year_spend,
ROUND
  (100*(spend-LAG (spend) OVER (PARTITION BY product_id ORDER BY EXTRACT (YEAR from transaction_date)))/
  LAG (spend) OVER (PARTITION BY product_id ORDER BY EXTRACT (YEAR from transaction_date)),2) 
  AS yoy_rate
FROM user_transactions;
-- ex2: datalemur-card-launch-success
SELECT
DISTINCT card_name,
FIRST_VALUE (issued_amount)
OVER (PARTITION BY card_name ORDER BY issue_year,issue_month)
FROM monthly_cards_issued
ORDER BY FIRST_VALUE (issued_amount)
OVER (PARTITION BY card_name ORDER BY issue_year,issue_month) DESC;
-- ex3: datalemur-third-transaction.
SELECT a.user_id, a.spend, a.transaction_date
FROM (SELECT user_id, spend, transaction_date,
ROW_NUMBER () OVER (PARTITION BY user_id ORDER BY transaction_date) AS stt
FROM transactions) AS a
WHERE a.stt = 3;
-- ex4: datalemur-histogram-users-purchases.
SELECT
DISTINCT user_id,
transaction_date,
COUNT (product_id) OVER (PARTITION BY user_id ORDER BY transaction_date)
FROM user_transactions
WHERE transaction_date IN (
SELECT
FIRST_VALUE (transaction_date)
OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS transaction_date
FROM user_transactions)
ORDER BY transaction_date;
-- ex5: datalemur-rolling-average-tweets.
SELECT
user_id,
tweet_date,
ROUND (AVG (tweet_count)
OVER (PARTITION BY user_id ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2)
AS rolling_avg_3d
FROM tweets
ORDER BY user_id, tweet_date;
-- ex6: datalemur-repeated-payments.
WITH a AS (SELECT
merchant_id,
transaction_timestamp,
LAG (transaction_timestamp)
OVER (PARTITION BY merchant_id,credit_card_id,amount
ORDER BY transaction_timestamp) AS later
FROM transactions)
SELECT
SUM (CASE
  WHEN transactions.transaction_timestamp -  a.later <= '10 minutes' THEN 1
  ELSE 0
END) AS payment_count
FROM transactions
JOIN a ON transactions.transaction_timestamp=a.transaction_timestamp;
-- ex7: datalemur-highest-grossing.
WITH a AS (
SELECT
category, product,
SUM (spend) AS total_spend
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY product, category),
B AS (
SELECT
a.category, a.product,a.total_spend,
DENSE_RANK () OVER (PARTITION BY a.category ORDER BY a.total_spend DESC) AS stt
FROM product_spend
JOIN a ON a.product=product_spend.product)
SELECT
a.category,a.product,a.total_spend
FROM product_spend AS c
JOIN a ON a.product=c.product
JOIN b ON c.product=b.product
WHERE b.stt IN (1,2)
GROUP BY a.category, a.product, a.total_spend, b.stt
ORDER BY a.category, b.stt;
-- ex8: datalemur-top-fans-rank.
WITH stt AS (SELECT
a.artist_name,
s.name,
SUM (CASE
  WHEN g.rank BETWEEN 1 AND 10 THEN 1
  ELSE 0
END) OVER (PARTITION BY s.artist_id) AS days 
FROM artists AS a 
JOIN songs AS s ON a.artist_id=s.artist_id
JOIN global_song_rank AS g ON s.song_id=g.song_id
ORDER BY
SUM (CASE
  WHEN g.rank BETWEEN 1 AND 10 THEN 1
  ELSE 0
END) OVER (PARTITION BY s.artist_id) DESC),
haha AS(
SELECT
DISTINCT artist_name,
DENSE_RANK () OVER (ORDER BY stt.days DESC) AS artist_rank
FROM stt
ORDER BY DENSE_RANK () OVER (ORDER BY stt.days DESC))
SELECT
DISTINCT stt.artist_name, haha.artist_rank
FROM stt JOIN haha ON stt.artist_name=haha.artist_name
WHERE haha.artist_rank IN (1,2,3,4,5)
ORDER BY haha.artist_rank, stt.artist_name;
