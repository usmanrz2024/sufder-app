
import express from 'express';

const app = express();
const PORT = 7001;

app.get('/', (_req, res) => {
  res.send('Hello from Service B');
});

app.listen(PORT, () => {
  console.log(`Service B running on port ${PORT}`);
});