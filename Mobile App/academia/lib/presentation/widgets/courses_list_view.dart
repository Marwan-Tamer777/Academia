import 'package:flutter/cupertino.dart';

import '../../domain/models/course.dart';
import '../resources/values_manager.dart';
import 'list_views_items/course_item.dart';

class CoursesListView extends StatelessWidget {
  final List<Course> courses;
  const CoursesListView({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CourseItem(course: courses[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: AppSize.s10,
          );
        },
        itemCount: courses.length,
      ),
    );
  }
}
