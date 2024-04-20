// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      avatar: json['avatar'] as String?,
      assignedId: json['assignedId'] as String?,
      courses:
          (json['courses'] as List<dynamic>?)?.map((e) => e as String).toList(),
      lastAccessedCourse: json['lastAccessedCourse'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      title: json['title'] as String?,
      department: json['department'] as String?,
      createdOn: json['createdOn'] as String?,
      editedOn: json['editedOn'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'avatar': instance.avatar,
      'assignedId': instance.assignedId,
      'courses': instance.courses,
      'lastAccessedCourse': instance.lastAccessedCourse,
      'contacts': instance.contacts,
      'description': instance.description,
      'title': instance.title,
      'department': instance.department,
      'createdOn': instance.createdOn,
      'editedOn': instance.editedOn,
    };

AssignmentResponse _$AssignmentResponseFromJson(Map<String, dynamic> json) =>
    AssignmentResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      description: json['description'] as String?,
      closeOn: json['closeOn'] as String?,
      duration: json['duration'] as int?,
      numOfAttempts: json['numOfAttempts'] as int?,
      createdOn: json['createdOn'] as String?,
      editedOn: json['editedOn'] as String?,
    );

Map<String, dynamic> _$AssignmentResponseToJson(AssignmentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'description': instance.description,
      'closeOn': instance.closeOn,
      'duration': instance.duration,
      'numOfAttempts': instance.numOfAttempts,
      'createdOn': instance.createdOn,
      'editedOn': instance.editedOn,
    };

