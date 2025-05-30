require('dotenv').config();

const port = process.env.PORT;
const greeting = process.env.GREETING;

console.log(`${greeting}, the server will run on port ${port}.`);
