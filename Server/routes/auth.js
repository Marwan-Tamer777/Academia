const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/User');
const bcrypt = require('bcryptjs'); // for hashing passwords
const jwt = require('jsonwebtoken'); // for generating json web tokens
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Register a user
 * @route POST /api/users/register
 * @method POST
 * @access Public
 */
/// Register User
router.post("/register", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const requestUser = req.body.context.user;
    if (!requestUser){
        return res.status(400).json({ error: 'User data is required.' });
    }
    // validate the request
    const { error } = model.validateRegisterUser(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // check if user already exists
    let user = await model.userModel.findOne({ email: requestUser.email });
    if (user) {
        return res.status(400).json({ error: 'This User is already registered.' });
    }

    const salt = await bcrypt.genSalt(10);
    requestUser.password = await bcrypt.hash(requestUser.password, salt);

    // create user
    user = new model.userModel({
        id: requestUser.id,
        name: requestUser.name,
        assignedId: requestUser.assignedId,
        email: requestUser.email,
        password: requestUser.password,
        avatar: requestUser.avatar,
        roleCode: requestUser.roleCode
    });
    const token =await user.generateAuthToken();
    // save user
    await user.save();
    //remove password and _id from response
    const { _id, password, ...data } = user._doc;
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.registerUserVerb,
        req.body.object.objectType,
        "User Data",
        { user: { token, ...data } },
    ));
}));

/**
 *  
 * @desc Login a user
 * @route POST /api/users/login
 * @method POST
 * @access Public
 */
/// Login User
router.post("/login", asyncHandler(async (req, res) => {
    const requestUser = req.body.context.user;
    // check if user data is sent
    if (!requestUser){
        return res.status(400).json({ error: 'User data is required.' });
    }
    // validate the request
    const { error } = model.validateLoginUser(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // check if user already exists
    let user = await model.userModel.findOne({ email: requestUser.email });
    if (!user) {
        return res.status(400).json({ error: 'This User is not registered.' });
    }

    const validPassword = await bcrypt.compare(requestUser.password, user.password);
    if (!validPassword) {
        return res.status(400).json({ error: 'Invalid Password.' });
    }

    const token = user.generateAuthToken();
    // save user
    await user.save();
    //remove password and _id from response
    const { _id, password, ...data } = user._doc;
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.loginUserVerb,
        req.body.object.objectType,
        "User Data",
        { user: { token, ...data } },
    ));
}));

module.exports = router;