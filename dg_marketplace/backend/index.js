const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
require("dotenv").config();

console.log("Connecting with config:", {
  host: "localhost",
  user: "root",
  password: "Andreas123",
  database: "disc_info",
});

const app = express();
const port = 3000;

// Middleware
app.use(cors()); // Allow all origins
app.use(express.json()); // Parse JSON bodies

// Database connection using environment variables
const db = mysql.createConnection({
  host: process.env.DB_HOST, // e.g. "192.168.1.42" — not "localhost"
  user: process.env.DB_USER, // e.g. "dguser"
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE, // Use environment variable or default to "disc_info"
});

// Connect to DB
db.connect((err) => {
  if (err) {
    console.error("❌ DB connection error:", err.stack);
    return;
  }
  console.log("✅ Connected to MariaDB");
});

// GET route to fetch all discs
app.get("/api/discs", (req, res) => {
  db.query("SELECT * FROM disc_table;", (err, results) => {
    if (err) {
      console.error("❌ Query error:", err);
      return res.status(500).send("Database query error");
    }
    res.json(results);
  });
});

// POST route to add a disc
app.post("/api/discs", (req, res) => {
  const { name, speed, glide, fade, turn, company } = req.body;

  // Validate input
  if (
    !name ||
    speed === undefined ||
    glide === undefined ||
    fade === undefined ||
    turn === undefined
  ) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  db.query(
    "INSERT INTO disc_table (name, speed, glide, turn, fade, company) VALUES (?, ?, ?, ?, ?, ?)",
    [name, speed, glide, turn, fade, company || null],
    (err, results) => {
      if (err) {
        console.error("❌ Insert error:", err);
        return res.status(500).json({
          error: "Error inserting disc",
          details: err.message,
        });
      }

      res.status(201).json({
        message: "✅ Disc added successfully",
        id: results.insertId,
      });
    }
  );
});

// Start the server on all interfaces
app.listen(port, "0.0.0.0", () => {
  console.log(`🚀 Server running at http://0.0.0.0:${port}`);
});
