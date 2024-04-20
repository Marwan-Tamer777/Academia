class PrivilegeMap {
  String id;
  String courseId;
  int privilegeCode;
  String description;
  String createdOn;
  String editedOn;

  PrivilegeMap({
    required this.id,
    required this.courseId,
    required this.privilegeCode,
    required this.description,
    required this.createdOn,
    required this.editedOn,
  });

  factory PrivilegeMap.fromJson(Map<String, dynamic> json) {
    return PrivilegeMap(
      id: json['_id'],
      courseId: json['courseId'],
      privilegeCode: json['privilegeCode'],
      description: json['description'],
      createdOn: json['createdOn'],
      editedOn: json['editedOn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'courseId': courseId,
      'privilegeCode': privilegeCode,
      'description': description,
      'createdOn': createdOn,
      'editedOn': editedOn,
    };
  }
}
