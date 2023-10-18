# DVD Rental Project

## Objective
🤔 Running a DVD Rental business is never easy, especially when it comes to some business solutions.

### Query1-Understanding my scale of business - Find all branches and the name of the staff 

If I want to expand my business e.g opening another shop, what factors should I put into an account?
- How many employees should I recruit?
- Does my current employee have the capacity to the new store to help?

```
-- Prompt: Find all branches and the name of the staff  
SELECT staff.staff_id, staff.first_name, staff.last_name, store.store_id, store.manager_staff_id
FROM staff
FULL JOIN store
ON staff.staff_id = store.store_id;
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/146478fe-7d29-4e1a-96a9-1852f202f711)

Results show that currently, I have two stores with one employee each, and needless to say, there is no manager in the store.
From the data, it might tell that one store having one employee is good enough to run the store, but at the same time, it also indicates opening another store with limited labor resources is a risky move. 

### Query2-Which store has a stronger customer base?

Instead of opening another store, increasing the current scale of store might also be an option.
- which store should I choose to expand?
  
```
-- Prompt: Which store has a stronger customer base?
SELECT COUNT(customer_id) as customer_total, store_id as store
FROM customer
GROUP BY store_id;
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/1f6186db-ec83-4ccc-88a5-dc79766d7975)

Results show that store one has a larger customer base when compared with store 2, and hence increasing the resources for store 1 might as well be a better approach. 

### Query3-Which store has a better sales record? 

Now we know store 1 has a stronger customer base, but we have to be careful that a stronger customer base does not necessarily mean the store has a better sales record, depending on how much each customer shops. To further check if store 1 performs better, let's make use of SQL's SUM and Group BY function.

```
-- Prompt: Which store has a better sales record? 
SELECT SUM(payment.amount) as sales_total, customer.store_id as store
FROM payment 
FULL JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.store_id;
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/5f41017d-9cbf-4a6d-8769-909328111fb3)

Now from the result generated we know the store 1 performs better, and if we do a little caculation, the customer in store 1 has a higher consumption than the customer in store 2. 

Store 1 - 33621.42/326 = 103.1332

Store 2 - 27690.62/273 =101.5408

From here we can make a little assumption that a higher customer base usually generates a higher sales record.

### Query4-Finding our top 10 customers 

Apart from expanstion, we could also think of how to leverage the current customer base in order to increase our sales revenue. Why not launch a VIP program for the top 10 client? To do this, we would be using the LIMIT & ORDER BY Function in SQL. 

```
-- Prompt: Who is our top 10 clients?

SELECT customer.customer_id, customer.first_name, customer.last_name,SUM(payment.amount) as total_consumption
FROM payment 
FULL JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_consumption DESC
LIMIT 10;

```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/7efee866-0063-4ea3-8235-54954e398c90)

Congratulations to 
"Eleanor"
"Karl"
"Marion"
"Rhonda"
"Clara"
"Tommy"
"Ana"
"Curtis"
"Marcia"
"Mike"
!


### Query5- How many films do we have in store 1 and 2
```
-- Prompt: how many films do we have in store 1 and 2

SELECT COUNT(film.film_id) as film_number, inventory.store_id as store 
FROM film
FULL JOIN inventory 
ON film.film_id = inventory.film_id
GROUP BY store;
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/1ff1d25c-8931-4ca9-a247-95377085e661)


Some intersting finding here, although store 2 has more film numbers than store 1, store 1 has a better revenue. 
It might be a good idea to get Mike and Jon in a meeting and for Mike to share his business strategy.

### Query6-What are the missing films?
Let's look into the data and investigate why there are films that does not fall into either store 1 or store 2.
```
-- Prompt: What are the missing films?

SELECT inventory.film_id, inventory.store_id as store, film.film_id
FROM inventory 
FULL JOIN film 
ON inventory.film_id=film.film_id
ORDER BY store_id DESC
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/d7886922-63ce-41b8-aa33-5c2755c8f5a2)

Further checking the unknown film has a film_id in the table film, and yet the film_id in the table inventory and store_id are missing. 
It could be the case that the film is not yet put into an inventory, but it would be a good idea to go to our store managers Mike and Jon. 

### Query7-Which category of film do we have the most

Let's look at the how many DVDs we have in each category. Previously in Query 6 we have realized that there are 42 items that only have film_id, is under investigation. 
Therefore, when considering the DVDs, we counted the film_id in table inventory, instead of film_id in table film.

```
-- Prompt: Which category of film do we have the most?
SELECT COUNT(inventory.film_id), category.name
from category 
FULL JOIN film_category
ON category.category_id = film_category.category_id 
FULL JOIN film
ON film_category.film_id = film.film_id
FULL JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY category.name
ORDER BY count DESC
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/a0e9b197-d557-439b-9bd1-f4a4437df4c0)


###Query8-Which category of film do we rent the most

```
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
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/acc563e7-9a0f-4ba8-bd4f-e22d05f539d0)
