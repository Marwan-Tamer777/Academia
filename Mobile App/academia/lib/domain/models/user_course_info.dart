class UserCourseInfo {
    String userId;
    String courseId;
    int role;
    int mostRecentGrade;
    DateTime latestSeenPostDate;

    UserCourseInfo({
        required this.userId,
        required this.courseId,
        required this.role,
        required this.mostRecentGrade,
        required this.latestSeenPostDate,
    });

    factory UserCourseInfo.fromJson(Map<String, dynamic> json) {
        return UserCourseInfo(
            userId: json['userId'],
            courseId: json['courseId'],
            role: json['role'],
            mostRecentGrade: json['mostRecentGrade'],
            latestSeenPostDate: json['latestSeenPostDate'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'userId': userId,
            'courseId': courseId,
            'role': role,
            'mostRecentGrade': mostRecentGrade,
            'latestSeenPostDate': latestSeenPostDate,
        };
    }
}