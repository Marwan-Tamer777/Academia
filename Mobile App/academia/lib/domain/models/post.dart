import 'package:academia/domain/models/quiz.dart';
import 'package:academia/domain/models/user.dart';

class Post {
  String? id;
  String? courseId;
  String? postedBy;
  bool? postNow;
  DateTime? postingDate; 
  String? title;
  String? content; 
  bool? alertUsers; 
  String? alertDate;
  bool? allowComments;
  List<String>? comments;
  List<String>? likes;
  List<String>? dislikes; 
  Quiz? quiz;
  String? postedOn;
  DateTime? editedOn; 
  User? user;

  Post({
         this.id,
         this.courseId,
         this.postedBy,
         this.postNow,
         this.postingDate, 
         this.title,
         this.content,
         this.alertUsers,
         this.alertDate,
         this.comments,
         this.allowComments,
         this.likes,
         this.dislikes,
         this.quiz,
         this.postedOn,
         this.editedOn,
         this.user
  }); 

   List<Post> fromJsonList(List<dynamic> json) {
    List<Post> posts = [];
    for (var post in json) {
      posts.add(Post.fromJson(post));
    }
    return posts;
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      courseId: json['courseId'] ?? '',
      postedBy: json['postedBy'] ?? '',
      postNow: json['postNow'] ?? false,
      postingDate: DateTime.parse(json['postingDate']),
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      alertUsers: json['alertUsers'] ?? false,
      alertDate: json['alertDate'] ?? '',
      comments: List<String>.from(json['comments']) ?? [],
      allowComments: json['allowComments'] ?? false,
      likes: List<String>.from(json['likes']) ?? [],
      dislikes: List<String>.from(json['dislikes']) ?? [],
      quiz: json['quiz'] != null ? Quiz.fromJson(json['quiz']) : null,
      postedOn: json['postedOn'] ?? '',
      editedOn: DateTime.parse(json['editedOn']) ?? DateTime.now(), 
      user: json['userData'] != null ? User.fromJson(json['userData']) : null
    );
  }

}
