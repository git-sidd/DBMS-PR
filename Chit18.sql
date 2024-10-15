To perform the operations using MapReduce in MongoDB, let's assume you have a `city` collection with documents like the one you've shared. Below are the queries for statewise, citywise, and typewise population calculations using the MapReduce framework.

### 1. **Statewise Population Calculation Using MapReduce**

**Map Function:**
This function will map each document by its `state` and emit the population for each state.
```js
var mapState = function() {
  emit(this.state, parseInt(this.population));
};
```

**Reduce Function:**
The reduce function will sum up the populations for each state.
```js
var reducePopulation = function(state, populations) {
  return Array.sum(populations);
};
```

**Executing the MapReduce:**
```js
db.city.mapReduce(
  mapState,
  reducePopulation,
  { out: "statewise_population" }
);

// To display the results:
db.statewise_population.find();
```

### 2. **Citywise Population Calculation Using MapReduce**

**Map Function:**
This function maps each document by its `city` and emits the population for each city.
```js
var mapCity = function() {
  emit(this.city, parseInt(this.population));
};
```

**Reduce Function:**
The reduce function will sum up the populations for each city.
```js
var reducePopulation = function(city, populations) {
  return Array.sum(populations);
};
```

**Executing the MapReduce:**
```js
db.city.mapReduce(
  mapCity,
  reducePopulation,
  { out: "citywise_population" }
);

// To display the results:
db.citywise_population.find();
```

### 3. **Typewise Population Calculation Using MapReduce**

**Map Function:**
This function maps each document by its `type` (e.g., urban or rural) and emits the population for each type.
```js
var mapType = function() {
  emit(this.type, parseInt(this.population));
};
```

**Reduce Function:**
The reduce function will sum up the populations for each type.
```js
var reducePopulation = function(type, populations) {
  return Array.sum(populations);
};
```

**Executing the MapReduce:**
```js
db.city.mapReduce(
  mapType,
  reducePopulation,
  { out: "typewise_population" }
);

// To display the results:
db.typewise_population.find();
```

### Explanation:
1. **`map` function:** It emits the key (state, city, or type) and the value (population) for each document.
2. **`reduce` function:** It aggregates the population for each key by summing the values.
3. **`mapReduce` execution:** It runs the MapReduce operation on the `city` collection, and the output is stored in new collections (`statewise_population`, `citywise_population`, `typewise_population`).

These queries provide efficient aggregation of population data based on state, city, or type using MapReduce in MongoDB.