class Course {
  String? id;
  String? name;
  String? description;
  String? courseCode;
  String? enrollCode;
  String? programName;
  List<String>? people;
  List<String>? posts;
  int? currentCapacity;
  int? maxCapacity;
 // List<String>? teachers;
  List<String>? students;
  String? status;
  DateTime? mostRecentDeadline;
  List<String>? quizzes;
  List<String>? materials;
  List<String>? roles;
  String? creatorAt;
  String? updatedAt;


  Course({
    this.id,
    this.name,
    this.description,
    this.courseCode,
    this.enrollCode,
    this.programName,
    this.people,
    this.posts,
    this.currentCapacity,
    this.maxCapacity,
    //this.teachers,
    this.students,
    this.status,
    this.mostRecentDeadline,
    this.quizzes,
    this.materials,
    this.roles,
    this.creatorAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      courseCode: json['courseCode'] ?? '',
      enrollCode: json['enrollCode'] ?? '',
      programName: json['programName'] ?? '',
      people: json['people'].cast<String>(),
      posts: json['posts'].cast<String>(),
      currentCapacity: json['currentCapacity'] ?? '',
      maxCapacity: json['maxCapacity'] ?? '',
     // teachers: json['teachers'].cast<String>(),
      students: json['students'].cast<String>(),
      status: json['status'] ?? '',
      mostRecentDeadline: DateTime.parse(json['mostRecentDeadline']),
      quizzes: json['quizzes'].cast<String>(),
      materials: json['materials'].cast<String>(),
      roles: json['roles'].cast<String>(),
      creatorAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}


