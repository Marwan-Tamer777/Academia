const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Privilege');
const statementModel = require('../models/Statement');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Create a privilege
 * @route POST /api/privileges
 * @method POST
 * @access Public
 */
/// Create Privilege
router.post("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the privilege data
    const requestPrivilege = req.body.context.privilege;
    if (!requestPrivilege) {
        return res.status(400).json({ error: 'Privilege is Required.' });
    }

    // validate the request
    const { error } = model.validateCreatePrivilege(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // create privilege
    const privilege = new model.privilegeModel(requestPrivilege);

    // save privilege
    await privilege.save();

    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createPrivilegeVerb,
        req.body.object.objectType,
        "Privilege Data",
        { privilege: privilege },
        privilege._id
    ));
}));

/**
 * @desc Get all privileges
 * @route GET /api/privileges
 * @method GET
 * @access Public
 */
/// Get All Privileges
router.get("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const privileges = await model.privilegeModel.find();
    res.status(200).json(privileges);
}));

/**
 * @desc Get a privilege by ID
 * @route GET /api/privileges/:id
 * @method GET
 * @access Public
 */
/// Get Privilege by ID
router.get(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const privilege = await model.privilegeModel.findById(req.params.id);
    if (!privilege) {
        return res.status(404).json({ error: 'The privilege with the given ID was not found' });
    }
    res.status(200).json(privilege);
}));

/**
 * @desc Update a privilege
 * @route PUT /api/privileges/:id
 * @method PUT
 * @access Public
 */
/// Update Privilege
router.put(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    //  validate the privilege data
    const requestPrivilege = req.body.context.privilege;
    if (!requestPrivilege) {
        return res.status(400).json({ error: 'Privilege is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdatePrivilege(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // update privilege
    const privilege = await model.privilegeModel.findByIdAndUpdate(req.params.id, {
        description: requestPrivilege.description
    }, { new: true });
    if (!privilege) {
        return res.status(404).json({ error: 'The privilege with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updatePrivilegeVerb,
        req.body.object.objectType,
        "Privilege Data",
        { privilege },
        privilege._id
    ));
}));

/**
 * @desc Delete a privilege
 * @route DELETE /api/privileges/:id
 * @method DELETE
 * @access Public
 */
/// Delete Privilege
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const privilege = await model.privilegeModel.findByIdAndDelete(req.params.id);
    if (!privilege) {
        return res.status(404).json({ error: 'The privilege with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deletePrivilegeVerb,
        req.body.object.objectType,
        "Privilege Data",
        { privilege },
        privilege._id
    ));
}));

module.exports = router;