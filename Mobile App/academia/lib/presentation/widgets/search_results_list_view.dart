import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/course.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import 'bottom_sheets/course_bottom_sheet.dart';
import 'bottom_sheets/task_submission_bottom_sheet.dart';
import 'custom_text.dart';

class SearchResultsListView extends StatelessWidget {
  final List<Course> courses;
  const SearchResultsListView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: CustomText(
            text: courses[index].name!,
            style: Theme
                .of(context)
                .textTheme
                .displayLarge!
                .copyWith(
                fontSize: FontSize.s15,
                color: ColorManager.lightGrey),
          ),
          leading: CustomText(
            text: courses[index].courseCode!,
            style: Theme
                .of(context)
                .textTheme
                .displayLarge!
                .copyWith(
                fontSize: FontSize.s15,
                color: ColorManager.textOrange),
          ),
          onTap: () {
            var coursesCubit = CoursesCubit.of(context); 
            if(coursesCubit.myCourses.contains(courses[index])) {
              Navigator.pushNamed(context, Routes.courseScreen, arguments: courses[index]);
              coursesCubit.addToMyLastAccessedCourses(courses[index]);
            } else {
              showCustomBottomSheet(
                bottomSheet :CourseRegistrationBottomSheet(course: courses[index]), context: context,
              );
            }
          },
        );
      },
      itemCount: courses.length,
    );
  }
}
