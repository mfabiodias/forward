const express = require('express');
const app = express();
const port = process.env.PORT || 4000;

// ok

app.get('*', (req, res) => {
  console.log(req.method, req.path);
  console.log(req.headers);
  res.send();
});

app.post('*', (req, res) => {
  console.log(req.method, req.path);
  console.log(req.headers);
  res.send();
});

app.options('*', (req, res) => {
  console.log(req.method, req.path);
  console.log(req.headers);
  res.send();
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});
