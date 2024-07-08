class Assignment {
  String id;
  String courseId;
  String description;
  String closeOn;
  int duration;
  int numOfAttempts;
  bool showGrade; 
  int grade;
  String createdOn;
  String editedOn;

    Assignment({
        required this.id,
        required this.courseId,
        required this.description,
        required this.closeOn,
        required this.duration,
        required this.numOfAttempts,
        required this.createdOn,
        required this.editedOn, 
        required this.showGrade, 
        required this.grade, 
    });

    factory Assignment.fromJson(Map<String, dynamic> json) {
        return Assignment(
            id: json['_id'],
            courseId: json['courseId'],
            description: json['description'],
            closeOn: json['closeOn'],
            duration: json['duration'],
            numOfAttempts: json['numOfAttempts'], 
            showGrade: json['showGrade'], 
            grade: json['grade'], 
            createdOn: json['createdOn'],
            editedOn: json['editedOn'],
        );
    }
    }
