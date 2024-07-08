import 'package:academia/app/constants.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/domain/models/main_schema.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/widgets/last_accessed_courses.dart';
import 'package:academia/presentation/widgets/list_views_items/last_accessed_course_item.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../data/network/dio_helpers/dio_helpers.dart';
import '../../../../../../../data/network/dio_helpers/end_points.dart';
import 'courses_states.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitialStates());

  static CoursesCubit of(context) => BlocProvider.of(context);

  bool isSearch = false;
  CarouselController carouselController = CarouselController();
  TextEditingController searchController = TextEditingController();

  List<Course> myCourses = [];
  List<Course> myLastAccessedCourses = [];
  List<Course> allCourses = [];

  Future<void> getCourses() async {
    myCourses.clear();
    myLastAccessedCourses.clear();
    allCourses.clear();
    emit(CoursesLoadingStates());
    try {
      await DioHelper.getData(url: EndPoint.courses, token: userToken)
          .then((value) {
        allCourses =
            (value.data as List).map((e) => Course.fromJson(e)).toList();
        print(allCourses.length);
        for (var element in allCourses) {
          if (element.students!.contains(userId)) {
            myCourses.add(element);
          }
        }

        for (var element in userData!.lastAccessedCourse!) {
          myLastAccessedCourses
              .add(allCourses.firstWhere((course) => course.id == element));
        }
        categorizeCourses();
        emit(CoursesSuccessStates());
      }).catchError((error) {
        emit(CoursesErrorStates(error.toString()));
      });
    } catch (e) {
      emit(CoursesErrorStates(e.toString()));
    }
  }

  // enroll in course by sending course id to the server
  Future<void> enrollInCourse(String courseId, String code) async {
    emit(CoursesEnrolLoadingStates());
    try {
      await DioHelper.postData(
              url: "${EndPoint.enrollCourse}/$courseId",
              data: enrollCourseSchema(
                  studentId: userId!, enrollCode: code.toString()),
              token: userToken)
          .then((value) {
        if (value.statusCode == 200) {
          Course newCourse = allCourses.firstWhere(
            (element) => element.id == courseId,
          );
          newCourse.students!.add(userId!);
          myCourses.insert(0, newCourse);
          categorizeCourses();
          search();
          emit(CoursesEnrolSuccessStates());
        } else {
          emit(CoursesEnrolErrorStates(AppStrings.errorEnrollingCourse));
        }
      }).catchError((error) {
        emit(CoursesEnrolErrorStates(AppStrings.errorEnrollingCourse));
      });
    } catch (e) {
      emit(CoursesEnrolErrorStates(AppStrings.errorEnrollingCourse));
    }
  }

  Future<void> unEnrollCourse(String courseId) async {
    emit(CoursesUnEnrollLoadingStates());
    try {
      await DioHelper.postData(
              url: "${EndPoint.unEnrollCourse}/$courseId",
              data: unEnrollCourseSchema(studentId: userId!),
              token: userToken)
          .then((value) {
        if (value.statusCode == 200) {
          Course newCourse = allCourses.firstWhere(
            (element) => element.id == courseId,
          );
          newCourse.students!.remove(userId);
          myCourses.removeWhere((element) => element.id == courseId);
          categorizeCourses();
          myLastAccessedCourses
              .removeWhere((element) => element.id == courseId);
          emit(CoursesUnEnrollSuccessStates());
        } else {
          emit(CoursesUnEnrollErrorStates());
        }
      }).catchError((error) {
        emit(CoursesUnEnrollErrorStates());
      });
    } catch (e) {
      emit(CoursesUnEnrollErrorStates());
    }
  }

  int currentIndex = 0;
  void swap(int index) {
    currentIndex = index;
    emit(CoursesSearchState());
  }

  List<Course> searchResults = [];
  void searchCourses(String query) {
    searchResults = allCourses
        .where((element) =>
            element.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchResults.addAll(allCourses
        .where((element) =>
            element.courseCode!.toLowerCase().contains(query.toLowerCase()))
        .toList());
    emit(CoursesSearchState());
  }

  void addToMyLastAccessedCourses(Course course) {
    if (myLastAccessedCourses.contains(course)) {
      myLastAccessedCourses.remove(course);
    }
    myLastAccessedCourses.add(course);
    emit(AddLastAccessedCourses());
  }

  void search() {
    isSearch = !isSearch;
    emit(CoursesSearchState());
  }

  Map<String, List<Course>> categorizedCourses = {};
  String? homeSelectedDepartment;
  String? coursesSelectedDepartment;

  // Method to categorize courses by department
  void categorizeCourses() {
    categorizedCourses.clear();
    // Initialize or clear the 'all' category with all courses
    categorizedCourses['all'] = List.from(allCourses);

    for (var course in allCourses) {
      String department =
          course.programName!; // Assuming Course model has a department field
      categorizedCourses.putIfAbsent(department, () => []);
      categorizedCourses[department]?.add(course);
    }

    // Select 'all' category by default
    homeSelectedDepartment = 'all';
    coursesSelectedDepartment = 'all';

    emit(CoursesCategorizedState());
  }

  // Method to handle department selection
  void selectHomeHomeDepartment(String departmentName) {
    homeSelectedDepartment = departmentName;
    emit(CoursesFilteredByDepartmentState()); // Assuming this state exists
  }

  void selectDepartment(String departmentName) {
    coursesSelectedDepartment = departmentName;
    emit(CoursesFilteredByDepartmentState()); // Assuming this state exists
  }
}
