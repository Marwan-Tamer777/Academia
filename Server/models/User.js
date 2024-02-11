const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken'); // for generating json web tokens


/// User Schema
const userSchema = new mongoose.Schema({
    id: {
        type: String,
        default: uuidv4,
        unique: true,
    },
    name: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 100,
    },
    assignedId: {
        type: String,
        required: true,
        trim: true,
        unique: true,
    },
    email: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        minlength: 7,
    },
    password: {
        type: String,
        required: true,
        trim: true,
        minlength: 7,
    },
    avatar: {
        type: String,
        default: "",
    },
    courses: {
        type: [String],
        default: []
    },
    roleCode: {
        type: Number,
        default: 99
    },
}, {
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
});

/// Generate a token
userSchema.methods.generateAuthToken = function () {
    const token = jwt.sign({ id: this.id, roleCode: this.roleCode }, process.env.TOKEN_SECRET, { expiresIn: '4d' });
    return token;
}

/// User Model
const userModel = mongoose.model('User', userSchema);

/// User Validation

function validateRegisterUser(user) {
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
            user: {
                name: Joi.string().trim().min(1).max(100).required(),
                assignedId: Joi.string().trim().min(1).max(100).required(),
                email: Joi.string().trim().min(7).required(),
                password: Joi.string().trim().min(7).required(),
            }

        }

    });
    return schema.validate(user);
}

function validateLoginUser(user) {
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
            user: {
                email: Joi.string().trim().min(7).required(),
                password: Joi.string().trim().min(7).required(),
            }
        }
    });
    return schema.validate(user);
}

function validateUpdateUser(user) {
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
            user: {
                name: Joi.string().trim().min(1).max(100),
                assignedId: Joi.string().trim().min(1).max(100),
                email: Joi.string().trim().min(7),
                password: Joi.string().trim().min(7),
                avatar: Joi.string().trim().min(1),
                courses: Joi.array().items(Joi.string().trim()),
                roleCode: Joi.number().min(0).max(99),
            }

        }
    });
    return schema.validate(user);
}

/// User Verbs
const registerUserVerb = {
    id: "user-registered",
    display: {
        "en-US": "User registered"
    }
}

const loginUserVerb = {
    id: "user-logged-in",
    display: {
        "en-US": "User logged in"
    }
}

const updateUserVerb = {
    id: "user-updated",
    display: {
        "en-US": "User updated"
    }
}

const deleteUserVerb = {
    id: "user-deleted",
    display: {
        "en-US": "User deleted"
    }
}



module.exports = { userModel, validateRegisterUser, validateLoginUser, validateUpdateUser, registerUserVerb, loginUserVerb, updateUserVerb, deleteUserVerb }