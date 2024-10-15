Here are MongoDB queries to address the given requirements for the collections `Teachers`, `Department`, and `Students`:

### 1. Create collections and insert some sample documents

```js
// Create 'Teachers' collection and insert sample documents
db.Teachers.insertMany([
  { Tname: "Mr. A", dno: 1, Experience: 5, Salary: 12000, Date_of_Joining: new Date("2018-01-01") },
  { Tname: "Ms. B", dno: 2, Experience: 7, Salary: 15000, Date_of_Joining: new Date("2017-03-15") },
  { Tname: "Mr. C", dno: 2, Experience: 4, Salary: 9000, Date_of_Joining: new Date("2019-08-10") }
]);

// Create 'Department' collection and insert sample documents
db.Department.insertMany([
  { Dno: 1, Dname: "Computer Science" },
  { Dno: 2, Dname: "Mathematics" },
  { Dno: 3, Dname: "Physics" }
]);

// Create 'Students' collection and insert sample documents
db.Students.insertMany([
  { Sname: "John", Roll_No: 1, Class: "SE" },
  { Sname: "Jane", Roll_No: 2, Class: "FE" },
  { Sname: "xyz", Roll_No: 3, Class: "TE" },
  { Sname: "Mark", Roll_No: 5, Class: "FE" }
]);
```

### 2. Find the information about all teachers of Dno=2 and having salary greater than or equal to 10,000

```js
db.Teachers.find(
  { dno: 2, Salary: { $gte: 10000 } }
);
```

This query retrieves all teachers who belong to `dno = 2` and have a salary greater than or equal to 10,000.

### 3. Find the student information having Roll_No=2 or Sname='xyz'

```js
db.Students.find(
  { $or: [{ Roll_No: 2 }, { Sname: "xyz" }] }
);
```

This query uses the `$or` operator to find students whose `Roll_No` is 2 or whose `Sname` is `'xyz'`.

### 4. Update student name whose Roll_No=5

```js
db.Students.updateOne(
  { Roll_No: 5 },
  { $set: { Sname: "Updated Name" } }
);
```

This query updates the `Sname` of the student with `Roll_No` 5.

### 5. Delete all students whose Class is 'FE'

```js
db.Students.deleteMany(
  { Class: "FE" }
);
```

This query deletes all students who belong to the class 'FE'.

### 6. Apply index on `Students` collection

```js
db.Students.createIndex({ Roll_No: 1 });
```

This query creates an index on the `Roll_No` field in the `Students` collection to optimize search queries involving `Roll_No`.

### Explanation:
- `insertMany()` inserts multiple documents into a collection.
- The `$gte` operator is used to filter based on a salary condition (greater than or equal).
- `$or` is used to check for multiple conditions in the same query.
- `updateOne()` modifies a single document matching the condition.
- `deleteMany()` removes multiple documents that match the query condition.
- `createIndex()` creates an index to speed up queries that involve the indexed field (`Roll_No` in this case).

Let me know if you need further assistance!