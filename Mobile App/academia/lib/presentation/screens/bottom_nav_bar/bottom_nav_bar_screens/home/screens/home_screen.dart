import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../courses/Courses_cubit/courses_cubit.dart';
import '../../courses/Courses_cubit/courses_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.of(context);
        return state is CoursesLoadingStates
            ? const Center(child: CircularProgressIndicator())
            : state is CoursesErrorStates ? Center(child: Text(state.message)) :
        const HomeData();
      },
    );
  }
}
