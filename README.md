# DVD Rental Project

## Objective
🤔 Running a DVD Rental business is never easy, especially when it comes to some business solutions.

### Query1: Understanding my scale of business - Find all branches and the name of the staff 

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
SELECT COUNT(store_id) as customer_total, store_id as store
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

Apart from expanstion, we could also think of how to leverage the current customer base in order to increase our sales revenue. Why not launching a VIP program for the top 10 client? To do this, we would be using the LIMIT & ORDER BY Function in SQL. 

![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/57641b84-8026-4d6f-b4d0-c005649d3937)


