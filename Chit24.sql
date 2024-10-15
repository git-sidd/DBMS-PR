Here are the SQL statements to perform the specified operations on the MySQL terminal for the given tables (`Emp`, `works`, `Company`, and `Manager`).

### Step 1: Modify the Database for a Particular Company

To update the location of a specific company (e.g., ABC) to Pune, you can use the following SQL statement:

```sql
UPDATE Company
SET city = 'Pune'
WHERE cname = 'ABC';
```

### Step 2: Give All Managers of Mbank a 10% Raise (with conditions)

To give a 10% raise to all managers of Mbank, and a 3% raise if their salary is greater than 20,000, you can use the following statement:

```sql
UPDATE works
SET sal = CASE 
             WHEN sal > 20000 THEN sal * 1.03
             ELSE sal * 1.10
          END
WHERE cname = 'Mbank';
```

### Step 3: Find Names of All Employees Working in Bosch Company in Pune

To find all employees who work in Bosch and are located in Pune, you can execute the following SQL query:

```sql
SELECT E.ename
FROM Emp AS E
JOIN works AS W ON E.emp_id = W.emp_id
JOIN Company AS C ON W.c_id = C.c_id
WHERE C.cname = 'Bosch' AND C.city = 'Pune';
```

### Step 4: Delete Records in the Works Table for Employees of a Particular Company (e.g., SBC Company) with Salary > 50,000

To delete records from the `works` table for employees of SBC Company whose salary is greater than 50,000, you can use the following SQL command:

```sql
DELETE FROM works
WHERE c_id IN (
    SELECT c_id FROM Company WHERE cname = 'SBC'
) AND sal > 50000;
```

### Summary of SQL Statements:

1. **Modify Company Location**:
   ```sql
   UPDATE Company
   SET city = 'Pune'
   WHERE cname = 'ABC';
   ```

2. **Give Managers a Raise**:
   ```sql
   UPDATE works
   SET sal = CASE 
                WHEN sal > 20000 THEN sal * 1.03
                ELSE sal * 1.10
             END
   WHERE cname = 'Mbank';
   ```

3. **Find Employees in Bosch**:
   ```sql
   SELECT E.ename
   FROM Emp AS E
   JOIN works AS W ON E.emp_id = W.emp_id
   JOIN Company AS C ON W.c_id = C.c_id
   WHERE C.cname = 'Bosch' AND C.city = 'Pune';
   ```

4. **Delete High Salary Records**:
   ```sql
   DELETE FROM works
   WHERE c_id IN (
       SELECT c_id FROM Company WHERE cname = 'SBC'
   ) AND sal > 50000;
   ```

### Execution Instructions:

1. Open your MySQL terminal or client.
2. Select the database containing these tables.
3. Execute each SQL statement one by one.
4. Ensure to check for any errors after executing each statement to confirm successful execution.