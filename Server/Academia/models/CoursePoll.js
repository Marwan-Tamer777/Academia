const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// CoursePoll Schema
const coursePollSchema = new mongoose.Schema({
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
    options : {
        type: [String],
        required: true,
        trim: true,
    },
    votes : {
        type: [Number],
        default: [],
    },
    closePollDate: {
        type: Date,
        required: true,
    },
    totalVoters: {
        type: Number,
        default: 0,
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'CoursePoll',
});

/// CoursePoll Model
const coursePoll = mongoose.model('CoursePoll', coursePollSchema);

/// Validate CoursePoll
function validateCreateCoursePoll(coursePoll) {
    const schema = Joi.object({
        courseId: Joi.string().required(),
        options: Joi.array().items(Joi.string()).required(),
        votes: Joi.array().items(Joi.number()),
        closePollDate: Joi.date().required(),
        totalVoters: Joi.number(),
    });

    return schema.validate(coursePoll);
}

function validateUpdateCoursePoll(coursePoll) {
    const schema = Joi.object({
        courseId: Joi.string(),
        options: Joi.array().items(Joi.string()),
        votes: Joi.array().items(Joi.number()),
        closePollDate: Joi.date(),
        totalVoters: Joi.number(),
    });

    return schema.validate(coursePoll);
}

/// CoursePoll Verbs
const createCoursePollVerb = {
    "id-enum": "create-course-poll",
    display: {
        "en-US": "Created Course Poll"
    }
};

const updateCoursePollVerb = {
    "id-enum": "update-course-poll",
    display: {
        "en-US": "Updated Course Poll"
    }
};

const deleteCoursePollVerb = {
    "id-enum": "delete-course-poll",
    display: {
        "en-US": "Deleted Course Poll"
    }
};

module.exports = {
    coursePoll,
    validateCreateCoursePoll,
    validateUpdateCoursePoll,
    createCoursePollVerb,
    updateCoursePollVerb,
    deleteCoursePollVerb,
};
