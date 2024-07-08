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
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<CoursesCubit,CoursesState>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = CoursesCubit.of(context);
        return CommonTextFormField(
          controller: searchController,
          hint: AppStrings.searchForYourCourses,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () {
                  cubit.searchCourses(searchController.text);
                },
                child: SvgPicture.asset(ImageAssets.search)),
          ),
          onChanged: (value) {
            cubit.searchCourses(value);
            if(value == '') {
              cubit.search();
            } else {
              cubit.isSearch = true;
            }
          },
        );
      },
    );
  }
}
