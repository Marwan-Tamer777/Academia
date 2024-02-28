import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screens_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesState> {

  CoursesCubit() : super(CoursesInitialStates());

  static CoursesCubit of(context) => BlocProvider.of(context);

  bool isSearch = false;




  List<int> coursesList = [1,2,3,4,5,6];
  int currenttIndex = 6;
  void swip(int index) {
    currenttIndex = index;
    emit(CoursesSearchState());
  }




  void search() {
    isSearch = !isSearch;
    emit(CoursesSearchState());
  }
}