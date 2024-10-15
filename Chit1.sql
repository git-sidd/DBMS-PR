Here are the MySQL queries based on the provided table structure:

### 1. Show the `cname`, `Acc_Type`, and `Amount` of customers who have a saving account:

```sql
SELECT C.cname, A.Acc_Type, A.Amount
FROM Customer AS C
JOIN Account AS A
ON C.C_Id = A.C_Id
WHERE A.Acc_Type = 'Saving';
```

### 2. Display the data using Natural, Left, and Right join:

#### a) **Natural Join**:
```sql
SELECT cname, Acc_Type, Amount
FROM Customer
NATURAL JOIN Account
WHERE Acc_Type = 'Saving';
```

#### b) **Left Join**:
```sql
SELECT C.cname, A.Acc_Type, A.Amount
FROM Customer AS C
LEFT JOIN Account AS A
ON C.C_Id = A.C_Id;
```

#### c) **Right Join**:
```sql
SELECT C.cname, A.Acc_Type, A.Amount
FROM Customer AS C
RIGHT JOIN Account AS A
ON C.C_Id = A.C_Id;
```

### 3. Display the information of customers living in the same city as ‘Pooja’:

```sql
SELECT *
FROM Customer
WHERE City = (SELECT City FROM Customer WHERE Cname = 'Pooja');
```

### 4. Display the information of accounts having less amount than the average amount throughout the bank:

```sql
SELECT *
FROM Account
WHERE Amount < (SELECT AVG(Amount) FROM Account);
```

### 5. Display the `C_Id` having the maximum amount in account:

```sql
SELECT C_Id
FROM Account
WHERE Amount = (SELECT MAX(Amount) FROM Account);
```

### 6. Display the amount and `Acc_Type` of those customers whose amount is the minimum for that `Acc_Type`:

```sql
SELECT Acc_Type, MIN(Amount) AS Min_Amount
FROM Account
GROUP BY Acc_Type;
```

### 7. Display the amount of those accounts whose amount is higher than any saving account amount:

```sql
SELECT Amount
FROM Account
WHERE Amount > (SELECT MIN(Amount) FROM Account WHERE Acc_Type = 'Saving');
```

These queries should help you retrieve the required information based on the provided tables and conditions.