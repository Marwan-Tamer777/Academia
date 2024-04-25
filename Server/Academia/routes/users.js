const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/User');
const bcrypt = require('bcryptjs'); // for hashing passwords
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Get all users
 * @route GET /api/users
 * @method GET
 * @access Private/Admin
 */
/// Get All Users
router.get("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const users = await model.userModel.find().select('-password');
    res.status(200).json(users);
}));

/**
 * @desc Get a user by ID
 * @route GET /api/users/:id
 * @method GET
 * @access Public
 */
/// Get User by ID
router.get(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const user = await model.userModel.findById(req.params.id).select('-password');
    if (!user) {
        return res.status(404).json({ error: 'The user with the given ID was not found' });
    }
    res.status(200).json(user);
}));

// /**
//  *  
//  * @desc Create a user
//  * @route POST /api/users
//  * @method POST
//  * @access Public
//  */
// /// Create User
// router.post("/", asyncHandler(async (req, res) => {
//     // validate the request
//     const { error } = model.validateCreateUser(req.body);
//     if (error) {
//         return res.status(400).json({ error: error.details[0].message });
//     }
//     // create user
//     const user = new model.userModel({
//         name: req.body.name,
//         email: req.body.email,
//         password: req.body.password,
//         isAdmin: req.body.isAdmin
//     });
//     // save user
//     await user.save();
//     res.status(201).json(user);
// }));

/**
 *  
 * @desc Update a user
 * @route PUT /api/users/:id
 * @method PUT
 * @access Private/Admin
 */
/// Update User
router.put("/:id", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const requestUser = req.body.context.user;
    if (!requestUser) {
        return res.status(400).json({ error: 'User data is required.' });
    }
    // validate the request
    const { error } = model.validateUpdateUser(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // hash new password
    if (requestUser.password) {
        const salt = await bcrypt.genSalt(10);
        requestUser.password = await bcrypt.hash(requestUser.password, salt);
    }

    // update user
    const updatedUser = await model.userModel.findByIdAndUpdate(req.params.id, requestUser, {
        new: true // return the updated document
    }).select('-password');// remove password from response
    if (!updatedUser) {
        return res.status(404).json({ error: 'The user with the given ID was not found' });
    }

    // save user
    await updatedUser.save();
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateUserVerb,
        req.body.object.objectType,
        "User Data",
        { user: updatedUser },
    ));
}));

/**
 *  
 * @desc Delete a user
 * @route DELETE /api/users/:id
 * @method DELETE
 * @access Public
 */
/// Delete User
router.delete("/:id", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // find the user
    const user = await model.userModel.findByIdAndDelete(req.params.id).select('-password');
    if (!user) {
        return res.status(404).json({ error: 'The user with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteUserVerb,
        req.body.object.objectType,
        "User Data",
        { user: user },
    ));
})); 



// search course by name or course code 
router.post("/search", asyncHandler(async (req, res) => {
    const search = req.body.search;
    const user = await model.userModel.find({
        $or: [
            { email: { $regex: search, $options: 'i' } },
            { id: { $regex: search, $options: 'i' } }
        ]
    });
    res.status(200).json(courses);
})); 

// get all courses in the ids list 
router.post("/ids", asyncHandler(async (req, res) => {
    const ids = req.body.ids;
    const users = await model.userModel.find({
        _id: { $in: ids }
    });
    res.status(200).json(users);
}));

// get all users for a course 
router.post("/course/:id", asyncHandler(async (req, res) => {
    const courseId = req.params.id;
    const users = await model.userModel.find({
        courses: courseId
    });
    res.status(200).json(users);
}));




module.exports = router; 



