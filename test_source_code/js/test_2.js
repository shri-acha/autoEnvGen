require('dotenv').config();

const host =  process.env.HOST;
const username = process.env.USERNAME;

console.log(`${host}, the server will run on port ${username}.`);
