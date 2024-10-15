Here are the SQL queries to perform the specified tasks based on the provided **Employee** and **Project** tables:

### Table Structures
- **Employee Table**: (Eid, EName, Address, Salary, Commission)
- **Project Table**: (PNo, Addr)

### SQL Queries

1. **Find different locations from where employees belong to?**
   ```sql
   SELECT DISTINCT Address
   FROM Employee;
   ```

2. **What is maximum and minimum salary?**
   ```sql
   SELECT MAX(Salary) AS Maximum_Salary, MIN(Salary) AS Minimum_Salary
   FROM Employee;
   ```

3. **Display the content of employee table according to the ascending order of salary amount.**
   ```sql
   SELECT *
   FROM Employee
   ORDER BY Salary ASC;
   ```

4. **Find the name of employee who lived in Nasik or Pune city.**
   ```sql
   SELECT EName
   FROM Employee
   WHERE Address IN ('Nasik', 'Pune');
   ```

5. **Find the name of employees who do not get a commission.**
   ```sql
   SELECT EName
   FROM Employee
   WHERE Commission IS NULL OR Commission = 0;
   ```

6. **Change the city of Amit to Nashik.**
   ```sql
   UPDATE Employee
   SET Address = 'Nashik'
   WHERE EName = 'Amit';
   ```

7. **Find the information of employees whose name starts with ‘A’.**
   ```sql
   SELECT *
   FROM Employee
   WHERE EName LIKE 'A%';
   ```

8. **Find the count of staff from Mumbai.**
   ```sql
   SELECT COUNT(*) AS Staff_Count
   FROM Employee
   WHERE Address = 'Mumbai';
   ```

9. **Find the count of staff from each city.**
   ```sql
   SELECT Address, COUNT(*) AS Staff_Count
   FROM Employee
   GROUP BY Address;
   ```

10. **Find the address from where employees are belonging as well as where projects are going on.**
    ```sql
    SELECT DISTINCT e.Address
    FROM Employee e
    JOIN Project p ON e.Address = p.Addr;
    ```

11. **Find city-wise minimum salary.**
    ```sql
    SELECT Address, MIN(Salary) AS Minimum_Salary
    FROM Employee
    GROUP BY Address;
    ```

12. **Find city-wise maximum salary having maximum salary greater than 26000.**
    ```sql
    SELECT Address, MAX(Salary) AS Maximum_Salary
    FROM Employee
    GROUP BY Address
    HAVING MAX(Salary) > 26000;
    ```

13. **Delete the employee who is having a salary greater than 30,000.**
    ```sql
    DELETE FROM Employee
    WHERE Salary > 30000;
    ```

### Explanation:
- Each query is designed to fulfill a specific requirement based on the provided tables.
- **Aggregate functions** like `MAX`, `MIN`, and `COUNT` are used to retrieve statistics.
- **JOINs** and **GROUP BY** clauses are utilized to combine and aggregate data from the `Employee` and `Project` tables where necessary.
- **UPDATE** and **DELETE** statements modify and remove data as required.

You can execute these queries in your MySQL terminal to obtain the desired results.