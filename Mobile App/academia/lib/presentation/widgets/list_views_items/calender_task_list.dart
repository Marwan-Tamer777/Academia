import 'package:academia/presentation/widgets/list_views_items/task_component.dart';
import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CalenderListItem extends StatelessWidget {
  const CalenderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppPadding.p16,
      ),
      height: AppSize.s100,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
      ),
      child: const TaskComponent(),
    );
  }
}
