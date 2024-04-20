import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_responses.g.dart';

@JsonSerializable()
class BaseResponse
{
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class UserResponse
{
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'isAdmin')
  bool? isAdmin;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'assignedId')
  String? assignedId;
  @JsonKey(name: 'courses')
  List<String>? courses;
  @JsonKey(name: 'lastAccessedCourse')
  String? lastAccessedCourse;
  @JsonKey(name: 'contacts')
  List<String>? contacts;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'department')
  String? department;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'editedOn')
  String? editedOn;

  UserResponse({required this.name,required this.email,required this.password,required this.isAdmin,required this.avatar,required this.assignedId,required this.courses,required this.lastAccessedCourse,required this.contacts,required this.description,required this.title,required this.department,required this.createdOn,required this.editedOn});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}


@JsonSerializable()
class AssignmentResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'closeOn')
  String? closeOn;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'numOfAttempts')
  int? numOfAttempts;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'editedOn')
  String? editedOn;

  AssignmentResponse({
    required this.id,
    required this.courseId,
    required this.description,
    required this.closeOn,
    required this.duration,
    required this.numOfAttempts,
    required this.createdOn,
    required this.editedOn,
  });

  factory AssignmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentResponseToJson(this);

}


@JsonSerializable()
class AssignmentUserInfoResponse
{
  @JsonKey(name: 'assignmentId')
  String? assignmentId;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'gradedBy')
  String? gradedBy;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'submissionUrl')
  String? submissionUrl;
  @JsonKey(name: 'submissionDate')
  String? submissionDate;
  @JsonKey(name: 'showGrade')
  bool? showGrade;
  @JsonKey(name: 'grade')
  double? grade;
  @JsonKey(name: 'maxGrade')
  double? maxGrade;

  AssignmentUserInfoResponse({
    required this.assignmentId,
    required this.userId,
    required this.gradedBy,
    required this.courseId,
    required this.submissionUrl,
    required this.submissionDate,
    required this.showGrade,
    required this.grade,
    required this.maxGrade,
  });

  factory AssignmentUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$AssignmentUserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentUserInfoResponseToJson(this);
}


@JsonSerializable()
class ActionMapResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'editedOn')
  String? editedOn;

  ActionMapResponse({
    required this.id,
    required this.description,
    required this.createdOn,
    required this.editedOn,
  });

  factory ActionMapResponse.fromJson(Map<String, dynamic> json) =>
      _$ActionMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActionMapResponseToJson(this);
}


@JsonSerializable()
class CoursePollResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'options')
  List<String>? options;
  @JsonKey(name: 'votes')
  List<int>? votes;
  @JsonKey(name: 'closePollDate')
  DateTime? closePollDate;
  @JsonKey(name: 'totalVoters')
  int? totalVoters;

  CoursePollResponse({
    required this.id,
    required this.courseId,
    required this.options,
    required this.votes,
    required this.closePollDate,
    required this.totalVoters,
  });

  factory CoursePollResponse.fromJson(Map<String, dynamic> json) =>
      _$CoursePollResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CoursePollResponseToJson(this);
}


@JsonSerializable()
class CourseRoleResponse
{
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'roleCode')
  int? roleCode;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'level')
  int? level;
  @JsonKey(name: 'privileges')
  List<int>? privileges;

  CourseRoleResponse({
    required this.courseId,
    required this.roleCode,
    required this.role,
    required this.level,
    required this.privileges,
  });

  factory CourseRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseRoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseRoleResponseToJson(this);
}


