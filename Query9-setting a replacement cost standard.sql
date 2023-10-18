--Prompt: setting a replacement cost standard
SELECT title,
       replacement_cost,
       CASE
	       WHEN replacement_cost>= 9.99 
		   		AND replacement_cost<=15.99 THEN 'Low'
           WHEN replacement_cost>=16.99
                AND replacement_cost <= 23.99 THEN 'Medium'
		   WHEN replacement_cost>23.99
                THEN 'High'
           
       END replacement_cost_standard  
FROM film
ORDER BY title;