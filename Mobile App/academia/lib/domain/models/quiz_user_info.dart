import 'package:academia/domain/models/ticket.dart';

class QuizUserInfo {
    String quizId;
    String userId;
    String courseId;
    String submissionUrl;
    Date submissionDate;
    bool showGrade;
    int grade;
    int maxGrade;

    QuizUserInfo({
        required this.quizId,
        required this.userId,
        required this.courseId,
        required this.submissionUrl,
        required this.submissionDate,
        required this.showGrade,
        required this.grade,
        required this.maxGrade,
    });

    // fromJson
    factory QuizUserInfo.fromJson(Map<String, dynamic> json) {
        return QuizUserInfo(
            quizId: json['quizId'],
            userId: json['userId'],
            courseId: json['courseId'],
            submissionUrl: json['submissionUrl'],
            submissionDate: json['submissionDate'],
            showGrade: json['showGrade'],
            grade: json['grade'],
            maxGrade: json['maxGrade'],
        );
    }

    // toJson
    Map<String, dynamic> toJson() {
        return {
            'quizId': quizId,
            'userId': userId,
            'courseId': courseId,
            'submissionUrl': submissionUrl,
            'submissionDate': submissionDate,
            'showGrade': showGrade,
            'grade': grade,
            'maxGrade': maxGrade,
        };
    }
}