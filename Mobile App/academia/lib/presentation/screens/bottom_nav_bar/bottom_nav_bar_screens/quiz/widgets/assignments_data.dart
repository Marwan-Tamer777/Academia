import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_states.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentsData extends StatelessWidget {
  const AssignmentsData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AssignmentsCubit,AssignmentsStates>(
            listener: (context,state) {}, 
            builder: (context,state) {
var cubit = AssignmentsCubit.get(context);
            return state is GetAssignmentsLoadingState ? CircularProgressIndicator() : 
                   state is GetAssignmentsErrorState ? Text("Error") : 
                   ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet( 
                                          context: context,
                                          bottomSheet:
                                             TaskSubmissionBottomSheet(assignment: cubit.assignments![index],));
                                    },
                                    child: CalenderListItem( 
                                      assignment: cubit.assignments![index],
                                    ));
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: cubit.assignments!.length,
                            );


            }, 

    );
  }
}