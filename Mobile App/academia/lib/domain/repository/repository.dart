import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/comment.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../models/post.dart';
import '../models/quiz.dart';

abstract class Repository {
    Future<Either<Failure,User>> login(String email, String password);
    Future<Either<Failure,bool>> resetPassword(String email);
    Future<Either<Failure,User>> getUserData(String userId);
    Future<Either<Failure,List<Course>>> getEnrolledCourses(List<String> courseIds);
    Future<Either<Failure,List<User>>> getUsersData(List<String> userIds);
    Future<Either<Failure,Course>> getCourseData(String courseId);

    Future<Either<Failure,bool>> enrollCourse(String courseId, String courseCode);

    Future<Either<Failure,Assignment>> submitAssignment(Assignment assignment);
    Future<Either<Failure,Quiz>> submitQuiz(Quiz quiz);
    Future<Either<Failure,Post>> addPost(Post post);
    Future<Either<Failure,Comment>> addComment(Comment comment);

    Future<Either<Failure,void>> downloadMaterial();
    Future<Either<Failure,List<Course>>> searchCourse(String query);
    Future<Either<Failure,List<User>>> searchUser(String query);
    Future<Either<Failure,List<Post>>> searchPost(String query);

    Future<Either<Failure,void>> provideFeedback(String courseId);
}

// access settings (themes, language)
// categorize materials
