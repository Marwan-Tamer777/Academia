import 'package:academia/domain/models/user.dart';

class Comment {
  final String? id;
  final String? postId;
  final String? postedBy;
  final String? replyingTo;
  final String? content;
  final List<String>? likes;
  final List<String>? dislikes;
  final DateTime? postedOn;
  final DateTime? editedOn; 
  User? user;

Comment({
     this.id,
     this.postId,
     this.postedBy,
     this.replyingTo,
     this.content,
     this.likes,
     this.dislikes,
     this.postedOn,
     this.editedOn, 
      this.user,
  });

   List<Comment> fromJsonList(List<dynamic> json) {
    List<Comment> comment = [];
    for (var post in json) {
      comment.add(Comment.fromJson(post));
    }
    return comment;
  }


  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'],
      postId: json['postId'],
      postedBy: json['postedBy'],
      replyingTo: json['replyingTo'],
      content: json['content'],
      likes: List<String>.from(json['likes']),
      dislikes: List<String>.from(json['dislikes']),
      postedOn: DateTime.parse(json['postedOn']),
      editedOn: DateTime.parse(json['editedOn']),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     '_id': id,
  //     'postId': postId,
  //     'postedBy': postedBy,
  //     'replyingTo': replyingTo,
  //     'content': content,
  //     'likes': likes,
  //     'dislikes': dislikes,
  //     'postedOn': postedOn.toIso8601String(),
  //     'editedOn': editedOn.toIso8601String(),
  //   };
  // }
}