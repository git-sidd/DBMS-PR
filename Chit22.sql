Here are the steps to perform the requested operations on the `orderinfo` collection in MongoDB:

### Step 1: Create the `orderinfo` Collection and Insert Documents

First, let's create the collection and insert the initial document:

```javascript
// Use or create the database
use myDatabase;

// Create the 'orderinfo' collection and insert a document
db.orderinfo.insertOne({
    cust_id: 123,
    cust_name: "abc",
    status: "A",
    price: 250
});
```

### Step 2: Perform the Required Operations

#### i. Display the name of the customer having the price between 250 and 450

```javascript
// Find customer names with price between 250 and 450
db.orderinfo.find(
    { price: { $gte: 250, $lte: 450 } },
    { cust_name: 1, _id: 0 } // Show only cust_name, exclude _id
);
```

#### ii. Increment the price by 10 for `cust_id: 123` and decrement the price by 5 for `cust_id: 124`

```javascript
// Increment the price by 10 for cust_id: 123
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $inc: { price: 10 } } // Increase price by 10
);

// Decrement the price by 5 for cust_id: 124
db.orderinfo.updateOne(
    { cust_id: 124 },
    { $inc: { price: -5 } } // Decrease price by 5
);
```

**Note:** Since we have only inserted one document, the second operation for `cust_id: 124` will not affect any document. You may want to add a document with `cust_id: 124` for testing purposes.

```javascript
// Add a new document for cust_id: 124 for testing
db.orderinfo.insertOne({
    cust_id: 124,
    cust_name: "xyz",
    status: "B",
    price: 300
});
```

#### iii. Remove any one of the fields from the `orderinfo` collection

To remove a field, you can use the `$unset` operator. For example, if we want to remove the `status` field:

```javascript
// Remove the 'status' field from the document with cust_id: 123
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $unset: { status: "" } } // Remove status field
);
```

#### iv. Find the name of the customer whose status is either "A" or price is 250 or both

Since we removed the `status` field from the previous step, let's first add it back to demonstrate the query. If you wish, you can reinsert or update the document accordingly.

```javascript
// Re-add the status field if it was removed
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $set: { status: "A" } }
);

// Find customer names with status "A" or price 250 or both
db.orderinfo.find(
    { $or: [{ status: "A" }, { price: 250 }] },
    { cust_name: 1, _id: 0 } // Show only cust_name, exclude _id
);
```

### Summary of Commands

Here’s a summary of all the commands in one go:

```javascript
// Create database and collection
use myDatabase;

db.orderinfo.insertOne({
    cust_id: 123,
    cust_name: "abc",
    status: "A",
    price: 250
});

// 1. Display the name of the customer having the price between 250 and 450
db.orderinfo.find(
    { price: { $gte: 250, $lte: 450 } },
    { cust_name: 1, _id: 0 }
);

// 2. Increment the price by 10 for cust_id: 123
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $inc: { price: 10 } }
);

// Add cust_id: 124 for demonstration
db.orderinfo.insertOne({
    cust_id: 124,
    cust_name: "xyz",
    status: "B",
    price: 300
});

// Decrement the price by 5 for cust_id: 124
db.orderinfo.updateOne(
    { cust_id: 124 },
    { $inc: { price: -5 } }
);

// 3. Remove the 'status' field from cust_id: 123
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $unset: { status: "" } }
);

// Re-add the status field if it was removed
db.orderinfo.updateOne(
    { cust_id: 123 },
    { $set: { status: "A" } }
);

// 4. Find the name of the customer whose status is "A" or price is 250
db.orderinfo.find(
    { $or: [{ status: "A" }, { price: 250 }] },
    { cust_name: 1, _id: 0 }
);
```

This will cover all the specified operations on the `orderinfo` collection. Let me know if you need further assistance!