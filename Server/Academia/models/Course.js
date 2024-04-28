const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Course Schema
const courseSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },

    name: {
        type: String,
        required: true,
        trim: true,
        maxlength: 200,
        // match: /pattern/
    },
    courseCode: {
        type: String,
        required: true,
        trim: true,
        unique: true,
    },
    enrollCode: {
        type: String,
        required: true,
        trim: true,
    },
    programName: {
        type: String,
        required: true,
        trim: true,
    },
    people: {
        type: [String],
        default: [],
    },
    posts: {
        type: [String],
        default: [],
    },
    currentCapacity: {
        type: Number,
        default: 0,
    },
    maxCapacity: {
        type: Number,
        required: true,
        min: 1,
    },
    teachers: {
        type: [String],
        default: [],
    },
    students: {
        type: [String],
        default: [],
    },
    status: {
        type: Number,
        min: 0,
        max: 3,
        default: 0,
    },
    mostRecentDeadline: {
        type: Date,
        default: new Date().toISOString()
    },
    quizzes: {
        type: [String],
        default: [],
    },
    materials: {
        type: [String],
        default: [],
    },
    roles: {
        type: [String],
        default: [],
    },

}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Courses',

},
);

/// Course Model
const courseModel = mongoose.model('Course', courseSchema);


/// Course Validation
function validateCreateCourse(course) {
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
            course: {
                name: Joi.string().trim().max(200).required(),
                courseCode: Joi.string().trim().required(),
                enrollCode: Joi.string().trim().required(),
                programName: Joi.string().trim().required(),
                maxCapacity: Joi.number().min(1),
                currentCapacity: Joi.number().min(0).max(Joi.ref('maxCapacity')),
                people: Joi.array().items(Joi.string().trim()),
                students: Joi.array().items(Joi.string().trim()),
                quizzes: Joi.array().items(Joi.string().trim()),
                posts: Joi.array().items(Joi.string().trim()),
                materials: Joi.array().items(Joi.string().trim()),
                roles: Joi.array().items(Joi.string().trim()),
                teachers: Joi.array().items(Joi.string().trim()),
                students: Joi.array().items(Joi.string().trim()),
                status: Joi.number().min(0).max(3),
                mostRecentDeadline: Joi.date(),
            },
        },
    });
    return schema.validate(course);
}

function validateUpdateCourse(course) {
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
            course: {
                name: Joi.string().trim().max(200),
                courseCode: Joi.string().trim(),
                enrollCode: Joi.string().trim(),
                maxCapacity: Joi.number().min(1),
                currentCapacity: Joi.number().min(0).max(Joi.ref('maxCapacity')),
                teachers: Joi.array().items(Joi.string().trim()),
                students: Joi.array().items(Joi.string().trim()),
                quizzes: Joi.array().items(Joi.string().trim()),
                posts: Joi.array().items(Joi.string().trim()),
                materials: Joi.array().items(Joi.string().trim()),
                roles: Joi.array().items(Joi.string().trim()),
            }

        },
    });
    return schema.validate(course);
}
function validateEnrollCourse(course) {
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
            course: {
                enrollCode: Joi.string().trim().required(),
            },
            student: {
                id: Joi.string().trim().min(1).required(),
            },
        },
    });
    return schema.validate(course);
}

/// Course Verbs
const createCourseVerb = {
    "id-enum": "created-course",
    display: {
        "en-US": "created course"
    }
};
const enrollCourseVerb = {
    "id-enum": "enrolled-course",
    display: {
        "en-US": "enrolled course"
    }
};
const unenrollCourseVerb = {
    "id-enum": "unenrolled-course",
    display: {
        "en-US": "unenrolled course"
    }
};
const updateCourseVerb = {
    "id-enum": "updated-course",
    display: {
        "en-US": "updated course"
    }
};
const deleteCourseVerb = {
    "id-enum": "deleted-course",
    display: {
        "en-US": "deleted course"
    }
};
const getCourseVerb = {
    "id-enum": "retrieved-course",
    display: {
        "en-US": "retrieved course"
    }
};
module.exports = {
    courseModel,
    validateCreateCourse,
    validateEnrollCourse,
    validateUpdateCourse,
    createCourseVerb,
    updateCourseVerb,
    enrollCourseVerb,
    unenrollCourseVerb,
    deleteCourseVerb,
    getCourseVerb
}