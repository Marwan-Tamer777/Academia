const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// CoursePost Schema
// const coursePostSchema = new mongoose.Schema({
//     _id: {
//         type: String,
//         unique: true,
//         default: uuidv4,
//     },
//     courseId: {
//         type: String,
//         required: true,
//         trim: true,
//         ref: 'Course',
//     },
//     postedBy: {
//         type: String,
//         required: true,
//         trim: true,
//     },
//     postNow: {
//         type: Boolean,
//         default: false,
//     },
//     postingDate: {
//         type: Date,
//         default: new Date(),
//     },
//     content: {
//         type: String,
//         required: true,
//         trim: true,
//         minlength: 1,
//         default: "",
//     },
//     material: {
//         type: [String],
//         default: [],
//     },
//     quizId: {
//         type: String,
//         default: "",
//     },
//     assignmentId: {
//         type: String,
//         default: "",
//     },
//     alertUsers: {
//         type: Boolean,
//         default: false,
//     },
//     alertDate: {
//         type: Date,
//         default: new Date(),
//     },
//     comments: {
//         type: [String],
//         default: [],
//     },
// }, {
//     _id: false,
//     timestamps: {
//         currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
//         createdAt: 'postedOn',
//         updatedAt: 'editedOn',
//     },
//     collection: 'CoursePosts',
// });