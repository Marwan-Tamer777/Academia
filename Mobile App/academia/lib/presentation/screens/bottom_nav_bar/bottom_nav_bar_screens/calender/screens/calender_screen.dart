import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/widgets/elements/calender.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import '../../../../../widgets/backgrounds/background.dart';
import '../../../../../resources/font_manager.dart';
import '../../../../../resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/elements/header.dart';
import '../../../../../widgets/custom_text.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        // background
        Background(
          height: AppSize.s300.toInt(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p13, vertical: AppPadding.p16),
          child: Column(
            children: [
              // title and notification icon
              const ScreenHeader(
                title: AppStrings.schedule,
              ),
              const SizedBox(height: AppSize.s20),

              // calender
              const TasksCalender(),
              const SizedBox(height: AppSize.s24),

              // calender tasks
              Align(
                alignment: const AlignmentDirectional(1, 0),
                child: CustomText(
                  text: AppStrings.todaySchedule,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(height: AppSize.s15),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CalenderListItem();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: AppSize.s10,
                  );
                },
                itemCount: 10,
              ),

              // if there is no tasks
              // const CalenderEmptyState(),
            ],
          ),
        )
      ]),
    );
  }
}
