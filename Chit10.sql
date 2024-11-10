Let's solve the provided queries step-by-step using MySQL. I'll start by creating the necessary tables along with constraints, inserting sample data, and then solving each query.

### **Step 1: Creating Tables with Constraints**

Here’s how we can create the required tables with appropriate constraints (Primary Key, Foreign Key, NOT NULL, etc.):

```sql
-- Creating Account table
CREATE TABLE Account (
    Acc_no INT PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(10, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating Branch table
CREATE TABLE Branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50),
    assets DECIMAL(12, 2) CHECK (assets > 0)
);

-- Creating Customer table
CREATE TABLE Customer (
    cust_name VARCHAR(50) PRIMARY KEY,
    cust_street VARCHAR(100),
    cust_city VARCHAR(50)
);

-- Creating Depositor table
CREATE TABLE Depositor (
    cust_name VARCHAR(50),
    acc_no INT,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (cust_name) REFERENCES Customer(cust_name),
    FOREIGN KEY (acc_no) REFERENCES Account(Acc_no)
);

-- Creating Loan table
CREATE TABLE Loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(50),
    amount DECIMAL(10, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating Borrower table
CREATE TABLE Borrower (
    cust_name VARCHAR(50),
    loan_no INT,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (cust_name) REFERENCES Customer(cust_name),
    FOREIGN KEY (loan_no) REFERENCES Loan(loan_no)
);
```

---

### **Step 2: Inserting Sample Data**

Let's insert dummy data into the tables to solve the queries.

```sql
-- Inserting data into Branch table
INSERT INTO Branch (branch_name, branch_city, assets) VALUES
('Akurdi', 'Pune', 5000000),
('Nigdi', 'Pune', 3000000),
('Deccan', 'Pune', 4500000);

-- Inserting data into Account table
INSERT INTO Account (Acc_no, branch_name, balance) VALUES
(101, 'Akurdi', 15000),
(102, 'Nigdi', 10000),
(103, 'Akurdi', 20000),
(104, 'Deccan', 5000);

-- Inserting data into Customer table
INSERT INTO Customer (cust_name, cust_street, cust_city) VALUES
('Rahul', 'MG Road', 'Pune'),
('Anjali', 'FC Road', 'Mumbai'),
('Deepak', 'JM Road', 'Pune'),
('Samira', 'Karve Road', 'Pune');

-- Inserting data into Depositor table
INSERT INTO Depositor (cust_name, acc_no) VALUES
('Rahul', 101),
('Anjali', 102),
('Deepak', 103);

-- Inserting data into Loan table
INSERT INTO Loan (loan_no, branch_name, amount) VALUES
(201, 'Akurdi', 18000),
(202, 'Nigdi', 12000),
(203, 'Akurdi', 8000),
(204, 'Deccan', 15000);

-- Inserting data into Borrower table
INSERT INTO Borrower (cust_name, loan_no) VALUES
('Rahul', 201),
('Anjali', 202),
('Samira', 204);
```

---

### **Step 3: Solving the Queries**

Now let's address each of the queries one by one:

**Q1. Find the names of all branches in the loan relation.**
```sql
SELECT DISTINCT branch_name FROM Loan;
```

**Q2. Find all loan numbers for loans made at Akurdi Branch with loan amount > 12000.**
```sql
SELECT loan_no FROM Loan
WHERE branch_name = 'Akurdi' AND amount > 12000;
```

**Q3. Find all customers who have a loan from the bank. Find their names, loan_no, and loan amount.**
```sql
SELECT c.cust_name, b.loan_no, l.amount
FROM Borrower b
JOIN Loan l ON b.loan_no = l.loan_no
JOIN Customer c ON b.cust_name = c.cust_name;
```

**Q4. List all customers in alphabetical order who have a loan from the Akurdi branch.**
```sql
SELECT c.cust_name
FROM Borrower b
JOIN Loan l ON b.loan_no = l.loan_no
JOIN Customer c ON b.cust_name = c.cust_name
WHERE l.branch_name = 'Akurdi'
ORDER BY c.cust_name;
```

**Q5. Find all customers who have an account or loan or both at the bank.**
```sql
SELECT DISTINCT c.cust_name
FROM Customer c
LEFT JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name;
```

**Q6. Find all customers who have both an account and a loan at the bank.**
```sql
SELECT DISTINCT c.cust_name
FROM Customer c
JOIN Depositor d ON c.cust_name = d.cust_name
JOIN Borrower b ON c.cust_name = b.cust_name;
```

**Q7. Find all customers who have an account but no loan at the bank.**
```sql
SELECT DISTINCT c.cust_name
FROM Customer c
JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name
WHERE b.loan_no IS NULL;
```

**Q8. Find the average account balance at Akurdi branch.**
```sql
SELECT AVG(balance) AS avg_balance
FROM Account
WHERE branch_name = 'Akurdi';
```

**Q9. Find the average account balance at each branch.**
```sql
SELECT branch_name, AVG(balance) AS avg_balance
FROM Account
GROUP BY branch_name;
```

**Q10. Find the number of depositors at each branch.**
```sql
SELECT a.branch_name, COUNT(DISTINCT d.cust_name) AS num_depositors
FROM Depositor d
JOIN Account a ON d.acc_no = a.Acc_no
GROUP BY a.branch_name;
```

**Q11. Find the branches where the average account balance > 12000.**
```sql
SELECT branch_name
FROM Account
GROUP BY branch_name
HAVING AVG(balance) > 12000;
```

### **Step 4: Verification**

After running these queries, you can use the following command to verify the data in each table:

```sql
SELECT * FROM Account;
SELECT * FROM Branch;
SELECT * FROM Customer;
SELECT * FROM Depositor;
SELECT * FROM Loan;
SELECT * FROM Borrower;
```

This should cover all your queries! Let me know if you have more questions.