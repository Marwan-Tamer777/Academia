import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/returned_data.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../widgets/backgrounds/background.dart';
import '../Courses_cubit/courses_cubit.dart';
import '../Courses_cubit/courses_states.dart';

class CoursesData extends StatelessWidget {
  const CoursesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.of(context);
        return const SingleChildScrollView(
          child: Stack(children: [
            // background
            Background(),

            CoursesReturnedData()
          ]),
        );
      },
    );
  }
}