@JsonSerializable()
class CourseResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'courseCode')
  String? courseCode;
  @JsonKey(name: 'enrollCode')
  String? enrollCode;
  @JsonKey(name: 'programName')
  String? programName;
  @JsonKey(name: 'people')
  List<String>? people;
  @JsonKey(name: 'posts')
  List<String>? posts;
  @JsonKey(name: 'currentCapacity')
  int? currentCapacity;
  @JsonKey(name: 'maxCapacity')
  int? maxCapacity;
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'mostRecentDeadline')
  DateTime? mostRecentDeadline;
  @JsonKey(name: 'quizzes')
  List<String>? quizzes;
  @JsonKey(name: 'materials')
  List<String>? materials;

  CourseResponse({
    required this.id,
    required this.name,
    required this.courseCode,
    required this.enrollCode,
    required this.programName,
    required this.people,
    required this.posts,
    required this.currentCapacity,
    required this.maxCapacity,
    required this.status,
    required this.mostRecentDeadline,
    required this.quizzes,
    required this.materials,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}


@JsonSerializable()
class PostResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'title')
  String? postedBy;
  @JsonKey(name: 'postType')
  bool? postNow;
  @JsonKey(name: 'postingDate')
  DateTime? postingDate;
  @JsonKey(name: 'content')
  String? content;
  @JsonKey(name: 'material')
  List<String>? material;
  @JsonKey(name: 'quizId')
  String? quizId;
  @JsonKey(name: 'assignmentId')
  String? assignmentId;
  @JsonKey(name: 'alertUsers')
  bool? alertUsers;
  @JsonKey(name: 'alertDate')
  DateTime? alertDate;
  @JsonKey(name: 'comments')
  List<String>? comments;
  @JsonKey(name: 'likes')
  List<String>? likes;
  @JsonKey(name: 'dislikes')
  List<String>? dislikes;
  @JsonKey(name: 'postedOn')
  DateTime? postedOn;
  @JsonKey(name: 'editedOn')
  DateTime? editedOn;

  PostResponse({
    required this.id,
    required this.courseId,
    required this.postedBy,
    required this.postNow,
    required this.postingDate,
    required this.content,
    required this.material,
    required this.quizId,
    required this.assignmentId,
    required this.alertUsers,
    required this.alertDate,
    required this.comments,
    required this.likes,
    required this.dislikes,
    required this.postedOn,
    required this.editedOn,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}


@JsonSerializable()
class QuizResponse
{
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'quizName')
  String? quizName;
  @JsonKey(name: 'questions')
  List<String>? questions;
  @JsonKey(name: 'numOfRetries')
  int? numOfRetries;
  @JsonKey(name: 'duration')
  String? duration;
  @JsonKey(name: 'startDate')
  String? startDate;
  @JsonKey(name: 'endDate')
  String? endDate;
  @JsonKey(name: 'showGrade')
  bool? showGrade;
  @JsonKey(name: 'showWrongAnswers')
  bool? showWrongAnswers;
  @JsonKey(name: 'showCorrectAnswers')
  bool? showCorrectAnswers;

  QuizResponse({
    required this.courseId,
    required this.quizName,
    required this.questions,
    required this.numOfRetries,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.showGrade,
    required this.showWrongAnswers,
    required this.showCorrectAnswers,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizResponseToJson(this);
}


@JsonSerializable()
class QuizUserInfoResponse
{
  @JsonKey(name: 'quizId')
  String? quizId;
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'gradedBy')
  String? gradedBy;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'submissionUrl')
  String? submissionUrl;
  @JsonKey(name: 'submissionDate')
  String? submissionDate;
  @JsonKey(name: 'showGrade')
  bool? showGrade;
  @JsonKey(name: 'grade')
  double? grade;
  @JsonKey(name: 'maxGrade')
  double? maxGrade;

  QuizUserInfoResponse({
    required this.quizId,
    required this.userId,
    required this.gradedBy,
    required this.courseId,
    required this.submissionUrl,
    required this.submissionDate,
    required this.showGrade,
    required this.grade,
    required this.maxGrade,
  });

  factory QuizUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$QuizUserInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuizUserInfoResponseToJson(this);
}


@JsonSerializable()
class QuestionResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'quizId')
  String? quizId;
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: 'options')
  List<String>? options;
  @JsonKey(name: 'correctAnswer')
  String? correctAnswer;
  @JsonKey(name: 'multipleAnswers')
  bool? multipleAnswers;
  @JsonKey(name: 'correctAnswers')
  List<String>? correctAnswers;
  @JsonKey(name: 'weight')
  int? weight;

  QuestionResponse({
    required this.id,
    required this.quizId,
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.multipleAnswers,
    required this.correctAnswers,
    required this.weight,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}


@JsonSerializable()
class TicketResponse
{
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'description')
  String? submittedBy;
  @JsonKey(name: 'details')
  List<String>? details;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'adminResponses')
  List<String>? adminResponses;
  @JsonKey(name: 'attachments')
  List<String>? attachments;
  @JsonKey(name: 'assignedTo')
  String? assignedTo;
  @JsonKey(name: 'priority')
  String? priority;
  @JsonKey(name: 'submittedOn')
  Date? submittedOn;
  @JsonKey(name: 'editedOn')
  Date? editedOn;

  TicketResponse({
    required this.courseId,
    required this.submittedBy,
    required this.details,
    required this.status,
    required this.adminResponses,
    required this.attachments,
    required this.assignedTo,
    required this.priority,
    required this.submittedOn,
    required this.editedOn,
  });

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TicketResponseToJson(this);
}


@JsonSerializable()
class Date
{
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'timeZone')
  String? timeZone;


  Date({
    required this.date,
    required this.timeZone,
  });

  factory Date.fromJson(Map<String, dynamic> json) =>
      _$DateFromJson(json);

  Map<String, dynamic> toJson() => _$DateToJson(this);
}


