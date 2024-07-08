class Quiz {
  final String? id;
  final String? courseId; 
  final String? quizName;
  final String? description;
  final List<String>? questions;
  final int? numOfRetries; 
  final int? grade;
  final String? duration;
  final String? startDate;
  final String? endDate; 
  final bool? autoGrade;
  final bool? showGrade;
  final bool? showWrongAnswers;
  final bool? showCorrectAnswers; 
  final String? createdOn;
  final String? updatedOn;


  Quiz({
    this.id, 
    this.grade, 
    this.autoGrade,
     this.createdOn, 
     this.updatedOn,
     this.courseId,
     this.quizName,
      this.description,
     this.questions,
     this.numOfRetries,
     this.duration,
     this.startDate,
     this.endDate,
     this.showGrade,
     this.showWrongAnswers,
     this.showCorrectAnswers,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz( 
      id: json['_id'],
      autoGrade: json['autoGrade'], 
      createdOn: json['createdOn'], 
      updatedOn: json['updatedOn'], 
      grade: json['grade'], 
      courseId: json['courseId'],
      quizName: json['quizName'],
      description: json['quizDescription'] ?? '',
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
}