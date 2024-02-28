import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_states.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/calender_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses_screen.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const ProfileScreen(),
    const QuizScreen(),
    const CoursesScreen(),
    const CalenderScreen(),
    const HomeScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNavBarState(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}