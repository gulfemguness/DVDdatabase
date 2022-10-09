-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT *
FROM actor;

        -- to find the same last name
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg'

        -- to find how many actors have the same last name
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
    -- ANSWER: 2 


-- 2. How many payments were made between $3.99 and $5.99?

SELECT *
FROM payment;

SELECT COUNT(rental_id)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
    -- ANSWER: 5602

"
SELECT rental_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
"

"
SELECT COUNT(customer_id)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
"

-- 3. What film does the store have the most of? (search in inventory)

SELECT *
FROM film;

SELECT *
FROM inventory;



-- SELECT inventory_id, film_id
-- FROM inventory
-- GROUP BY inventory_id
-- ORDER BY COUNT(inventory_id) DESC;


-- 4. How many customers have the last name ‘William’?

SELECT *
FROM customer;

SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
    -- ANSWER: 0 --


-- 5. What store employee (get the id) sold the most rentals?

SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC; -- to find the most sold rentals

SELECT *
FROM staff
WHERE staff_id = 1; --to find the name of the employee
    -- ANSWER: Mike takes first place selling 8040 rental movies
        -- NOTE: ascending (smallest value first) X descending (largest value first)


-- 6. How many different district names are there?

    SELECT COUNT(DISTINCT district)
    FROM address;
    -- ANSWER: 378 


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT DISTINCT film_id, COUNT(actor_id) --DISTINCT: getting something specific
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


SELECT *
FROM film
WHERE film_id = 508;
    -- ANSWER: Lambs Cincinatti

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

"""
    - to find how many store_id's
SELECT(store_id), COUNT(customer_id)
FROM customer
GROUP BY store_id
ORDER BY store_id DESC;
"""

SELECT(customer_id), COUNT(customer_id)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'
GROUP BY customer_id
ORDER BY last_name; 
    -- ANSWER: 13 
    --(but I want to find the total number not for individually/come back for this question again)


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT(amount), COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
    -- ANSWER: 3 payment amounts 
    -- amount/count: (2.99/290), (4.99/281), (0.99/269)

-- 10. Within the film table, how many rating categories are there? 

SELECT COUNT(DISTINCT rating)
FROM film;

-- And what rating has the most movies total?
SELECT(rating), COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;

    -- ANSWER: PG-13 (total movies: 223)