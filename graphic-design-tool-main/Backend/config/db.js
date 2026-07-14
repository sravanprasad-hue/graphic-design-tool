const mysql = require("mysql2/promise");
require("dotenv").config();

const db = mysql.createPool({
  host: process.env.DB_HOST || "mysql",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME || "stackly_db",
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

const connectWithRetry = async () => {
  try {
    const connection = await db.getConnection();

    console.log("MySQL Connected Successfully");

    connection.release();
  } catch (error) {
    console.error("MySQL Connection Failed:", error.message);
    console.log("Retrying MySQL connection in 5 seconds...");

    setTimeout(connectWithRetry, 5000);
  }
};

connectWithRetry();

module.exports = db;
