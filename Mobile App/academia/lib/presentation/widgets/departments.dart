import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Departments extends StatelessWidget { 
  final String selectedDepartment; 
  final String type;
  const Departments({required this.selectedDepartment, required this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        var cubit = context.read<CoursesCubit>();
        var departments = cubit.categorizedCourses.keys.toList();

        return Container(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal, 
            reverse: true,
            itemCount: departments.length,
            itemBuilder: (context, index) {
              var department = departments[index];
              bool isSelected = department == selectedDepartment;
              return GestureDetector(
                onTap: () {
                  if(type == "home") {
                    cubit.selectHomeHomeDepartment(department);
                  } else {
                    cubit.selectDepartment(department);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      department,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}