const mongoose = require('mongoose');

async function connectToDatabase() {
    try {
        /// For Testing (comment this line when testing is done)
        await mongoose.connect(process.env.mongoURLTest);
        /// For Production (uncomment this line when testing is done)
        // await mongoose.connect(process.env.mongoURL);
        console.log('Connected to MongoDB...');
    } catch (err) {
        console.error('Could not connect to MongoDB...', err);
    }
}

module.exports = connectToDatabase;