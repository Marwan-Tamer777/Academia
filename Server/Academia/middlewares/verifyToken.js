const jwt = require('jsonwebtoken');
const courseModel = require('../models/Course');


function verifyToken(req, res, next) {
    const token = req.headers.token;

    if (!token) {
        return res.status(401).json({ error: "Access Denied: No Token Provided" });
    }
    try {
        // verify the token
        const verified = jwt.verify(token, process.env.TOKEN_SECRET);

        // check if id and isAdmin are in the token
        if (!verified.id || !verified.isAdmin) {
            return res.status(401).json({ error: "Access Denied: Invalid Token" });
        }

        req.user = verified;
    } catch (err) {
        console.log(err);
        if (err.name === 'TokenExpiredError') {
            return res.status(401).json({ error: "Access Denied: Token Expired" });
        } else {
            return res.status(400).json({ error: `Invalid Token: ${err}` });
        }
    }
    next();
}

// function verifyTokenAndAuthorizedTeacher(req, res, next) {
//     verifyToken(req, res, async () => {
//         if (req.user.roleCode === 0) {
//             next();
//         } else if (req.user.roleCode === 2) {
//             // check if course exists and the teacher is the owner
//             try {
//                 const course = await courseModel.courseModel.findOne({ id: req.body.courseId });
//                 if (course || method !== "GET") {
//                     if (course.teachers.includes(req.user.id)) {
//                         next();
//                     } else {
//                         return res.status(403).json({ error: "Access Denied: The Current Teacher is not the Teacher of the Course." });
//                     }
//                 } else {
//                     return res.status(403).json({ error: "Course wasn't Found." });
//                 }
//             } catch (err) {
//                 return res.status(403).json({ error: "Access Denied: The Current User is not the Teacher of the Course." });
//             }
//         } else {
//             return res.status(403).json({ error: "Access Denied: The Current User is not a Teacher." });
//         }
//     });
// }

// function verifyTokenAndAuthorizedTeacherWithId(req, res, next) {
//     verifyToken(req, res, async () => {
//         if (req.user.roleCode === 0) {
//             next();
//         } else if (req.user.roleCode === 2) {
//             // check if course exists and the teacher is the owner
//             try {
//                 const course = await courseModel.courseModel.findOne({ id: req.params.courseId });
//                 if (course) {
//                     if (course.teachers.includes(req.user.id)) {
//                         next();
//                     } else {
//                         return res.status(403).json({ error: "Access Denied: The Current Teacher is not the Teacher of the Course." });
//                     }
//                 } else {
//                     return res.status(403).json({ error: "Course wasn't Found." });
//                 }
//             } catch (err) {
//                 return res.status(403).json({ error: "Access Denied: The Current User is not the Teacher of the Course." });
//             }
//         } else {
//             return res.status(403).json({ error: "Access Denied: The Current User is not a Teacher." });
//         }
//     });
// }

function verifyTokenAndAuthorization(req, res, next) {
    verifyToken(req, res, () => {
        if (req.user.id === req.params.id || req.user.isAdmin) {
            next();
        } else {
            return res.status(403).json({ error: "Access Denied: Invalid Token for the current User." });
        }
    });

}

function verifyTokenAndAdmin(req, res, next) {
    verifyToken(req, res, () => {
        if (req.user.isAdmin) {
            next();
        } else {
            return res.status(403).json({ error: "Access Denied: The Current User is not an Admin." });
        }
    });
}
module.exports = {
    verifyToken,
    verifyTokenAndAuthorization,
    verifyTokenAndAdmin,
    // verifyTokenAndAuthorizedTeacher 
};