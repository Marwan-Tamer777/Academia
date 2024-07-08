import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/widgets/list_views_items/task_component.dart';
import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CalenderListItem extends StatelessWidget { 
  final Assignment? assignment; 
  final Quiz? quiz;
  const CalenderListItem({super.key, this.assignment, this.quiz});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppPadding.p16,
      ),
      // height: AppSize.s100,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
      ),
      child: TaskComponent(assignment: assignment, quiz: quiz),
    );
  }
}
