const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Create a connection to the MariaDB database
const db = mysql.createConnection({
  host: "localhost",
  user: "your_username", // Replace with your MariaDB username
  password: "your_password", // Replace with your MariaDB password
  database: "your_database", // Replace with your database name
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error("Error connecting to the database:", err.stack);
    return;
  }
  console.log("Connected to the MariaDB database");
});

// Define a route to fetch data (name, speed, glide, turn, fade)
app.get("/api/discs", (req, res) => {
  db.query(
    "SELECT name, speed, glide, turn, fade FROM disc_table",
    (err, results) => {
      if (err) {
        res.status(500).send("Database query error");
        return;
      }
      res.json(results);
    }
  );
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
