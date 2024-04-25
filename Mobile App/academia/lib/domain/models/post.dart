class Post {
  String id;
  String courseId;
  String postedBy;
  bool postNow;
  DateTime postingDate;
  String content;
  List<String> material;
  String quizId;
  String assignmentId;
  bool alertUsers;
  DateTime alertDate;
  List<String> comments;
  List<String> likes;
  List<String> dislikes;
  DateTime postedOn;
  DateTime editedOn;

  Post({
        required this.id,
        required this.courseId,
        required this.postedBy,
        required this.postNow,
        required this.postingDate,
        required this.content,
        required this.material,
        required this.quizId,
        required this.assignmentId,
        required this.alertUsers,
        required this.alertDate,
        required this.comments,
        required this.likes,
        required this.dislikes,
        required this.postedOn,
        required this.editedOn,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      courseId: json['courseId'],
      postedBy: json['postedBy'],
      postNow: json['postNow'],
      postingDate: DateTime.parse(json['postingDate']),
      content: json['content'],
      material: List<String>.from(json['material']),
      quizId: json['quizId'],
      assignmentId: json['assignmentId'],
      alertUsers: json['alertUsers'],
      alertDate: DateTime.parse(json['alertDate']),
      comments: List<String>.from(json['comments']),
      likes: List<String>.from(json['likes']),
      dislikes: List<String>.from(json['dislikes']),
      postedOn: DateTime.parse(json['postedOn']),
      editedOn: DateTime.parse(json['editedOn']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['courseId'] = courseId;
    data['postedBy'] = postedBy;
    data['postNow'] = postNow;
    data['postingDate'] = postingDate.toIso8601String();
    data['content'] = content;
    data['material'] = material;
    data['quizId'] = quizId;
    data['assignmentId'] = assignmentId;
    data['alertUsers'] = alertUsers;
    data['alertDate'] = alertDate.toIso8601String();
    data['comments'] = comments;
    data['likes'] = likes;
    data['dislikes'] = dislikes;
    data['postedOn'] = postedOn.toIso8601String();
    data['editedOn'] = editedOn.toIso8601String();
    return data;
    }
}
