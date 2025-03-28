const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
const port = 3000;
require("dotenv").config();

// Middleware
app.use(cors());
app.use(express.json());

// Create a connection to the MariaDB database
const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER, // Replace with your MariaDB username
  password: process.env.DB_PASSWORD, // Replace with your MariaDB password
  database: process.env.DB_DATABASE, // Replace with your database name
});

// Connect to the database
db.connect((err) => {
  //Connects to the database with the provided name and password etc
  if (err) {
    console.error("Error connecting to the database:", err.stack);
    return;
  }
  console.log("Connected to the MariaDB database");
});

// Define a route to fetch data (name, speed, glide, turn, fade)
app.get("/api/discs", (req, res) => {
  db.query(
    "SELECT name, speed, glide, turn, fade, company FROM disc_table",
    (err, results) => {
      if (err) {
        res.status(500).send("Database query error");
        return;
      }
      res.json(results);
    }
  );
});

app.post("/api/discs", (req, res) => {
  const { name, speed, glide, fade, turn, company } = req.body;
  db.query(
    "INSERT INTO disc_table (name, speed, glide, turn, fade, company) VALUES (?, ?, ?, ?, ?, ?)",
    [name, speed, glide, turn, fade, company],
    (err, results) => {
      if (err) {
        console.error("Error inserting disc:" + err);
        res.status(500).send("Error inserting disc");
      } else {
        res
          .status(201)
          .json({ message: "Disc added successfully", id: results.inserId });
      }
    }
  );
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
