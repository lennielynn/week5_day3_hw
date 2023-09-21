-- 1. List all customers who live in Texas (use JOINs)
	SELECT CONCAT(first_name,' ',last_name),district
	FROM address
	JOIN customer
	ON customer.address_id = address.address_id
	WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
	SELECT CONCAT(first_name,' ',last_name), payment.amount
	FROM customer
	JOIN payment ON customer.customer_id = payment.customer_id
	WHERE payment.amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries)
	SELECT CONCAT(first_name,' ',last_name)
	FROM customer
	WHERE customer_id in(
		SELECT customer_id
		FROM payment
		WHERE payment.amount > 175)


--4. List all customers that live in Nepal (use the city table)
	SELECT CONCAT(first_name,' ',last_name),country
	FROM country
	JOIN city
	ON country.country_id=city.country_id
	JOIN address
	ON city.city_id = address.city_id
	JOIN customer
	ON address.address_id = customer.address_id
	WHERE country = 'Nepal';



--5. Which staff member had the most transactions?
	SELECT count(staff_id), staff_id
	FROM rental
	GROUP BY staff_id;


--6. How many movies of each rating are there?
	SELECT count(rating),rating
	FROM film
	GROUP BY rating;



--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
	SELECT CONCAT(first_name, ' ', last_name) AS "full_name"
	FROM customer
	WHERE customer_id IN(
 		SELECT customer_id
 		FROM payment
 		WHERE amount > 6.99
 		GROUP BY customer_id
 		HAVING COUNT(payment_id) = 1
);


--8. How many free rentals did our stores give away?
	SELECT count(amount)
	FROM payment
	WHERE amount = 0