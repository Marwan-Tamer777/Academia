const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Comment Schema
const commentSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    postId: {
        type: String,
        required: true,
        trim: true,
        ref: 'Post',
    },
    postedBy: {
        type: String,
        required: true,
        trim: true,
    },
    replyingTo: {
        type: String,
        required: true,
        trim: true,
    },
    content: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        default: "",
    },
    likes: {
        type: [String],
        default: [],
    },
    dislikes: {
        type: [String],
        default: [],
    },
}, {    _id: false,

    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'postedOn',
        updatedAt: 'editedOn',
    },
    collection: 'Comments',
});

/// Comment Model
const commentModel = mongoose.model('Comment', commentSchema);

/// Comment Validation 
function validateCreateComment(comment) {
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
            comment: {
                postId: Joi.string().required(),
                postedBy: Joi.string().required(),
                replyingTo: Joi.string().required(),
                content: Joi.string().required().min(1),
                likes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure likes do not contain any entries from dislikes
                    const dislikes = comment.context.comment
                    const commonElements = value.filter(element => dislikes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('likes.invalid', { likes: value, commonElements });
                    }
                    return value;
                }),
                dislikes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure dislikes do not contain any entries from likes
                    const { likes } = comment.context.comment;;
                    const commonElements = value.filter(element => likes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('dislikes.invalid', { dislikes: value, commonElements });
                    }
                    return value;
                }),
            }
        }
    });

    return schema.validate(comment);
}

function validateUpdateComment(comment) {
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
            comment: {
                content: Joi.string().required().min(1),
                likes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure likes do not contain any entries from dislikes
                    const { dislikes } = comment.context.comment;
                    const commonElements = value.filter(element => dislikes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('likes.invalid', { likes: value, commonElements });
                    }
                    return value;
                }),
                dislikes: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    // Ensure dislikes do not contain any entries from likes
                    const { likes } = comment.context.comment;
                    const commonElements = value.filter(element => likes.includes(element));
                    if (commonElements.length > 0) {
                        return helpers.error('dislikes.invalid', { dislikes: value, commonElements });
                    }
                    return value;
                }),
            }
        }
    });

    return schema.validate(comment);
}

/// Comment Verbs
const createCommentVerb = {
    "id-enum": "create-comment",
    display: {
        "en-US": "Created Comment"
    }
};
const updateCommentVerb = {
    "id-enum": "update-comment",
    display: {
        "en-US": "Updated Comment"
    }
};
const deleteCommentVerb = {
    "id-enum": "delete-comment",
    display: {
        "en-US": "Deleted Comment"
    }
};



module.exports = {
    commentModel,
    validateCreateComment,
    validateUpdateComment,
    createCommentVerb,
    updateCommentVerb,
    deleteCommentVerb,
};