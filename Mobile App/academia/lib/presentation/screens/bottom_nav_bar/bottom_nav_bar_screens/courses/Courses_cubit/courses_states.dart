abstract class CoursesState {}

class CoursesInitialStates extends CoursesState {}

class CoursesLoadingStates extends CoursesState {}

class CoursesSuccessStates extends CoursesState {}

class CoursesErrorStates extends CoursesState {
  final String message;
  CoursesErrorStates(this.message);
}

class CoursesSearchState extends CoursesState {}

// enroll course state
class CoursesEnrolLoadingStates extends CoursesState {}

class CoursesEnrolSuccessStates extends CoursesState {}

class CoursesEnrolErrorStates extends CoursesState {
  final String message;
  CoursesEnrolErrorStates(this.message);
} 

class AddLastAccessedCourses extends CoursesState {} 

class CoursesCategorizedState extends CoursesState {} 

class CoursesFilteredByDepartmentState extends CoursesState {} 


class CoursesUnEnrollLoadingStates extends CoursesState {} 

class CoursesUnEnrollSuccessStates extends CoursesState {}

class CoursesUnEnrollErrorStates extends CoursesState {}