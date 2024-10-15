Here's how to perform aggregation and indexing using MongoDB on the `department` database with the `teacher` collection:

### 1. Create a Database `department`
```js
use department;
```

### 2. Create a Collection `teacher` and Insert Documents
```js
db.teacher.insertMany([
  { name: "John", department: "Computer", experience: 5, salary: 50000 },
  { name: "Amit", department: "Math", experience: 10, salary: 60000 },
  { name: "Priya", department: "Computer", experience: 3, salary: 45000 },
  { name: "Anil", department: "Physics", experience: 7, salary: 55000 },
  { name: "Ravi", department: "Math", experience: 12, salary: 65000 },
  { name: "Neha", department: "Physics", experience: 8, salary: 58000 },
  { name: "Sneha", department: "Computer", experience: 9, salary: 70000 }
]);
```

### 3. Display Department-Wise Average Salary
You can use the MongoDB aggregation framework to calculate the average salary for each department.

```js
db.teacher.aggregate([
  { $group: { _id: "$department", avgSalary: { $avg: "$salary" } } }
]);
```

### 4. Display the Number of Employees Working in Each Department
This query will count the number of employees (teachers) per department.

```js
db.teacher.aggregate([
  { $group: { _id: "$department", employeeCount: { $sum: 1 } } }
]);
```

### 5. Display Department-Wise Minimum Salary
To get the minimum salary for each department:

```js
db.teacher.aggregate([
  { $group: { _id: "$department", minSalary: { $min: "$salary" } } }
]);
```

### 6. Apply Index on `department` Field
Creating an index on the `department` field will optimize queries related to department-wise search.

```js
db.teacher.createIndex({ department: 1 });
```

### 7. Drop the Index
To drop the created index on `department`:

```js
db.teacher.dropIndex({ department: 1 });
```

### Summary of Operations:
1. Created the `department` database.
2. Created the `teacher` collection with fields like `name`, `department`, `experience`, and `salary`.
3. Used the aggregation framework to display:
   - Department-wise average salary.
   - Number of employees in each department.
   - Department-wise minimum salary.
4. Applied and then dropped an index on the `department` field to optimize and later revert database performance.

These operations provide key insights into the data while demonstrating how to optimize and manage queries with indexing in MongoDB.