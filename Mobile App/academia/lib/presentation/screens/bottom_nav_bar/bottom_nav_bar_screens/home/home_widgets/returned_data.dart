import 'package:academia/app/constants.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/no_data_state.dart';
import 'package:academia/presentation/widgets/departments.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../../widgets/backgrounds/background.dart';
import '../../../../../widgets/course_screen_header.dart';
import '../../../../../widgets/courses_list_view.dart';
import '../../../../../widgets/search_options.dart';
import '../../../../../widgets/search_results_list_view.dart';
import '../../courses/Courses_cubit/courses_cubit.dart';
import '../../courses/Courses_cubit/courses_states.dart';
import '../../courses/courses_widgets/search_field.dart';

class CoursesReturnedData extends StatelessWidget {
  const CoursesReturnedData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.of(context);
        return SingleChildScrollView(
          child: Stack(children: [
            // background
            const Background(),
            Column(
              children: [
                // title and notification icon
              userData != null ?
                CourseScreenHeader(name: userData!.name!) : const SizedBox(height: 120,),

                const SizedBox(
                  height: AppSize.s30,
                ),

                // search field
                const SearchField(type: 'courses'),


                state is CoursesLoadingStates
                   ? const Center(child: CircularProgressIndicator())
                   : state is CoursesErrorStates ? Center(child: Text(state.message)) :
                   
                Column( 
                  children: [ 
                     const SizedBox(
                  height: AppSize.s20,
                ),

                // courses
                if (cubit.isSearchAllCourses == false && cubit.allCourses.isEmpty) ... [ 
                  const NoDataState(),
                ], 

                if (cubit.isSearchAllCourses == false) ... [ 
                  
                  Departments(selectedDepartment: cubit.coursesSelectedDepartment!, type: "courses"),

                  const SizedBox(
                    height: 10,
                  ),

                  CoursesListView(courses: cubit.categorizedAllCourses[cubit.coursesSelectedDepartment!]!,),                ],

                if (cubit.isSearchAllCourses == true)
                  Column(
                    children: [
                      const SearchOptions(),

                      SearchResultsListView(courses: cubit.searchResults,),
                    ],
                  ),
                  ],
                ),
              ],
            ),
          ]),
        );
      },
    );
  }
}
