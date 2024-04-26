const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// UserCourseInfo Schema
const userCourseInfoSchema = new mongoose.Schema({
    _id: {
        type: String,
        default: uuidv4,
        unique: true,
    },
    userId: {
        type: String,
        required: true,
        trim: true,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    role: {
        type: Number,
        default: 0,
    },
    mostRecentGrade: {
        type: Number,
        default: 0,
    },
    latestSeenPostDate: {
        type: Date,
        default: Date.now,
    },
},{
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'UserCourseInfo',
});

/// UserCourseInfo Model
const userCourseInfo = mongoose.model('UserCourseInfo', userCourseInfoSchema);

/// Validate UserCourseInfo
function validateCreateUserCourseInfo(userCourseInfo) {
    const schema = Joi.object({
        userId: Joi.string().required(),
        courseId: Joi.string().required(),
        role: Joi.number(),
        mostRecentGrade: Joi.number(),
        latestSeenPostDate: Joi.date(),
    });

    return schema.validate(userCourseInfo);
}

function validateUpdateUserCourseInfo(userCourseInfo) {
    const schema = Joi.object({
        userId: Joi.string(),
        courseId: Joi.string(),
        role: Joi.number(),
        mostRecentGrade: Joi.number(),
        latestSeenPostDate: Joi.date(),
    });

    return schema.validate(userCourseInfo);
}

/// UserCourseInfo Verbs
const createUserCourseInfoVerb = {
    "id-enum": "create-user-course-info",
    display: {
        "en-US": "Created User Course Info"
    }
};
const updateUserCourseInfoVerb = {
    "id-enum": "update-user-course-info",
    display: {
        "en-US": "Updated User Course Info"
    }
};
const deleteUserCourseInfoVerb = {
    "id-enum": "delete-user-course-info",
    display: {
        "en-US": "Deleted User Course Info"
    }
};

module.exports = {
    userCourseInfo,
    validateCreateUserCourseInfo,
    validateUpdateUserCourseInfo,
    createUserCourseInfoVerb,
    updateUserCourseInfoVerb,
    deleteUserCourseInfoVerb,
}