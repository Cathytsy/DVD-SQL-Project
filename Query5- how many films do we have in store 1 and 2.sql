-- Prompt: how many films do we have in store 1 and 2

SELECT COUNT(film.film_id) as film_number, inventory.store_id as store 
FROM film
FULL JOIN inventory 
ON film.film_id = inventory.film_id
GROUP BY store;