-- Prompt: What are the missing films?

SELECT inventory.film_id as inventory_film_id, inventory.store_id as store, film.film_id as film_id
FROM inventory 
FULL JOIN film 
ON inventory.film_id=film.film_id
ORDER BY store_id DESC;

