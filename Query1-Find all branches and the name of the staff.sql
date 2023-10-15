-- Prompt: Find all branches and the name of the staff
SELECT staff.staff_id, staff.first_name, staff.last_name, store.store_id, store.manager_staff_id
FROM staff
FULL JOIN store
ON staff.staff_id = store.store_id