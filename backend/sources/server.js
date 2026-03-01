const express = require('express');
const cors = require('cors');
const logger = require('./middleware/logger');
const userRoutes = require('./routes/userRoutes');
require('dotenv').config();
const db = require('./config/db.js');

async function initDB() {
    try {
        const query = `
            CREATE TABLE IF NOT EXISTS users (
                id INT AUTO_INCREMENT PRIMARY KEY,
                username VARCHAR(50) NOT NULL,
                password VARCHAR(255) NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        `;
        await db.execute(query);
        console.log("Database initialized");
    } catch (err) {
        console.error("Error initializing database:", err);
    }
}
initDB();
const app = express();
app.use(cors());
app.use(express.json());
app.use(logger);

app.use('/api/users', userRoutes);

const PORT = process.env.PORT || 5001;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));