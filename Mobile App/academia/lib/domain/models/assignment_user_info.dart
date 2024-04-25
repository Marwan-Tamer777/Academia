class AssignmentUserInfo {
  String assignmentId;
  String userId;
  String gradedBy;
  String courseId;
  String submissionUrl;
  DateTime submissionDate;
  bool showGrade;
  double grade;
  double maxGrade;

  AssignmentUserInfo({
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

  AssignmentUserInfo.fromJson(Map<String, dynamic> json)
      : assignmentId = json['assignmentId'],
        userId = json['userId'],
        gradedBy = json['gradedBy'],
        courseId = json['courseId'],
        submissionUrl = json['submissionUrl'],
        submissionDate = DateTime.parse(json['submissionDate']),
        showGrade = json['showGrade'],
        grade = json['grade'],
        maxGrade = json['maxGrade'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assignmentId'] = assignmentId;
    data['userId'] = userId;
    data['gradedBy'] = gradedBy;
    data['courseId'] = courseId;
    data['submissionUrl'] = submissionUrl;
    data['submissionDate'] = submissionDate.toIso8601String();
    data['showGrade'] = showGrade;
    data['grade'] = grade;
    data['maxGrade'] = maxGrade;
    return data;
  }
}