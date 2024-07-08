import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/data_returned.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../resources/values_manager.dart';
import '../../../../../widgets/backgrounds/background.dart';
import '../../courses/Courses_cubit/courses_cubit.dart';
import '../../courses/Courses_cubit/courses_states.dart';

class HomeData extends StatelessWidget {
  const HomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Stack(children: [
            // background
            Background(
              height: AppSize.s300.toInt(),
            ),

            const HomeDataReturned(),
          ]),
        );
      },
    );
  }
}
