const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Role Schema
const roleSchema = new mongoose.Schema({
    id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    roleName: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
    },
    roleCode: {
        type: Number,
        required: true,
        unique: true,
    },
    level: {
        type: Number,
        required: true,
        min: 0,
    },
    privileges: {
        type: [String],
        default: [],
    },
    description: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
    },
}, {
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
});

/// Role Model
const roleModel = mongoose.model('Role', roleSchema);

/// Role Validation
function validateCreateRole(role) {
    const schema = Joi.object({
        actor: {
            name: Joi.string().trim().min(1).required(),
            id: Joi.string().trim().min(1).required(),
        },
        verb: {
            "id-enum": Joi.string().trim().min(1).required(),
            display: {
                "en-US": Joi.string().trim().min(1).required()
            }
        },
        object: {
            id: Joi.string().trim().min(1).required(),
            objectType: Joi.string().trim().min(1).required(),
            definition: {
                name: {
                    "en-US": Joi.string().trim().min(1).required()
                }
            }
        },
        context: {
            role: {
                courseId: Joi.string().trim().min(1).required(),
                roleName: Joi.string().min(1),
                roleCode: Joi.number().required(),
                level: Joi.number().required(),
                privileges: Joi.array().items(Joi.string().min(1)).default([]),
                description: Joi.string().min(1),
            }
        }
    });
    return schema.validate(role);
}

function validateUpdateRole(role) {
    const schema = Joi.object({
        actor: {
            name: Joi.string().trim().min(1).required(),
            id: Joi.string().trim().min(1).required(),
        },
        verb: {
            "id-enum": Joi.string().trim().min(1).required(),
            display: {
                "en-US": Joi.string().trim().min(1).required()
            }
        },
        object: {
            id: Joi.string().trim().min(1).required(),
            objectType: Joi.string().trim().min(1).required(),
            definition: {
                name: {
                    "en-US": Joi.string().trim().min(1).required()
                }
            }
        },
        context: {
            role: {
                roleName: Joi.string().min(1),
                roleCode: Joi.number(),
                level: Joi.number(),
                privileges: Joi.array().items(Joi.string().min(1)),
                description: Joi.string().min(1),
            }
        }
    });
    return schema.validate(role);
}

/// Role Verbs
const createRoleVerb = {
    "id-enum": "create-role",
    display: {
        "en-US": "Created Role"
    }
};
const updateRoleVerb = {
    "id-enum": "update-role",
    display: {
        "en-US": "Updated Role"
    }
};
const deleteRoleVerb = {
    "id-enum": "delete-role",
    display: {
        "en-US": "Deleted Role"
    }
};

module.exports = {
    roleModel,
    validateCreateRole,
    validateUpdateRole,
    createRoleVerb,
    updateRoleVerb,
    deleteRoleVerb,
}