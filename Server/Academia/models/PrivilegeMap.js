const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// PrivilegeMap Schema
const privilegeMapSchema = new mongoose.Schema({
    _id: {
        type: String,
        default: uuidv4,
        unique: true,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    privilegeCode: {
        type: Number,
        required: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'PrivilegeMap',
});

/// PrivilegeMap Model
const privilegeMap = mongoose.model('PrivilegeMap', privilegeMapSchema);

/// Validate PrivilegeMap
function validateCreatePrivilegeMap(privilegeMap) {
    const schema = Joi.object({
        courseId: Joi.string().required(),
        privilegeCode: Joi.number().required(),
        description: Joi.string().required(),
    });

    return schema.validate(privilegeMap);
}

function validateUpdatePrivilegeMap(privilegeMap) {
    const schema = Joi.object({
        courseId: Joi.string(),
        privilegeCode: Joi.number(),
        description: Joi.string(),
    });

    return schema.validate(privilegeMap);
}

/// PrivilegeMap Verbs
const createPrivilegeMapVerb = {
    "id-enum": "create-privilege-map",
    display: {
        "en-US": "Created Privilege Map"
    }
};

const updatePrivilegeMapVerb = {
    "id-enum": "update-privilege-map",
    display: {
        "en-US": "Updated Privilege Map"
    }
};

const deletePrivilegeMapVerb = {
    "id-enum": "delete-privilege-map",
    display: {
        "en-US": "Deleted Privilege Map"
    }
};

module.exports.privilegeMap = {
    privilegeMap,
    validateCreatePrivilegeMap,
    validateUpdatePrivilegeMap,
    createPrivilegeMapVerb,
    updatePrivilegeMapVerb,
    deletePrivilegeMapVerb

};
