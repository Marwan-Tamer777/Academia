import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/courses_widgets/courses_data.dart';
import 'package:academia/presentation/screens/login/widgets/custom_loading_dialog.dart';
import 'package:academia/presentation/widgets/elements/course_registeration_dialog.dart';
import 'package:academia/presentation/widgets/elements/course_registeration_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../Courses_cubit/courses_cubit.dart';
import '../Courses_cubit/courses_states.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {  
          if(state is CoursesEnrolLoadingStates) {
          customLoadingDialog(context: context);
        } 

        if(state is CoursesEnrolSuccessStates) { 
          // Navigator.of(context).pop(); 
          Navigator.of(context).pop(); 
          showDialog(
            context: context,
            builder: (context) => CourseRegistrationDialog(course: state.course,),
          );
        } 

        if(state is CoursesEnrolErrorStates) {
          // Navigator.of(context).pop(); 
          Navigator.of(context).pop(); 
          showDialog(
            context: context,
            builder: (context) => const CourseRegistrationErrorDialog(),
          );
        }
      },
      builder: (context, state) {
        return     state is CoursesLoadingStates
                   ? const Center(child: CircularProgressIndicator())
                   : state is CoursesErrorStates ? Center(child: Text(state.message)) :
                   const CoursesData();
      },
    );
  }
} 

// make a date formatter function that takes a date in this format "2024-06-29T23:25:32.812Z" and return it in format "12 Feb 2024" 
String dateFormatter(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedDate = DateFormat.yMMMMd().format(dateTime);
  return formattedDate;
}

// make a date formatter function that takes a date in this format "2024-06-29T23:25:32.812Z" and return it in format "12 Feb 2024 : 23:25" 
String dateTimeFormatter(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final String formattedDate = DateFormat.yMMMMd().add_jm().format(dateTime);
  return formattedDate;
}

