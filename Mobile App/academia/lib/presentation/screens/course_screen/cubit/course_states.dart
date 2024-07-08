abstract class CourseStates {} 

class CourseInitialState extends CourseStates {} 

class CourseLoadingState extends CourseStates {} 

class CourseSuccessState extends CourseStates {} 

class CourseErrorState extends CourseStates { 
  final String error; 
  CourseErrorState(this.error);
} 

class ChangeTapState extends CourseStates {} 

class SetCourseState extends CourseStates {}


class GetPostsLoadingState extends CourseStates {}

class GetPostsSuccessState extends CourseStates {}

class GetPostsErrorState extends CourseStates {
  final String error;
  GetPostsErrorState(this.error);
}

class UnEnrollCourseLoadingState extends CourseStates {} 

class UnEnrollCourseSuccessState extends CourseStates {}

class UnEnrollCourseErrorState extends CourseStates {
  final String error; 
  UnEnrollCourseErrorState(this.error);
} 


class GetPostCommentsLoadingState extends CourseStates {} 

class GetPostCommentsSuccessState extends CourseStates {}

class GetPostCommentsErrorState extends CourseStates {
  final String error; 
  GetPostCommentsErrorState(this.error);
}