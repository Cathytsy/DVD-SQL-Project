# DVD-SQL-Project

## Objective
🤔 Running a DVD Rental business is never easy, especially when it comes to some business solutions.

### 1st Query: Understanding my scale of business - Find all branches and the name of the staff 

If I want to expand my business e.g opening another shop, what factors should I put into an account?
- How many employees should I recruit?
- Does my current employee have the capacity to the new store to help?

```
-- Prompt: Find all branches and the name of the staff  
SELECT staff.staff_id, staff.first_name, staff.last_name, store.store_id, store.manager_staff_id
FROM staff
JOIN store
ON staff.staff_id = store.store_id
```
Result showing that currently I have two stores with one employee each, and needless to say there is not manager in the store.
From the data it might tell that one store having one employee is good enough running the store, but at the same time it also indicates opening another store with limited labor resouces is a risky move. 
