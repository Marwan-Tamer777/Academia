const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const jwt = require('jsonwebtoken'); // for generating json web tokens


/// User Schema
const userSchema = new mongoose.Schema({

    _id: {
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
    email: {
        type: String,
        required: true,
        trim: true,
        unique: true,
        minlength: 1,
    },
    password: {
        type: String,
        required: true,
        trim: true,
        minlength: 7,
    },
    isAdmin: {
        type: Boolean,
        default: false,
    },
    avatar: {
        type: String,
        default: "",
    },
    assignedId: {
        type: String,
        required: true,
        trim: true,
        unique: true,
    },
    courses: {
        type: [String],
        default: []
    },
    lastAccessedCourse: {
        type: String,
        default: ""
    },
    contacts: {
        type: [String],
        default: []
    },
    description: {
        type: String,
        default: ""
    },
    title: {
        type: String,
        default: "Guest"
    },
    department: {
        type: String,
        default: ""
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Users',
});

 
/// Generate a token
userSchema.methods.generateAuthToken = function () {
    const token = jwt.sign({ id: this._id, isAdmin: this.isAdmin }, process.env.TOKEN_SECRET, { expiresIn: '4d' });
    return token;
}

/// User Model
const userModel = mongoose.model('Users', userSchema);

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
                _id: Joi.string().default(uuidv4),
                name: Joi.string().trim().min(1).required(),
                email: Joi.string().trim().min(1),
                password: Joi.string().trim().min(7).required(),
                assignedId: Joi.string().trim().min(1).max(100).required(),
                avatar: Joi.string().trim(),
                courses: Joi.array().items(Joi.string().trim()),
                contacts: Joi.array().items(Joi.string().trim()),
                description: Joi.string().trim(),
                isAdmin: Joi.boolean(),
                title: Joi.string().trim(),
                department: Joi.string().trim().min(1),
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
                email: Joi.string().trim().min(7).max(100),
                assignedId: Joi.string().trim().min(1),
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
            }

        }
    });
    return schema.validate(user);
}

function validateResetPassword(user) {
    const schema = Joi.object({
        email: Joi.string().trim().min(7).max(100),
        password: Joi.string().trim().min(7).required(),
        newPassword: Joi.string().trim().min(7).required(),
    });
    return schema.validate(user);
}

/// User Verbs
const registerUserVerb = {
    "id-enum": "user-registered",
    display: {
        "en-US": "User registered"
    }
}

const loginUserVerb = {
    "id-enum": "user-logged-in",
    display: {
        "en-US": "User logged in"
    }
}

const updateUserVerb = {
    "id-enum": "user-updated",
    display: {
        "en-US": "User updated"
    }
}

const deleteUserVerb = {
    "id-enum": "user-deleted",
    display: {
        "en-US": "User deleted"
    }
}

const resetPasswordVerb = {
    "id-enum": "user-reset-password",
    display: {
        "en-US": "User reset password"
    }
}


module.exports = {
    userModel,
    validateRegisterUser,
    validateLoginUser,
    validateUpdateUser,
    validateResetPassword,
    registerUserVerb,
    loginUserVerb,
    updateUserVerb,
    deleteUserVerb,
    resetPasswordVerb
}