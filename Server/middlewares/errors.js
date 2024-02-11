const notFound = (req, res, next) => {
    const error = new Error(`Not Found ${req.originalUrl}`);
    error.status = 404;
    res.status(error.status).json({ error: error.message });
    next(error);
};

const errorHandler = (err, req, res, next) => {
    const statusCode = res.statusCode === 200 ? 500 : res.statusCode;
    res.status(statusCode).json({ statusCode: statusCode, error: `Something went wrong: ${err.message}` });
};

module.exports = { notFound, errorHandler };