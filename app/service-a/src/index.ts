import express from 'express';

const app = express();
const PORT = 7000;

app.get('/', (_req, res) => {
  res.send('Hello from Service A');
});

app.listen(PORT, () => {
  console.log(`Service A is running on port ${PORT}`);
});

