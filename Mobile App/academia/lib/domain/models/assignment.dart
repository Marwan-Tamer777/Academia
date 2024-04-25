class Assignment {
  String id;
  String courseId;
  String description;
  DateTime closeOn;
  int duration;
  int numOfAttempts;
  DateTime createdOn;
  DateTime editedOn;

    Assignment({
        required this.id,
        required this.courseId,
        required this.description,
        required this.closeOn,
        required this.duration,
        required this.numOfAttempts,
        required this.createdOn,
        required this.editedOn,
    });

    factory Assignment.fromJson(Map<String, dynamic> json) {
        return Assignment(
            id: json['_id'],
            courseId: json['courseId'],
            description: json['description'],
            closeOn: json['closeOn'],
            duration: json['duration'],
            numOfAttempts: json['numOfAttempts'],
            createdOn: json['createdOn'],
            editedOn: json['editedOn'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            '_id': id,
            'courseId': courseId,
            'description': description,
            'closeOn': closeOn,
            'duration': duration,
            'numOfAttempts': numOfAttempts,
            'createdOn': createdOn,
            'editedOn': editedOn,
        };
    }
}