@JsonSerializable()
class RoleResponse
{
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'roleName')
  String? roleName;
  @JsonKey(name: 'roleCode')
  int? roleCode;
  @JsonKey(name: 'level')
  int? level;
  @JsonKey(name: 'privileges')
  List<String>? privileges;
  @JsonKey(name: 'description')
  String? description;

  RoleResponse({
    required this.courseId,
    required this.roleName,
    required this.roleCode,
    required this.level,
    required this.privileges,
    required this.description,
  });

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);
}


@JsonSerializable()
class UserCourseResponse
{
  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'role')
  int? role;
  @JsonKey(name: 'mostRecentGrade')
  int? mostRecentGrade;
  @JsonKey(name: 'latestSeenPostDate')
  DateTime? latestSeenPostDate;

  UserCourseResponse({
    required this.userId,
    required this.courseId,
    required this.role,
    required this.mostRecentGrade,
    required this.latestSeenPostDate,
  });

  factory UserCourseResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCourseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserCourseResponseToJson(this);
}


@JsonSerializable()
class TagResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'tagName')
  String? tagName;


  TagResponse({
    required this.id,
    required this.courseId,
    required this.tagName,
  });

  factory TagResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TagResponseToJson(this);
}


@JsonSerializable()
class StatementResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'actor')
  String? actor;
  @JsonKey(name: 'action')
  String? action;
  @JsonKey(name: 'context')
  String? context;
  @JsonKey(name: 'object')
  String? object;

  StatementResponse({
    required this.id,
    required this.actor,
    required this.action,
    required this.context,
    required this.object,
  });

  factory StatementResponse.fromJson(Map<String, dynamic> json) =>
      _$StatementResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatementResponseToJson(this);
}


@JsonSerializable()
class PrivilegeResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'privilegeCode')
  String? privilegeCode;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'editedOn')
  String? editedOn;

  PrivilegeResponse({
    required this.id,
    required this.privilegeCode,
    required this.description,
    required this.createdOn,
    required this.editedOn,
  });

  factory PrivilegeResponse.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeResponseToJson(this);
}


@JsonSerializable()
class PrivilegeMapResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'privilegeCode')
  int? privilegeCode;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'editedOn')
  String? editedOn;

  PrivilegeMapResponse({
    required this.id,
    required this.courseId,
    required this.privilegeCode,
    required this.description,
    required this.createdOn,
    required this.editedOn,
  });

  factory PrivilegeMapResponse.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeMapResponseToJson(this);
}


@JsonSerializable()
class MaterialResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'courseId')
  String? courseId;
  @JsonKey(name: 'materialName')
  String? materialName;
  @JsonKey(name: 'materialTypeCode')
  int? materialTypeCode;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'tags')
  List<String>? tags;

  MaterialResponse({
    required this.id,
    required this.courseId,
    required this.materialName,
    required this.materialTypeCode,
    required this.description,
    required this.link,
    required this.tags,
  });

  factory MaterialResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialResponseToJson(this);
}


@JsonSerializable()
class MaterialTypeResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'materialType')
  int? materialType;
  @JsonKey(name: 'materialUrl')
  String? materialUrl;
  @JsonKey(name: 'materialDescription')
  String? materialDescription;
  @JsonKey(name: 'createdOn')
  DateTime? createdOn;
  @JsonKey(name: 'editedOn')
  DateTime? editedOn;

  MaterialTypeResponse({
    required this.id,
    required this.materialType,
    required this.materialUrl,
    required this.materialDescription,
    required this.createdOn,
    required this.editedOn,
  });

  factory MaterialTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$MaterialTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialTypeResponseToJson(this);
}


@JsonSerializable()
class CommentResponse
{
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'postId')
  String? postId;
  @JsonKey(name: 'postedBy')
  String? postedBy;
  @JsonKey(name: 'replyingTo')
  String? replyingTo;
  @JsonKey(name: 'content')
  String? content;
  @JsonKey(name: 'likes')
  List<String>? likes;
  @JsonKey(name: 'dislikes')
  List<String>? dislikes;
  @JsonKey(name: 'postedOn')
  DateTime? postedOn;
  @JsonKey(name: 'editedOn')
  DateTime? editedOn;

  CommentResponse({
    required this.id,
    required this.postId,
    required this.postedBy,
    required this.replyingTo,
    required this.content,
    required this.likes,
    required this.dislikes,
    required this.postedOn,
    required this.editedOn,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}


//command to generate the Response.g file from the Response.dart file
//dart run build_runner build --delete-conflicting-outputs

