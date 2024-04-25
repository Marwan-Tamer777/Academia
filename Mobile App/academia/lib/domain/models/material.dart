class Material {
  String id;
  String courseId;
  String materialName;
  int materialTypeCode;
  String description;
  String link;
  List<String> tags;

  Material({
    required this.id,
    required this.courseId,
    required this.materialName,
    required this.materialTypeCode,
    required this.description,
    required this.link,
    required this.tags,
  });

  factory Material.fromJson(Map<String, dynamic> json) {
    return Material(
      id: json['_id'],
      courseId: json['courseId'],
      materialName: json['materialName'],
      materialTypeCode: json['materialTypeCode'],
      description: json['description'],
      link: json['link'],
      tags: List<String>.from(json['tags']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['materialName'] = this.materialName;
    data['materialTypeCode'] = this.materialTypeCode;
    data['description'] = this.description;
    data['link'] = this.link;
    data['tags'] = this.tags;
    return data;
  }
}