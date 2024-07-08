import 'package:academia/app/constants.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/no_data_state.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../resources/values_manager.dart';
import '../../../../../widgets/course_screen_header.dart';
import '../../../../../widgets/courses_list_view.dart';
import '../../../../../widgets/departments.dart';
import '../../../../../widgets/dots.dart';
import '../../../../../widgets/last_accessed_courses.dart';
import '../../courses/Courses_cubit/courses_cubit.dart';
import '../../courses/Courses_cubit/courses_states.dart';
import '../../courses/courses_widgets/search_field.dart';

class HomeDataReturned extends StatelessWidget {
  const HomeDataReturned({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.of(context);
        return Column(
              children: [
                // title and notification icon
                  CourseScreenHeader(name: userData!.name!,),

                const SizedBox(
                  height: AppSize.s40,),

                // last accessed courses
                const LastAccessedCourses(),


                // last accessed courses indicator
                Dots(currentIndex: cubit.currentIndex, length: cubit.myLastAccessedCourses.length),
                // search field
                const SearchField(),

                const SizedBox(
                  height: AppSize.s20,
                ),

                // departments
               Departments(selectedDepartment: cubit.homeSelectedDepartment!, type: "home"),

                const SizedBox(
                  height: AppSize.s20,
                ),

                // courses
                cubit.myCourses.isNotEmpty ? CoursesListView(courses: cubit.categorizedCourses[cubit.homeSelectedDepartment]!) : const NoDataState(),

                // cubit.isSearch == false ?
                // CoursesListView(courses: cubit.myCourses) :
                // CoursesListView(courses: cubit.searchResults),


                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                )

              ],
            );
      },
    );
  }
}
