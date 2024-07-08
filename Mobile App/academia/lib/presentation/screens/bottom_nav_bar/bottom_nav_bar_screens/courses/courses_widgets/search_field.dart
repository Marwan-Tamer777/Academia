import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_states.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/strings_manager.dart';
import '../../../../../widgets/common_widgets.dart';

class SearchField extends StatelessWidget {
  final String type;
  const SearchField({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return 
         CommonTextFormField(
          controller: searchController,
          hint: AppStrings.searchForYourCourses,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(ImageAssets.search)),
          
          onChanged: (value) {var cubit = CoursesCubit.of(context);

            cubit.searchCourses(value);
            if(value == '') {
              if(type == 'courses') {
                cubit.searchAllCourses();
              } else {
                cubit.searchMyCourses();
              }
            } else {
              if(type == 'courses') {
                cubit.isSearchAllCourses = true;
              } else {
                cubit.isSearchMyCourses = true;
              }
            }
          },
        );
      
  }
}