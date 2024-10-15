To perform the requested operations on the `orderinfo` collection in MongoDB, follow the steps below:

### Step 1: Add “Age” Field to the `orderinfo` Collection

To add the "Age" field to all documents in the `orderinfo` collection, you can use the `$set` operator in an update query.

```javascript
db.orderinfo.updateMany(
  {}, 
  { $set: { Age: null } }  // Set default value to null or any desired value
);
```

### Step 2: Create a Complex Index and Drop Duplicates

To create a complex index on the `orderinfo` collection, you can index multiple fields. For example, let's create a compound index on `cust_id` and `status`:

```javascript
db.orderinfo.createIndex({ cust_id: 1, status: 1 });
```

To drop duplicates, you can find duplicates and then delete them. Below is an example using the `aggregate` method to identify duplicates and then remove them. Here, I will assume duplicates are defined by the combination of `cust_id` and `status`.

**Find duplicates**:
```javascript
db.orderinfo.aggregate([
  {
    $group: {
      _id: { cust_id: "$cust_id", status: "$status" },
      count: { $sum: 1 }
    }
  },
  { $match: { count: { $gt: 1 } } }
]);
```

**Remove duplicates** (keep one of each duplicate):
```javascript
db.orderinfo.aggregate([
  {
    $group: {
      _id: { cust_id: "$cust_id", status: "$status" },
      ids: { $addToSet: "$_id" },
      count: { $sum: 1 }
    }
  },
  { $match: { count: { $gt: 1 } } },
  { $unwind: "$ids" },
  {
    $project: {
      _id: 0,
      ids: { $slice: ["$ids", 1, { $subtract: ["$count", 1] }] }
    }
  }
]).forEach(function(doc) {
  db.orderinfo.deleteMany({ _id: { $in: doc.ids } });
});
```

### Step 3: Display the Average Price for Each Customer Grouped by Status

You can calculate the average price for each customer grouped by status using the following aggregation query:

```javascript
db.orderinfo.aggregate([
  {
    $group: {
      _id: "$status",
      averagePrice: { $avg: "$price" }
    }
  }
]);
```

### Step 4: Change the Customer’s Name Whose Status is “B”

To update the customer's name where the status is "B", you can use the `updateMany` function:

```javascript
db.orderinfo.updateMany(
  { status: "B" },
  { $set: { cust_name: "New Name" } }  // Replace "New Name" with the desired name
);
```

### Summary of Operations
1. Added an "Age" field to all documents in the `orderinfo` collection.
2. Created a compound index on `cust_id` and `status`, and removed duplicates.
3. Calculated the average price grouped by status.
4. Updated the customer's name for those with a status of "B".

You can run these queries in your MongoDB terminal to achieve the desired results.