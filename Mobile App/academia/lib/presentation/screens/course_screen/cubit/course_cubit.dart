import 'package:academia/app/constants.dart';
import 'package:academia/app/dep_injection.dart';
import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/comment.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/domain/models/post.dart';
import 'package:academia/domain/models/user.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/profile_cubit/profile_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_cubit.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseStates> {
  CourseCubit() : super(CourseInitialState());

  static CourseCubit of(context) => BlocProvider.of<CourseCubit>(context); 

  List<String> categories = [AppStrings.warnings, AppStrings.assignments,AppStrings.posts]; 

  Course? course; 
  void setCourse(Course course) {
    this.course = course; 
    getAssignments(); 
    getPosts();
    emit(SetCourseState());   
  }
  
  List<Assignment> assignments = []; 

  void getAssignments() {
    var cubit = getItInstance<AssignmentsCubit>(); 
    for (var element in cubit.assignments!) {
      if(element.courseId == course!.id) {
        assignments.add(element); 
      }
    }  
    print("Assignments: ${assignments.length}");
  }


  int currentTab = 2; 

  void changeTab(int index) {
    currentTab = index; 
    emit(ChangeTapState());
  }  

  List<Post> posts = [];
  List<Post> warnings = [];

  void getPosts() async { 
    posts = []; 
    warnings = [];
    assignments = [];
        emit(GetPostsLoadingState()); 
    try {
      await DioHelper.getData(url: EndPoint.posts, token: userToken).then((value) {
          if(value.statusCode == 200) {
            List<Post> allPosts = Post().fromJsonList(value.data['posts']);
            posts.addAll(allPosts.where((element) => element.courseId == course!.id)); 
            warnings.addAll(posts.where((element) => element.alertUsers == true));
            emit(GetPostsSuccessState()); 
          } else {  
            emit(GetPostsErrorState(value.statusMessage.toString()));
          }
      }).catchError((error) { 
        emit(GetPostsErrorState(error.toString())); 
      }); 
    } catch (e) {
      emit(GetPostsErrorState(e.toString())); 
    }
  } 

  void unEnrollCourse() async {
    emit(UnEnrollCourseLoadingState()); 
      var coursesCubit = getItInstance<CoursesCubit>(); 
            coursesCubit.unEnrollCourse(course!.id!).then((value) {
                emit(UnEnrollCourseSuccessState()); 

            }).catchError((error) {
              emit(UnEnrollCourseErrorState(error.toString())); 
            });

  } 

  void onSelectPost(Post post) { 
    getPostComments(post);
  }



    List<Comment>? comments;
    Future<void> getPostComments(Post post) async { 
      comments = []; 
      emit(GetPostCommentsLoadingState()); 
      try {
        await DioHelper.getData(url: EndPoint.comments, token: userToken).then((value) {
            if(value.statusCode == 200) {
              comments = Comment().fromJsonList(value.data);
              comments!.forEach((element) async {
                User? user = await getItInstance<ProfileCubit>().getUserData(element.postedBy!);
                element.user = user;
              });

              emit(GetPostCommentsSuccessState()); 
            } else {  
              emit(GetPostCommentsErrorState(value.statusMessage.toString()));
            }
        }).catchError((error) { 
          emit(GetPostCommentsErrorState(error.toString())); 
        }); 
      } catch (e) {
        emit(GetPostCommentsErrorState(e.toString())); 
      }
    }
}