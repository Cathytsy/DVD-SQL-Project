-- Prompt: Which category of film do we rent the most?
SELECT COUNT(film.rental_rate), category.name
from category 
FULL JOIN film_category
ON category.category_id = film_category.category_id 
FULL JOIN film
ON film_category.film_id = film.film_id
FULL JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY category.name
oRDER BY COUNT DESC
