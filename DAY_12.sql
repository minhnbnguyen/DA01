-- Question 1: Creaet the list of different replacement costs of the films. 
SELECT DISTINCT replacement_cost
FROM film
ORDER BY replacement_cost;

-- Question 2: Create a query that provide an overview of all film replacement costs in these following ranges
-- 1.	low: 9.99 - 19.99
-- 2.	medium: 20.00 - 24.99
-- 3.	high: 25.00 - 29.99
SELECT
SUM(CASE
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1
	ELSE NULL
END) AS category
FROM film
GROUP BY
CASE
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
	ELSE NULL
END
HAVING SUM(CASE
	WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 1
	ELSE NULL
END) IS NOT NULL;

-- Question 3: Create a list of film_title including titles, length and category name with a descending order. Filtering films that fall in the 'drama' or 'sports' category
SELECT
a.title, a.length, c.name
FROM film AS a
JOIN film_category AS b
ON a.film_id=b.film_id
JOIN category AS c
ON c.category_id=b.category_id
WHERE c.name = 'Drama' OR c.name = 'Sports'
ORDER BY a.length DESC;

-- Question 4: Give an overview of film title in each category
SELECT
c.name,
COUNT (a.title) AS so_luong
FROM film AS a
JOIN film_category AS b
ON a.film_id=b.film_id
JOIN category AS c
ON c.category_id=b.category_id
GROUP BY c.name
ORDER BY COUNT (a.title) DESC;

--- Question 5: Give an overview of actor's names with the amount of movies that they are in
SELECT
CONCAT (a.first_name,' ',a.last_name),
COUNT(DISTINCT b.film_id) AS so_luong
FROM actor AS a
FULL JOIN film_actor AS b
ON a.actor_id=b.actor_id
GROUP BY CONCAT (a.first_name,' ',a.last_name)
ORDER BY COUNT(DISTINCT b.film_id) DESC;

-- Question 6: Find all the address that are not related to any customers
SELECT
COUNT(*)
FROM address AS a
LEFT JOIN customer AS b
ON a.address_id=b.address_id
WHERE customer_id IS NULL;

-- Question 7: List down all the cities and their respective revenue
SELECT
SUM (a.amount),d.city
FROM payment AS a
JOIN customer AS b
ON a.customer_id=b.customer_id
JOIN address AS c
ON c.address_id=b.address_id
JOIN city AS d
ON d.city_id=c.city_id
GROUP BY d.city
ORDER BY SUM (a.amount) DESC;

--- Question 8: List down all the countries, cities and their revenue
SELECT
CONCAT (d.city,', ',e.country),
SUM (a.amount)
FROM payment AS a
LEFT JOIN customer AS b
ON a.customer_id=b.customer_id
JOIN address AS c
ON c.address_id=b.address_id
JOIN city AS d
ON d.city_id=c.city_id
JOIN country AS e
ON d.country_id=e.country_id
GROUP BY CONCAT (d.city,', ',e.country)
ORDER BY SUM (a.amount);
