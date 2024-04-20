class Quiz {
  final String courseId;
  final String quizName;
  final List<String> questions;
  final int numOfRetries;
  final String duration;
  final String startDate;
  final String endDate;
  final bool showGrade;
  final bool showWrongAnswers;
  final bool showCorrectAnswers;

  Quiz({
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

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      courseId: json['courseId'],
      quizName: json['quizName'],
      questions: List<String>.from(json['questions']),
      numOfRetries: json['numOfRetries'],
      duration: json['duration'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      showGrade: json['showGrade'],
      showWrongAnswers: json['showWrongAnswers'],
      showCorrectAnswers: json['showCorrectAnswers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'quizName': quizName,
      'questions': questions,
      'numOfRetries': numOfRetries,
      'duration': duration,
      'startDate': startDate,
      'endDate': endDate,
      'showGrade': showGrade,
      'showWrongAnswers': showWrongAnswers,
      'showCorrectAnswers': showCorrectAnswers,
    };
  }
}