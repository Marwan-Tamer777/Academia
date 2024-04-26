const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Role');
const courseModel = require('../models/Course');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Create a role
 * @route POST /api/roles
 * @method POST
 * @access Public
 */
/// Create Role
router.post("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {

    // validate the role data
    const requestRole = req.body.context.role;
    if (!requestRole) {
        return res.status(400).json({ error: 'Role Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateRole(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if course exists
    let course = await courseModel.courseModel.findById( requestRole.courseId );
    if (!course) {
        return res.status(400).json({ error: 'The course with the given ID was not found' });
    }

    // create role
    const role = new model.roleModel(requestRole);

    // save role
    await role.save();

    // update course with role
    course.roles.push(role.id);
    await course.save();

    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createRoleVerb,
        req.body.object.objectType,
        "Role Data",
        { role: role },
    ));
}));

/**
 * @desc Get all roles
 * @route GET /api/roles
 * @method GET
 * @access Public
 */
/// Get All Roles
router.get("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const roles = await model.roleModel.find();
    res.status(200).json(roles);
}));

/**
 * @desc Get a role by ID
 * @route GET /api/roles/:id
 * @method GET
 * @access Public
 */
/// Get Role by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const role = await model.roleModel.findById( req.params.id );
    if (!role) {
        return res.status(404).json({ error: 'The role with the given ID was not found' });
    }
    res.status(200).json(role);
}));

/**
 * @desc Update a role
 * @route PUT /api/roles/:id
 * @method PUT
 * @access Public
 */
/// Update Role
router.put(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the role data
    const requestRole = req.body.context.role;
    if (!requestRole) {
        return res.status(400).json({ error: 'Role Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateRole(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // update role
    const role = await model.roleModel.findByIdAndUpdate( req.params.id , {
        roleName: requestRole.roleName,
        roleCode: requestRole.roleCode,
        level: requestRole.level,
        privileges: requestRole.privileges,
        description: requestRole.description
    }, { new: true });
    if (!role) {
        return res.status(404).json({ error: 'The role with the given ID was not found' });
    }

    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateRoleVerb,
        req.body.object.objectType,
        "Role Data",
        { role: role },
    ));
}));

/**
 * @desc Delete a role
 * @route DELETE /api/roles/:id
 * @method DELETE
 * @access Public
 */
/// Delete Role
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const role = await model.roleModel.findByIdAndDelete( req.params.id );
    if (!role) {
        return res.status(404).json({ error: 'The role with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteRoleVerb,
        req.body.object.objectType,
        "Role Data",
        { role: role },
    ));
}));

module.exports = router;