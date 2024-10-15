Here are the SQL queries to implement the requirements using the given tables: `Empl`, `Position`, and `Duty-alloc`.

### i. Get duty allocation details for e_no 123 for the first shift in the month of April 2003

```sql
SELECT *
FROM Duty-alloc
WHERE e_no = 123 AND month = 'April' AND year = 2003 AND shift = 'first';
```

### ii. Get the employees whose rate of pay is >= rate of pay of employees 'Sachin'

```sql
SELECT *
FROM Empl
WHERE pay_rate >= (SELECT pay_rate FROM Empl WHERE e_name = 'Sachin');
```

### iii. Create a view for displaying minimum, maximum, and average salary for all the posts

```sql
CREATE VIEW SalaryStats AS
SELECT p.post, 
       MIN(e.pay_rate) AS MinSalary, 
       MAX(e.pay_rate) AS MaxSalary, 
       AVG(e.pay_rate) AS AvgSalary
FROM Empl e
JOIN Position p ON e.post = p.post
GROUP BY p.post;
```

### iv. Get count of different employees on each shift having post ‘manager’

```sql
SELECT da.shift, COUNT(da.e_no) AS EmployeeCount
FROM Duty-alloc da
JOIN Empl e ON da.e_no = e.e_no
WHERE e.post = 'manager'
GROUP BY da.shift;
```

### Summary

- **Query i** retrieves duty allocation details for a specific employee in a specific month and shift.
- **Query ii** finds employees with pay rates greater than or equal to that of 'Sachin'.
- **Query iii** creates a view to calculate the minimum, maximum, and average salary for each post.
- **Query iv** counts employees with the post 'manager' for each shift. 

Make sure to run these queries in your MySQL terminal according to your database setup.