class CourseRoles {
  String courseId;
  int roleCode;
  String role;
  int level;
  List<int> privileges;

  CourseRoles({
    required this.courseId,
    required this.roleCode,
    required this.role,
    required this.level,
    required this.privileges,
  });

  factory CourseRoles.fromJson(Map<String, dynamic> json) {
    return CourseRoles(
      courseId: json['courseId'],
      roleCode: json['roleCode'],
      role: json['role'],
      level: json['level'],
      privileges: json['privileges'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'roleCode': roleCode,
      'role': role,
      'level': level,
      'privileges': privileges,
    };
  }
}