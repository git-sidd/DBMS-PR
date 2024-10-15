To perform the specified queries on a MongoDB collection called `orderinfo`, you can use the following MongoDB shell commands. 

### Sample Document Structure

Assuming your documents in the `orderinfo` collection look something like this:

```json
{
    "cust_id": 123,
    "cust_name": "abc",
    "status": "A",
    "price": 250
}
```

### i. Find the average price for each customer having status 'A'

```javascript
db.orderinfo.aggregate([
    { $match: { status: 'A' } },
    { $group: { _id: "$cust_id", avgPrice: { $avg: "$price" } } }
]);
```

### ii. Display the status of the customers whose amount/price lies between 100 and 1000

```javascript
db.orderinfo.find(
    { price: { $gte: 100, $lte: 1000 } },
    { status: 1, _id: 0 }
);
```

### iii. Display the customers' information without “_id”

```javascript
db.orderinfo.find(
    {},
    { _id: 0 }
);
```

### iv. Create a simple index on `orderinfo` collection and fire the queries

#### Create Index

```javascript
db.orderinfo.createIndex({ price: 1 });
```

#### Fire the Queries Again After Creating the Index

1. **Find the average price for each customer having status 'A'**:
   ```javascript
   db.orderinfo.aggregate([
       { $match: { status: 'A' } },
       { $group: { _id: "$cust_id", avgPrice: { $avg: "$price" } } }
   ]);
   ```

2. **Display the status of the customers whose amount/price lies between 100 and 1000**:
   ```javascript
   db.orderinfo.find(
       { price: { $gte: 100, $lte: 1000 } },
       { status: 1, _id: 0 }
   );
   ```

3. **Display the customers' information without “_id”**:
   ```javascript
   db.orderinfo.find(
       {},
       { _id: 0 }
   );
   ```

### Summary

- **Aggregation pipeline** is used for calculating the average price of customers with status 'A'.
- **Find query** retrieves customers within a specified price range and only displays their status.
- **Find query** without the `_id` field displays customer information.
- An index is created on the `price` field to improve the performance of the queries that filter based on price. 

You can execute these commands in the MongoDB shell (mongo terminal) for your `orderinfo` collection.