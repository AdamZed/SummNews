const express = require('express');
const app = express();

app.use((req, res, next) => {
  console.log(`Request: ${req}`);
  console.log(`Response: ${res}`);
  next();
})

app.get('/', (req, res) => {
  res.send("hello world");
})

app.listen(3000, () => {
  console.log("App listening on port 3000!");
})