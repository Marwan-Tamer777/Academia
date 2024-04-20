class MaterialMap {
  String id;
  int materialType;
  String materialUrl;
  String materialDescription;
  DateTime createdOn;
  DateTime editedOn;

  MaterialMap({
    required this.id,
    required this.materialType,
    required this.materialUrl,
    required this.materialDescription,
    required this.createdOn,
    required this.editedOn,
  });

  factory MaterialMap.fromJson(Map<String, dynamic> json) {
    return MaterialMap(
      id: json['_id'],
      materialType: json['materialType'],
      materialUrl: json['materialUrl'],
      materialDescription: json['materialDescription'],
      createdOn: DateTime.parse(json['createdOn']),
      editedOn: DateTime.parse(json['editedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'materialType': materialType,
      'materialUrl': materialUrl,
      'materialDescription': materialDescription,
      'createdOn': createdOn.toIso8601String(),
      'editedOn': editedOn.toIso8601String(),
    };
  }
}