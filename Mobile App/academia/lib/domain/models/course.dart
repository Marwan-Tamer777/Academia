class Course {
  String id;
  String name;
  String courseCode;
  String enrollCode;
  String programName;
  List<String> people;
  List<String> posts;
  int currentCapacity;
  int maxCapacity;
  int status;
  DateTime mostRecentDeadline;
  List<String> quizzes;
  List<String> materials;

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      name: json['name'],
      courseCode: json['courseCode'],
      enrollCode: json['enrollCode'],
      programName: json['programName'],
      people: json['people'].cast<String>(),
      posts: json['posts'].cast<String>(),
      currentCapacity: json['currentCapacity'],
      maxCapacity: json['maxCapacity'],
      status: json['status'],
      mostRecentDeadline: DateTime.parse(json['mostRecentDeadline']),
      quizzes: json['quizzes'].cast<String>(),
      materials: json['materials'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['courseCode'] = this.courseCode;
    data['enrollCode'] = this.enrollCode;
    data['programName'] = this.programName;
    data['people'] = this.people;
    data['posts'] = this.posts;
    data['currentCapacity'] = this.currentCapacity;
    data['maxCapacity'] = this.maxCapacity;
    data['status'] = this.status;
    data['mostRecentDeadline'] = this.mostRecentDeadline.toIso8601String();
    data['quizzes'] = this.quizzes;
    data['materials'] = this.materials;
    return data;
  }
}
