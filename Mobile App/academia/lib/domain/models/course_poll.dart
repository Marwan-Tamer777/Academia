class CoursePoll {
  String id;
  String courseId;
  List<String> options;
  List<int> votes;
  DateTime closePollDate;
  int totalVoters;

  CoursePoll({
    required this.id,
    required this.courseId,
    required this.options,
    required this.votes,
    required this.closePollDate,
    required this.totalVoters,
  });

  factory CoursePoll.fromJson(Map<String, dynamic> json) {
    return CoursePoll(
      id: json['_id'],
      courseId: json['courseId'],
      options: json['options'].cast<String>(),
      votes: json['votes'].cast<int>(),
      closePollDate: DateTime.parse(json['closePollDate']),
      totalVoters: json['totalVoters'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'courseId': courseId,
      'options': options,
      'votes': votes,
      'closePollDate': closePollDate.toIso8601String(),
      'totalVoters': totalVoters,
    };
  }
}
