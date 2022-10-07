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
    -- Answer: 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT *
FROM payment;

SELECT COUNT(rental_id)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
    -- Answer: 5602


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
    -- Answer: 0


-- 5. What store employee (get the id) sold the most rentals?

SELECT *
FROM staff
    --2 employees
        -- staff_id 1 = Mike
        -- staff_id 2 = Jon

SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC;
    -- Mike takes first place selling 8040 rental movies


-- 6. How many different district names are there?

    SELECT COUNT(DISTINCT district)
    FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
