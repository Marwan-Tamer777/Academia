const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Privilege Schema
const privilegeSchema = new mongoose.Schema({
    id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    privilegeCode: {
        type: String,
        unique: true,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 100,
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

/// Privilege Model
const privilegeModel = mongoose.model('Privilege', privilegeSchema);

/// Privilege Validation
function validateCreatePrivilege(privilege) {
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
            privilege: {
                privilegeCode: Joi.string().min(1).required(),
                description: Joi.string().min(1).required(),
            }
        }

    });
    return schema.validate(privilege);
}

function validateUpdatePrivilege(privilege) {
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
            privilege: {
                description: Joi.string().min(1).required(),
            }
        }
    });
    return schema.validate(privilege);
}

/// Privilege Verbs
const createPrivilegeVerb = {
    "id-enum": "create-privilege",
    display: {
        "en-US": "Created Privilege"
    }
};
const updatePrivilegeVerb = {
    "id-enum": "update-privilege",
    display: {
        "en-US": "Updated Privilege"
    }
};
const deletePrivilegeVerb = {
    "id-enum": "delete-privilege",
    display: {
        "en-US": "Deleted Privilege"
    }
};

module.exports = {
    privilegeModel,
    validateCreatePrivilege,
    validateUpdatePrivilege,
    createPrivilegeVerb,
    updatePrivilegeVerb,
    deletePrivilegeVerb
};