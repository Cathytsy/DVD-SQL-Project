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
ON staff.staff_id = store.store_id
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
GROUP BY store_id
```
![image](https://github.com/Cathytsy/DVD-SQL-Project/assets/147212218/1f6186db-ec83-4ccc-88a5-dc79766d7975)

Results show that store one has a larger customer base when compared with store 2, and hence increasing the resources for store 1 might as well be a better approach. 

