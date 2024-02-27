const mongoose = require('mongoose');

async function connectToDatabase() {
    try {
        await mongoose.connect(process.env.mongoURL);
        console.log('Connected to MongoDB...');
    } catch (err) {
        console.error('Could not connect to MongoDB...', err);
    }
}

module.exports = connectToDatabase;