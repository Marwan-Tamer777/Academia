const mongoose = require('mongoose');

function connectToDatabase() {
    mongoose.connect(process.env.mongoURL)
    .then(() => console.log('Connected to MongoDB...'))
    .catch(err => console.error('Could not connect to MongoDB...', err));
}

module.exports = connectToDatabase;