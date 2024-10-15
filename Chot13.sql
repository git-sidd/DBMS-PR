Here are the MongoDB queries to perform the requested operations on the `movies` collection:

### 1. Find the name of the movie having a budget greater than 1,00,000:

```js
db.movies.find(
  { budget: { $gt: 100000 } },
  { name: 1, _id: 0 }
);
```

This query retrieves the `name` of the movies with a budget greater than `1,00,000`.

### 2. Find the name of the producer who lives in Pune:

```js
db.movies.find(
  { "producer.address": "PUNE" },
  { "producer.name": 1, _id: 0 }
);
```

This query looks for the documents where the producer's address is `"PUNE"` and returns the `name` of the producer.

### 3. Update the type of movie from “action” to “horror”:

```js
db.movies.updateMany(
  { type: "action" },
  { $set: { type: "horror" } }
);
```

This query updates the `type` field from `"action"` to `"horror"` for all matching documents.

### 4. Find all the documents produced by "producer1" with their address:

```js
db.movies.find(
  { "producer.name": "producer1" },
  { name: 1, "producer.address": 1, _id: 0 }
);
```

This query retrieves all documents where the producer's name is `"producer1"` and includes both the movie name and producer's address.

### Explanation:
- The `find()` method is used to retrieve documents based on the query condition.
- The `$gt` operator is used to find values greater than a specific number (in this case, budget).
- The `updateMany()` method is used to update multiple documents.
- The query projection `{ name: 1, _id: 0 }` ensures that only the `name` field is returned and the `_id` field is excluded.

You can execute these queries directly in the MongoDB terminal (`mongo shell`). Let me know if you need further assistance!