-- Prompt: Who is our top 10 clients?

SELECT customer.customer_id, customer.first_name, customer.last_name,SUM(payment.amount) as total_consumption
FROM payment 
FULL JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_consumption DESC
LIMIT 10;
