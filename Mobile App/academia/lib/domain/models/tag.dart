class Tag {
  String? id;
  String? courseId;
  String? tagName;

  Tag({required this.id,required this.courseId,required this.tagName});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    courseId = json['courseId'];
    tagName = json['tagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['courseId'] = courseId;
    data['tagName'] = tagName;
    return data;
  }
}