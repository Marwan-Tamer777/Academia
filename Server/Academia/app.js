const express = require('express');
const logger = require('./middlewares/logger');
const errorHandler = require('./middlewares/errors');
const connectToDB = require('./config/db');
const functions = require('./utilities/functions');

/// Load .env
require('dotenv').config();

/// Initialize express
const app = express();

/// Applying middleware
app.use(express.json());

/// Routes
app.use(logger);
app.use(process.env.coursesURL, require('./routes/courses'));
app.use(process.env.usersURL, require('./routes/users'));
app.use(process.env.authURL, require('./routes/auth'));
app.use(process.env.commentsURL, require('./routes/comments'));
app.use(process.env.materialsURL, require('./routes/materials'));
app.use(process.env.postsURL, require('./routes/posts'));
app.use(process.env.privilegesURL, require('./routes/privileges'));
app.use(process.env.quizQuestionsURL, require('./routes/questions'));
app.use(process.env.quizzesURL, require('./routes/quizzes'));
app.use(process.env.rolesURL, require('./routes/roles'));
app.use(process.env.tagsURL, require('./routes/tags'));
app.use(process.env.courseRolesURL, require('./routes/course_roles'));
// app.use(process.env.privilegeMapURL, require('./routes/privilege_map'));
app.use(process.env.ticketsURL, require('./routes/tickets'));
app.use(process.env.courseUserInfoURL, require('./routes/course_user_info'));
app.use(process.env.coursePollURL, require('./routes/course_poll'));
app.use(process.env.assignmentsURL, require('./routes/assignment'));
app.use(process.env.statementsURL, require('./routes/statement'));
app.use(process.env.actionMapURL, require('./routes/action_map'));
app.use(process.env.materialMapURL, require('./routes/material_map'));
app.use(process.env.quizUserInfoURL, require('./routes/quiz_user_info'));
app.use(process.env.assignmentUserInfoURL, require('./routes/assignment_user_info'));




/// Handling Routes Errors
//Not Found Error
//app.use(errorHandler.notFound);

//Internal Server Error
//app.use(errorHandler.errorHandler);


/// Connect to MongoDB
connectToDB();

/// Run server
app.listen(process.env.PORT || 8080, () => console.log(`Running in ${process.env.NODE_ENV} mode,\nListening on port ${process.env.PORT || 8080}...`));

/// Get Home
app.get('/', (req, res) => {
    res.json('Welcome to Academia API');
});


// const server = http.createServer((req, res) => {
//     if (req.url === '/') {
//         res.write("<h1>Hello World</h1>");
//         res.end();
//     }

//     if (req.url === apiURL) {
//         res.write(JSON.stringify(courses));
//         res.end();
//     }
// });


// server.listen(port, () => console.log(`Server is running on port ${port}`));

///HTTP Status Codes
// 200 OK
// 201 Created
// 400 Bad Request
// 404 Not Found
// 500 Internal Server Error
