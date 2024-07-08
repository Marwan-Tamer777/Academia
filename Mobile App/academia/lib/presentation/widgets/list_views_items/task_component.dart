import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/widgets/bottom_sheets/quiz_bottom_sheet.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class TaskComponent extends StatelessWidget {
  final Assignment? assignment;
  final Quiz? quiz;
  const TaskComponent({super.key, this.assignment, this.quiz});

  @override
  Widget build(BuildContext context) {
    return assignment != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CustomText(
                            text: AppStrings.remainingHours,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: FontSize.s12,
                                    color: ColorManager.lightError)),
                        const Spacer(),
                        CustomText(
                            text: '${AppStrings.assignment} 01',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: FontSize.s16,
                                )),
                      ],
                    ),
                    const SizedBox(height: AppSize.s10),
                    CustomText(
                        text: assignment!.description,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: FontSize.s16)),
                  ],
                ),
              ),
              const SizedBox(
                width: AppSize.s20,
              ),
              
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  radius: AppSize.s30,
                  backgroundColor: ColorManager.lightOrange1,
                  child: SvgPicture.asset(ImageAssets.calendarTime),
                ),
              ),
            ],
          )
        : InkWell(
            onTap: () {
              showCustomBottomSheet(
                  context: context,
                  bottomSheet: StartQuizBottomSheet(quiz: quiz!));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          CustomText(
                              text: '${AppStrings.quiz} 01',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: FontSize.s16,
                                  )),
                        ],
                      ),
                      const SizedBox(height: AppSize.s10),
                      CustomText(
                          text: quiz!.quizName!,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: FontSize.s16)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: AppSize.s20,
                ),
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: AppSize.s30,
                    backgroundColor: ColorManager.lightOrange1,
                    child: SvgPicture.asset(ImageAssets.calendarTime),
                  ),
                ),
              ],
            ),
          );
  }
}


// how to format the code 
// 1. Open the command palette by pressing Ctrl + Shift + P on Windows/Linux or Cmd + Shift + P on macOS.