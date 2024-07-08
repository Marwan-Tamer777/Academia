import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_states.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/calender/screens/calender_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/screens/home_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/screens/quiz_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/screens/courses_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile/screens/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const ProfileScreen(),
    const QuizScreen(),
    const CalenderScreen(),
    const HomeScreen(),
    const CoursesScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNavBarState(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
