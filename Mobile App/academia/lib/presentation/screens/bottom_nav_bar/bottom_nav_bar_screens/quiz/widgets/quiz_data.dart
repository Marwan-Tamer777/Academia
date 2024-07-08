import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/quiz_cubit/quiz_states.dart';
import 'package:academia/presentation/widgets/bottom_sheets/quiz_bottom_sheet.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizData extends StatelessWidget {
  const QuizData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit,QuizState>(
            listener: (context,state) {}, 
            builder: (context,state) { 
var cubit = QuizCubit.of(context); 
return state is GetQuizezLoadingState ? const CircularProgressIndicator() : 
state is GetQuizezErrorState ? const Text("Error") : 
ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CalenderListItem(quiz: cubit.quizes![index]);
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: cubit.quizes!.length,
                            );
                      
            });
  }
}