import 'package:json_annotation/json_annotation.dart';

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
}


@JsonSerializable()
class AssignmentResponse
{
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
}


@JsonSerializable()
class Date
{
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'timeZone')
  String? timeZone;
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
}


//command to generate the Response.g file from the Response.dart file
//flutter pub run build_runner build --delete-conflicting-outputs