Here is a detailed step-by-step explanation of both **Indexing** and **Aggregation** in MongoDB based on your provided requirements.

---

## **Indexing in MongoDB**

### **1. Create Collection**
```js
db.createCollection("students")
```

### **2. Insert Some Documents**
```js
db.students.insertMany([
    { Rollno: 1, name: "Navin", subject: "DMSA", marks: 78 },
    { Rollno: 2, name: "Anusha", subject: "OSD", marks: 75 },
    { Rollno: 3, name: "Ravi", subject: "TOC", marks: 69 },
    { Rollno: 4, name: "Veena", subject: "TOC", marks: 70 },
    { Rollno: 5, name: "Pravini", subject: "OSD", marks: 80 },
    { Rollno: 6, name: "Reena", subject: "DMSA", marks: 50 },
    { Rollno: 7, name: "Geeta", subject: "CN", marks: 90 },
    { Rollno: 8, name: "Akash", subject: "CN", marks: 85 }
]);
```

### **3. Create Single Index**
- **Single Index on `subject` field:**
```js
db.students.createIndex({ subject: 1 });
```

### **4. Create Compound Index**
- **Compound Index on `name` and `marks` fields:**
```js
db.students.createIndex({ name: 1, marks: -1 });
```

### **5. Create Unique Index**
- **Unique Index on `Rollno` field:**
```js
db.students.createIndex({ Rollno: 1 }, { unique: true });
```

### **6. Show Index Information**
```js
db.students.getIndexes();
```

### **7. Remove Index**
- **Remove the index on `subject`:**
```js
db.students.dropIndex("subject_1");
```

---

## **Aggregation in MongoDB**

Assuming the same **students** collection.

### **1. Max Marks of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", maxMarks: { $max: "$marks" } } }
]);
```

### **2. Min Marks of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", minMarks: { $min: "$marks" } } }
]);
```

### **3. Sum of Marks of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", totalMarks: { $sum: "$marks" } } }
]);
```

### **4. Avg Marks of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", avgMarks: { $avg: "$marks" } } }
]);
```

### **5. First Record of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", firstRecord: { $first: "$$ROOT" } } }
]);
```

### **6. Last Record of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", lastRecord: { $last: "$$ROOT" } } }
]);
```

### **7. Count of Records of Each Subject**
```js
db.students.aggregate([
    { $group: { _id: "$subject", count: { $sum: 1 } } }
]);
```

---

## **MapReduce Example (for context of `orderinfo`)**

### **1. MapReduce for Finding Max Price of Each Customer (using collection `orderinfo`)**

**Map Function:**
```js
var mapCustomer = function() {
  emit(this.cust_id, this.price);
};
```

**Reduce Function:**
```js
var reducePrice = function(cust_id, prices) {
  return Math.max.apply(Math, prices);
};
```

**Executing the MapReduce:**
```js
db.orderinfo.mapReduce(
  mapCustomer,
  reducePrice,
  { out: "max_price_per_customer" }
);
```

**Find Result:**
```js
db.max_price_per_customer.find();
```

---

This should provide you with a thorough guide to MongoDB's indexing and aggregation functionalities for the collection you are working with. Let me know if you'd like more detailed explanations for any specific query!