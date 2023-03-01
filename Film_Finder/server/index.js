import express from "express"

// Express Setup
const app = express();
const PORT = 4989;

// Database
const db = require('./db-connector');


// Listener
app.listen(PORT, () => { 
    console.log("Running on port " + PORT) 
});