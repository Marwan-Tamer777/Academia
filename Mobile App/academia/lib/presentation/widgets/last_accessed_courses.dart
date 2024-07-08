import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/elements/no_courses_component.dart';
import 'package:academia/presentation/widgets/list_views_items/last_accessed_course_item.dart';
import 'package:carousel_slider/carousel_slider.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import '../screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_states.dart';

class LastAccessedCourses extends StatelessWidget {

  const LastAccessedCourses({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) => {},
      builder: (context, state) { 
        var cubit = CoursesCubit.of(context);
      return cubit.myLastAccessedCourses.isEmpty ? const NoCoursesComponent() : CarouselSlider.builder(
                  options: CarouselOptions(
                    height: AppSize.s240,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      cubit.swap(index);
                    },
                  ),
                  itemCount: cubit.myLastAccessedCourses.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: LastAccessedCourseItem(course: cubit.myLastAccessedCourses[index]),
                    );
                  },
                  carouselController: cubit.carouselController,
                );
  });
    }
}