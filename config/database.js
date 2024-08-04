// Import the pg library
const { Pool } = require('pg');

// Load environment variables from .env file
require('dotenv').config();

// Configure the connection pool
const pool = new Pool({
  user: 'postgres', // default username
  host: 'localhost', // default host
  database: 'postgres', // default database name
  password: 'postgres', // default password
  port: 5432, // default port
});

// Handle connection errors
pool.on('error', (err, client) => {
  console.error('Unexpected error on idle PostgreSQL client', err);
  process.exit(-1);
});

// Export a function to query the database
module.exports = {
  query: (text, params) => pool.query(text, params),
  getClient: () => pool.connect(),
};
