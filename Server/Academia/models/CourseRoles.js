const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// CourseRoles Schema
const courseRolesSchema = new mongoose.Schema({
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
    roleCode: {
        type: int,
        required: true,
    },
    role: {
        type: String,
        required: true,
        trim: true,
    },
    level: {
        type: int,
        required: true,
    },
    privileges: {
        type: [int],
        default: [],
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'CourseRoles',
});

/// CourseRoles Model
const courseRoles = mongoose.model('CourseRoles', courseRolesSchema);

/// Validate CourseRoles
function validateCreateCourseRoles(courseRoles) {
    const schema = Joi.object({
        courseId: Joi.string().required(),
        roleCode: Joi.number().required(),
        role: Joi.string().required(),
        level: Joi.number().required(),
        privileges: Joi.array().items(Joi.number()),
    });

    return schema.validate(courseRoles);
}

function validateUpdateCourseRoles(courseRoles) {
    const schema = Joi.object({
        courseId: Joi.string(),
        roleCode: Joi.number(),
        role: Joi.string(),
        level: Joi.number(),
        privileges: Joi.array().items(Joi.number()),
    });

    return schema.validate(courseRoles);
}

/// CourseRoles Verbs
const createCourseRolesVerb = {
    "id-enum": "create-course-roles",
    display: {
        "en-US": "Created Course Roles"
    }
};

const updateCourseRolesVerb = {
    "id-enum": "update-course-roles",
    display: {
        "en-US": "Updated Course Roles"
    }
};

const deleteCourseRolesVerb = {
    "id-enum": "delete-course-roles",
    display: {
        "en-US": "Deleted Course Roles"
    }
};

module.exports.CourseRoles = {
    courseRoles,
    validateCreateCourseRoles,
    validateUpdateCourseRoles,
    createCourseRolesVerb,
    updateCourseRolesVerb,
    deleteCourseRolesVerb,
}