AssignmentUserInfoResponse _$AssignmentUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    AssignmentUserInfoResponse(
      assignmentId: json['assignmentId'] as String?,
      userId: json['userId'] as String?,
      gradedBy: json['gradedBy'] as String?,
      courseId: json['courseId'] as String?,
      submissionUrl: json['submissionUrl'] as String?,
      submissionDate: json['submissionDate'] as String?,
      showGrade: json['showGrade'] as bool?,
      grade: (json['grade'] as num?)?.toDouble(),
      maxGrade: (json['maxGrade'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AssignmentUserInfoResponseToJson(
        AssignmentUserInfoResponse instance) =>
    <String, dynamic>{
      'assignmentId': instance.assignmentId,
      'userId': instance.userId,
      'gradedBy': instance.gradedBy,
      'courseId': instance.courseId,
      'submissionUrl': instance.submissionUrl,
      'submissionDate': instance.submissionDate,
      'showGrade': instance.showGrade,
      'grade': instance.grade,
      'maxGrade': instance.maxGrade,
    };

ActionMapResponse _$ActionMapResponseFromJson(Map<String, dynamic> json) =>
    ActionMapResponse(
      id: json['id'] as String?,
      description: json['description'] as String?,
      createdOn: json['createdOn'] as String?,
      editedOn: json['editedOn'] as String?,
    );

Map<String, dynamic> _$ActionMapResponseToJson(ActionMapResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdOn': instance.createdOn,
      'editedOn': instance.editedOn,
    };

CoursePollResponse _$CoursePollResponseFromJson(Map<String, dynamic> json) =>
    CoursePollResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      votes: (json['votes'] as List<dynamic>?)?.map((e) => e as int).toList(),
      closePollDate: json['closePollDate'] == null
          ? null
          : DateTime.parse(json['closePollDate'] as String),
      totalVoters: json['totalVoters'] as int?,
    );

Map<String, dynamic> _$CoursePollResponseToJson(CoursePollResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'options': instance.options,
      'votes': instance.votes,
      'closePollDate': instance.closePollDate?.toIso8601String(),
      'totalVoters': instance.totalVoters,
    };

CourseRoleResponse _$CourseRoleResponseFromJson(Map<String, dynamic> json) =>
    CourseRoleResponse(
      courseId: json['courseId'] as String?,
      roleCode: json['roleCode'] as int?,
      role: json['role'] as String?,
      level: json['level'] as int?,
      privileges:
          (json['privileges'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$CourseRoleResponseToJson(CourseRoleResponse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'roleCode': instance.roleCode,
      'role': instance.role,
      'level': instance.level,
      'privileges': instance.privileges,
    };

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) =>
    CourseResponse(
      id: json['id'] as String?,
      name: json['name'] as String?,
      courseCode: json['courseCode'] as String?,
      enrollCode: json['enrollCode'] as String?,
      programName: json['programName'] as String?,
      people:
          (json['people'] as List<dynamic>?)?.map((e) => e as String).toList(),
      posts:
          (json['posts'] as List<dynamic>?)?.map((e) => e as String).toList(),
      currentCapacity: json['currentCapacity'] as int?,
      maxCapacity: json['maxCapacity'] as int?,
      status: json['status'] as int?,
      mostRecentDeadline: json['mostRecentDeadline'] == null
          ? null
          : DateTime.parse(json['mostRecentDeadline'] as String),
      quizzes:
          (json['quizzes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CourseResponseToJson(CourseResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'courseCode': instance.courseCode,
      'enrollCode': instance.enrollCode,
      'programName': instance.programName,
      'people': instance.people,
      'posts': instance.posts,
      'currentCapacity': instance.currentCapacity,
      'maxCapacity': instance.maxCapacity,
      'status': instance.status,
      'mostRecentDeadline': instance.mostRecentDeadline?.toIso8601String(),
      'quizzes': instance.quizzes,
      'materials': instance.materials,
    };

PostResponse _$PostResponseFromJson(Map<String, dynamic> json) => PostResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      postedBy: json['title'] as String?,
      postNow: json['postType'] as bool?,
      postingDate: json['postingDate'] == null
          ? null
          : DateTime.parse(json['postingDate'] as String),
      content: json['content'] as String?,
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quizId: json['quizId'] as String?,
      assignmentId: json['assignmentId'] as String?,
      alertUsers: json['alertUsers'] as bool?,
      alertDate: json['alertDate'] == null
          ? null
          : DateTime.parse(json['alertDate'] as String),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dislikes: (json['dislikes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postedOn: json['postedOn'] == null
          ? null
          : DateTime.parse(json['postedOn'] as String),
      editedOn: json['editedOn'] == null
          ? null
          : DateTime.parse(json['editedOn'] as String),
    );

Map<String, dynamic> _$PostResponseToJson(PostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'title': instance.postedBy,
      'postType': instance.postNow,
      'postingDate': instance.postingDate?.toIso8601String(),
      'content': instance.content,
      'material': instance.material,
      'quizId': instance.quizId,
      'assignmentId': instance.assignmentId,
      'alertUsers': instance.alertUsers,
      'alertDate': instance.alertDate?.toIso8601String(),
      'comments': instance.comments,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'postedOn': instance.postedOn?.toIso8601String(),
      'editedOn': instance.editedOn?.toIso8601String(),
    };

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) => QuizResponse(
      courseId: json['courseId'] as String?,
      quizName: json['quizName'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      numOfRetries: json['numOfRetries'] as int?,
      duration: json['duration'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      showGrade: json['showGrade'] as bool?,
      showWrongAnswers: json['showWrongAnswers'] as bool?,
      showCorrectAnswers: json['showCorrectAnswers'] as bool?,
    );

Map<String, dynamic> _$QuizResponseToJson(QuizResponse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'quizName': instance.quizName,
      'questions': instance.questions,
      'numOfRetries': instance.numOfRetries,
      'duration': instance.duration,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'showGrade': instance.showGrade,
      'showWrongAnswers': instance.showWrongAnswers,
      'showCorrectAnswers': instance.showCorrectAnswers,
    };

QuizUserInfoResponse _$QuizUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    QuizUserInfoResponse(
      quizId: json['quizId'] as String?,
      userId: json['userId'] as String?,
      gradedBy: json['gradedBy'] as String?,
      courseId: json['courseId'] as String?,
      submissionUrl: json['submissionUrl'] as String?,
      submissionDate: json['submissionDate'] as String?,
      showGrade: json['showGrade'] as bool?,
      grade: (json['grade'] as num?)?.toDouble(),
      maxGrade: (json['maxGrade'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$QuizUserInfoResponseToJson(
        QuizUserInfoResponse instance) =>
    <String, dynamic>{
      'quizId': instance.quizId,
      'userId': instance.userId,
      'gradedBy': instance.gradedBy,
      'courseId': instance.courseId,
      'submissionUrl': instance.submissionUrl,
      'submissionDate': instance.submissionDate,
      'showGrade': instance.showGrade,
      'grade': instance.grade,
      'maxGrade': instance.maxGrade,
    };

QuestionResponse _$QuestionResponseFromJson(Map<String, dynamic> json) =>
    QuestionResponse(
      id: json['id'] as String?,
      quizId: json['quizId'] as String?,
      question: json['question'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correctAnswer: json['correctAnswer'] as String?,
      multipleAnswers: json['multipleAnswers'] as bool?,
      correctAnswers: (json['correctAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$QuestionResponseToJson(QuestionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quizId': instance.quizId,
      'question': instance.question,
      'options': instance.options,
      'correctAnswer': instance.correctAnswer,
      'multipleAnswers': instance.multipleAnswers,
      'correctAnswers': instance.correctAnswers,
      'weight': instance.weight,
    };

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      courseId: json['courseId'] as String?,
      submittedBy: json['description'] as String?,
      details:
          (json['details'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      adminResponses: (json['adminResponses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assignedTo: json['assignedTo'] as String?,
      priority: json['priority'] as String?,
      submittedOn: json['submittedOn'] == null
          ? null
          : Date.fromJson(json['submittedOn'] as Map<String, dynamic>),
      editedOn: json['editedOn'] == null
          ? null
          : Date.fromJson(json['editedOn'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketResponseToJson(TicketResponse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'description': instance.submittedBy,
      'details': instance.details,
      'status': instance.status,
      'adminResponses': instance.adminResponses,
      'attachments': instance.attachments,
      'assignedTo': instance.assignedTo,
      'priority': instance.priority,
      'submittedOn': instance.submittedOn,
      'editedOn': instance.editedOn,
    };

Date _$DateFromJson(Map<String, dynamic> json) => Date(
      date: json['date'] as String?,
      timeZone: json['timeZone'] as String?,
    );

Map<String, dynamic> _$DateToJson(Date instance) => <String, dynamic>{
      'date': instance.date,
      'timeZone': instance.timeZone,
    };

RoleResponse _$RoleResponseFromJson(Map<String, dynamic> json) => RoleResponse(
      courseId: json['courseId'] as String?,
      roleName: json['roleName'] as String?,
      roleCode: json['roleCode'] as int?,
      level: json['level'] as int?,
      privileges: (json['privileges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$RoleResponseToJson(RoleResponse instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'roleName': instance.roleName,
      'roleCode': instance.roleCode,
      'level': instance.level,
      'privileges': instance.privileges,
      'description': instance.description,
    };

UserCourseResponse _$UserCourseResponseFromJson(Map<String, dynamic> json) =>
    UserCourseResponse(
      userId: json['userId'] as String?,
      courseId: json['courseId'] as String?,
      role: json['role'] as int?,
      mostRecentGrade: json['mostRecentGrade'] as int?,
      latestSeenPostDate: json['latestSeenPostDate'] == null
          ? null
          : DateTime.parse(json['latestSeenPostDate'] as String),
    );

Map<String, dynamic> _$UserCourseResponseToJson(UserCourseResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'courseId': instance.courseId,
      'role': instance.role,
      'mostRecentGrade': instance.mostRecentGrade,
      'latestSeenPostDate': instance.latestSeenPostDate?.toIso8601String(),
    };

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) => TagResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      tagName: json['tagName'] as String?,
    );

Map<String, dynamic> _$TagResponseToJson(TagResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'tagName': instance.tagName,
    };

StatementResponse _$StatementResponseFromJson(Map<String, dynamic> json) =>
    StatementResponse(
      id: json['id'] as String?,
      actor: json['actor'] as String?,
      action: json['action'] as String?,
      context: json['context'] as String?,
      object: json['object'] as String?,
    );

Map<String, dynamic> _$StatementResponseToJson(StatementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actor': instance.actor,
      'action': instance.action,
      'context': instance.context,
      'object': instance.object,
    };

PrivilegeResponse _$PrivilegeResponseFromJson(Map<String, dynamic> json) =>
    PrivilegeResponse(
      id: json['id'] as String?,
      privilegeCode: json['privilegeCode'] as String?,
      description: json['description'] as String?,
      createdOn: json['createdOn'] as String?,
      editedOn: json['editedOn'] as String?,
    );

Map<String, dynamic> _$PrivilegeResponseToJson(PrivilegeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'privilegeCode': instance.privilegeCode,
      'description': instance.description,
      'createdOn': instance.createdOn,
      'editedOn': instance.editedOn,
    };

PrivilegeMapResponse _$PrivilegeMapResponseFromJson(
        Map<String, dynamic> json) =>
    PrivilegeMapResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      privilegeCode: json['privilegeCode'] as int?,
      description: json['description'] as String?,
      createdOn: json['createdOn'] as String?,
      editedOn: json['editedOn'] as String?,
    );

Map<String, dynamic> _$PrivilegeMapResponseToJson(
        PrivilegeMapResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'privilegeCode': instance.privilegeCode,
      'description': instance.description,
      'createdOn': instance.createdOn,
      'editedOn': instance.editedOn,
    };

MaterialResponse _$MaterialResponseFromJson(Map<String, dynamic> json) =>
    MaterialResponse(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      materialName: json['materialName'] as String?,
      materialTypeCode: json['materialTypeCode'] as int?,
      description: json['description'] as String?,
      link: json['link'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MaterialResponseToJson(MaterialResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'materialName': instance.materialName,
      'materialTypeCode': instance.materialTypeCode,
      'description': instance.description,
      'link': instance.link,
      'tags': instance.tags,
    };

MaterialTypeResponse _$MaterialTypeResponseFromJson(
        Map<String, dynamic> json) =>
    MaterialTypeResponse(
      id: json['id'] as String?,
      materialType: json['materialType'] as int?,
      materialUrl: json['materialUrl'] as String?,
      materialDescription: json['materialDescription'] as String?,
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      editedOn: json['editedOn'] == null
          ? null
          : DateTime.parse(json['editedOn'] as String),
    );

Map<String, dynamic> _$MaterialTypeResponseToJson(
        MaterialTypeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'materialType': instance.materialType,
      'materialUrl': instance.materialUrl,
      'materialDescription': instance.materialDescription,
      'createdOn': instance.createdOn?.toIso8601String(),
      'editedOn': instance.editedOn?.toIso8601String(),
    };

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      id: json['id'] as String?,
      postId: json['postId'] as String?,
      postedBy: json['postedBy'] as String?,
      replyingTo: json['replyingTo'] as String?,
      content: json['content'] as String?,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dislikes: (json['dislikes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postedOn: json['postedOn'] == null
          ? null
          : DateTime.parse(json['postedOn'] as String),
      editedOn: json['editedOn'] == null
          ? null
          : DateTime.parse(json['editedOn'] as String),
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'postedBy': instance.postedBy,
      'replyingTo': instance.replyingTo,
      'content': instance.content,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'postedOn': instance.postedOn?.toIso8601String(),
      'editedOn': instance.editedOn?.toIso8601String(),
    };
