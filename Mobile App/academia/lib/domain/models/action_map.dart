class ActionMap {
  String id;
  String description;
  DateTime createdOn;
  DateTime editedOn;

  ActionMap({required this.id,required this.description,required this.createdOn,required this.editedOn});

  factory ActionMap.fromJson(Map<String, dynamic> json) {
    return ActionMap(
      id: json['_id'],
      description: json['description'],
      createdOn: DateTime.parse(json['createdOn']),
      editedOn: DateTime.parse(json['editedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'description': description,
      'createdOn': createdOn.toIso8601String(),
      'editedOn': editedOn.toIso8601String(),
    };
  }
}
