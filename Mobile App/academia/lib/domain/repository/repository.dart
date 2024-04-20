import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/comment.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../models/post.dart';
import '../models/quiz.dart';

abstract class Repository {
    Future<Either<Failure,String>> login(String email, String password);
    Future<Either<Failure,bool>> resetPassword(String email);
    Future<Either<Failure,User>> getUserData(String userId);
    Future<Either<Failure,Course>> getCourseData(String courseId);
    Future<Either<Failure,bool>> enrollCourse(String courseId);
    Future<Either<Failure,bool>> submitAssignment(Assignment assignment);
    Future<Either<Failure,bool>> submitQuiz(Quiz quiz);
    Future<Either<Failure,bool>> addPost(Post post);
    Future<Either<Failure,void>> addComment(Comment comment);
    Future<Either<Failure,void>> downloadMaterial();
    Future<Either<Failure,List<Course>>> search(String query);
    Future<Either<Failure,void>> trackProgress(String courseId);
    Future<Either<Failure,void>> provideFeedback(String courseId);
}

// access settings (themes, language)
// categorize materials
