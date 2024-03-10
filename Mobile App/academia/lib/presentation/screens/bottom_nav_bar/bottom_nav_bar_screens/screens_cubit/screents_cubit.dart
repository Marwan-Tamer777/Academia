import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screens_states.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitialStates());

  static CoursesCubit of(context) => BlocProvider.of(context);

  bool isSearch = false;
  CarouselController carouselController = CarouselController();

  List<int> coursesList = [1, 2, 3, 4, 5, 6];
  int currentIndex = 6;
  void swap(int index) {
    currentIndex = index;
    emit(CoursesSearchState());
  }

  void search() {
    isSearch = !isSearch;
    emit(CoursesSearchState());
  }
}
