class Privilege {
  String id;
  String privilegeCode;
  String description;
  String createdOn;
  String editedOn;

  Privilege({required this.id,required this.privilegeCode,required this.description,required this.createdOn,required this.editedOn});

  factory Privilege.fromJson(Map<String, dynamic> json) {
    return Privilege(
      id: json['_id'],
      privilegeCode: json['privilegeCode'],
      description: json['description'],
      createdOn: json['createdOn'],
      editedOn: json['editedOn'],
    );
  }

    Map<String, dynamic> toJson() {
        return {
        '_id': id,
        'privilegeCode': privilegeCode,
        'description': description,
        'createdOn': createdOn,
        'editedOn': editedOn,
        };
    }
}