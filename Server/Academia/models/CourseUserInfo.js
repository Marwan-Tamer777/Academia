const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// CourseUserInfo Schema
const courseUserInfoSchema = new mongoose.Schema({
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
    roleId: {
        type: String,
        required: true,
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
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'CourseUserInfo',
});

/// CourseUserInfo Model
const courseUserInfo = mongoose.model('CourseUserInfo', courseUserInfoSchema);

/// Validate CourseUserInfo
function validateCreateCourseUserInfo(courseUserInfo) {
    const schema = Joi.object({
        userId: Joi.string().required(),
        courseId: Joi.string().required(),
        roleId: Joi.string().required(),
        mostRecentGrade: Joi.number(),
        latestSeenPostDate: Joi.date(),
    });

    return schema.validate(courseUserInfo);
}

function validateUpdateCourseUserInfo(courseUserInfo) {
    const schema = Joi.object({
        userId: Joi.string(),
        courseId: Joi.string(),
        roleId: Joi.string().required(),
        mostRecentGrade: Joi.number(),
        latestSeenPostDate: Joi.date(),
    });

    return schema.validate(courseUserInfo);
}

/// CourseUserInfo Verbs
const createCourseUserInfoVerb = {
    "id-enum": "create-user-course-info",
    display: {
        "en-US": "Created User Course Info"
    }
};
const updateCourseUserInfoVerb = {
    "id-enum": "update-user-course-info",
    display: {
        "en-US": "Updated User Course Info"
    }
};
const deleteCourseUserInfoVerb = {
    "id-enum": "delete-user-course-info",
    display: {
        "en-US": "Deleted User Course Info"
    }
};

module.exports = {
    courseUserInfo,
    validateCreateCourseUserInfo,
    validateUpdateCourseUserInfo,
    createCourseUserInfoVerb,
    updateCourseUserInfoVerb,
    deleteCourseUserInfoVerb,
}