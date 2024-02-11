/// Routes
app.use(logger);
app.use(process.env.coursesURL, coursesPath);
app.use(process.env.usersURL, usersPath);
app.use(process.env.authURL, authPath);
app.use(process.env.commentsURL, commentsPath);
app.use(process.env.materialsURL, materialsPath);
app.use(process.env.postsURL, postsPath);
app.use(process.env.privilegesURL, privilegesPath);
app.use(process.env.quizQuestionsURL, quizQuestionsPath);
app.use(process.env.quizzesURL, quizzesPath);
app.use(process.env.rolesURL, rolesPath);
app.use(process.env.tagsURL, tagsPath);


