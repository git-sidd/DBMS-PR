Here’s how to create the `emp` table with the specified fields and constraints, insert data, create an index, and create a view in MySQL.

### Step 1: Create the `emp` Table

```sql
CREATE TABLE emp (
    Eno INT PRIMARY KEY AUTO_INCREMENT,
    Ename VARCHAR(255) NOT NULL,
    Address VARCHAR(255) DEFAULT 'Nashik',
    Joindate DATE,
    Salary DECIMAL(10, 2),
    Post VARCHAR(255)
) AUTO_INCREMENT = 101;
```

### Step 2: Insert Data into the `emp` Table

```sql
INSERT INTO emp (Ename, Address, Joindate, Salary, Post) VALUES
('Amit', 'Pune', '2023-01-15', 30000.00, 'Manager'),
('Sneha', 'Nashik', '2023-02-20', 25000.00, 'Developer'),
('Savita', 'Nashik', '2023-03-10', 28000.00, 'Analyst'),
('Pooja', 'Mumbai', '2023-04-05', 19000.00, 'Designer'),
('Sagar', 'Mumbai', '2023-05-15', 25000.00, 'Tester');
```

### Step 3: Create Index on the `Ename` Field

```sql
CREATE INDEX idx_ename ON emp (Ename);
```

### Step 4: Create View on Employee Table

```sql
CREATE VIEW emp_view AS
SELECT Ename, Salary
FROM emp;
```

### Explanation:

1. **Table Creation**:
   - `Eno` is set as the primary key with an auto-increment starting from 101.
   - `Ename` has a NOT NULL constraint to ensure every employee has a name.
   - `Address` has a default value of 'Nashik'.
   - `Joindate` is used to record when the employee joined.
   - `Salary` is a decimal type to store salary values.
   - `Post` is added as an additional field after the table creation.

2. **Inserting Data**:
   - Five records are inserted into the `emp` table.

3. **Creating Index**:
   - An index named `idx_ename` is created on the `Ename` field to improve query performance.

4. **Creating View**:
   - A view named `emp_view` is created to display only the `Ename` and `Salary` columns from the `emp` table.

You can execute these SQL statements in your MySQL terminal to create the table, insert data, create the index, and create the view successfully.