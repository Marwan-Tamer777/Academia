const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const materialModel = require('./Material');
const coursePoll = require('./CoursePoll');
const assignmentModel = require('./Assignment');
const quizModel = require('./Quiz');
/// Post Schema
const postSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
        ref: 'Course',
    },
    postedBy: {
        type: String,
        required: true,
        trim: true,
    },
    postNow: {
        type: Boolean,
        default: false,
    },
    postingDate: {
        type: Date,
        default: new Date(),
    },
    title: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        default: "",
    },
    content: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        default: "",
    },
    material: {
        type: Object,
        default: () => ({}),
        required: false,
    },
    quizId: {
        type: Object,
        default: () => ({}),
        required: false,
    },
    assignment: {
        type: Object,
        default: () => ({}),
        required: false,
    },
    poll: {
        type: Object,
        default: () => ({}),
        required: false,
    },
    alertUsers: {
        type: Boolean,
        default: false,
    },
    alertDate: {
        type: Date,
        default: new Date(),
    },
    comments: {
        type: [String],
        default: [],
    },
    allowComments: {
        type: Boolean,
        default: true,
    },
    likes: {
        type: [String],
        default: [],
    },
    dislikes: {
        type: [String],
        default: [],
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'postedOn',
        updatedAt: 'editedOn',
    },
    collection: 'Posts',
});

/// Post Model
const postModel = mongoose.model('Post', postSchema);

/// Post Validation
function validateCreatePost(post) {
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
            post: {
                courseId: Joi.string().required(),
                postedBy: Joi.string().required(),
                postNow: Joi.boolean().default(false),
                alertUsers: Joi.boolean().default(false),
                title: Joi.string().required().min(1),
                content: Joi.string().required().min(1),
                comments: Joi.array().items(Joi.string()),
                allowComments: Joi.boolean().default(true),
                likes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure likes do not contain any entries from dislikes
                    const { dislikes } = post.context.post;
                    const commonElements = value.filter(element => dislikes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('likes.invalid', { likes: value, commonElements });
                    }
                    return value;
                }),
                dislikes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure dislikes do not contain any entries from likes
                    const { likes } = post.context.post;
                    const commonElements = value.filter(element => likes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('dislikes.invalid', { dislikes: value, commonElements });
                    }
                    return value;
                }),
                coursePoll: Joi.object(),
                material: Joi.object(),
                assignment: Joi.object(),
                quiz: Joi.object(),

            }
        }
    }).prefs({ messages: { 'likes.invalid': 'Likes cannot contain entries from dislikes', 'dislikes.invalid': 'Dislikes cannot contain entries from likes' } });

    return schema.validate(post);
}

function validateUpdatePost(post) {
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
            post: {
                title: Joi.string().required().min(1),
                content: Joi.string().required().min(1),
                postNow: Joi.boolean().default(false),
                alertUsers: Joi.boolean().default(false),
                comments: Joi.array().items(Joi.string()),
                allowComments: Joi.boolean().default(true),
                likes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure likes do not contain any entries from dislikes
                    const { dislikes } = post.context.post;
                    const commonElements = value.filter(element => dislikes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('likes.invalid', { likes: value, commonElements });
                    }
                    return value;
                }),
                dislikes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure dislikes do not contain any entries from likes
                    const { likes } = post.context.post;
                    const commonElements = value.filter(element => likes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('dislikes.invalid', { dislikes: value, commonElements });
                    }
                    return value;
                }),
                coursePoll: coursePoll.validateUpdateCoursePoll,
                material: materialModel.validateUpdateMaterial,
                assignment: assignmentModel.validateUpdateAssignment,
                quiz: quizModel.validateUpdateQuiz,

            }
        }
    }).prefs({ messages: { 'likes.invalid': 'Likes cannot contain entries from dislikes', 'dislikes.invalid': 'Dislikes cannot contain entries from likes' } });

    return schema.validate(post);
}

/// Post Verbs
const createPostVerb = {
    "id-enum": "create-post",
    display: {
        "en-US": "Created Post"
    }
};
const updatePostVerb = {
    "id-enum": "update-post",
    display: {
        "en-US": "Updated Post"
    }
};
const deletePostVerb = {
    "id-enum": "delete-post",
    display: {
        "en-US": "Deleted Post"
    }
};


module.exports = {
    postModel,
    validateCreatePost,
    validateUpdatePost,
    createPostVerb,
    updatePostVerb,
    deletePostVerb,
};