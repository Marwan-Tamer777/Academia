Map<String, dynamic> loginSchema({
  required Map<String, dynamic> data,
}) =>
    {
      "actor": {"name": "Guest", "id": "null"},
      "verb": {
        "id-enum": "log-into-account",
        "display": {"en-US": "log user"}
      },
      "object": {
        "id": "null",
        "objectType": "Agent",
        "definition": {
          "name": {"en-US": "user data"}
        }
      },
      "context": {
        "user": data,
      }
    };

Map<String, dynamic> enrollCourseSchema({
  required String studentId,
  required String enrollCode,
}) =>
    {
      // "timestamp": "2015-11-18T12:17:00+00:00",
      "actor": {"name": "Admin", "id": "Admin Id"},
      "verb": {
        "id-enum": "create-course",
        "display": {"en-US": "create course"}
      },
      "object": {
        "id": "null",
        "objectType": "Agent",
        "definition": {
          "name": {"en-US": "course data"}
        }
      },
      "context": {
        "course": {
          "enrollCode": enrollCode,
        },
        "student": {
          "id": studentId,
        }
      }
    }; 


Map<String, dynamic> submitQuizSchema({ 
  required String quizId, 
  required String courseId, 
  required String userId, 
  required List<String> answers
}) => {
	// "timestamp": "2015-11-18T12:17:00+00:00",
	"actor":{
		"name": "Admin",
		"id": "Admin Id"
	},
	"verb":{
		"id-enum":"create-course",
		"display":{ 
			"en-US":"create course" 
		}
	},
	"object":{
		"id":"null",
        "objectType": "Agent",
		"definition":{
			"name":{ 
				"en-US":"course data" 
			}
		}
	},
     "context":{
        "quizUserInfo":{
            "quizId":quizId,
            "courseId":courseId,
            "userId":userId,
            "answers":answers
        }
        }
}; 


Map<String, dynamic> resetPasswordSchema({
  required String email,
  required String oldPassword,
  required String newPassword,
}) => {
	// "timestamp": "2015-11-18T12:17:00+00:00",
	"actor":{
		"name": "Guest",
		"id": "actorId"
	},
	"verb":{
		"id-enum":"reset-password",
		"display":{ 
			"en-US":"Reset Password" 
		}
	},
	"object":{
		"id":"null",
        "objectType": "Agent",
		"definition":{
			"name":{ 
				"en-US":"user data" 
			}
		}
	},
     "context":{
        "user":{
            "email":email,
            "password":oldPassword,
            "newPassword":newPassword
        }
        
        }
}; 


Map<String, dynamic> unEnrollCourseSchema({
  required String studentId,
}) =>
    {
	"actor":{
		"name": "Admin",
		"id": "Admin Id"
	},
	"verb":{
		"id-enum":"create-course",
		"display":{ 
			"en-US":"create course" 
		}
	},
	"object":{
		"id":"null",
        "objectType": "Agent",
		"definition":{
			"name":{ 
				"en-US":"course data" 
			}
		}
	},
     "context":{
        "student":{
            "id": studentId
        }
        
        }
};