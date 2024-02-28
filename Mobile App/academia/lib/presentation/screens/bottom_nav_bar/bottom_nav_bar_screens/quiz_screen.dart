import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/widgets/bottom_sheets/quiz_bottom_sheet.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/elements/calender_empty_state.dart';
import 'package:academia/presentation/widgets/elements/notification_icon.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFound = true;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 80,
        backgroundColor: ColorManager.darkBlueBackground,
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
          child: NotificationIcon(),
        ),
        title: Text('الواجبات', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,color: ColorManager.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13, vertical: AppPadding.p16),
            child: SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
          ),
        ],
      ),
        body: isFound
            ? SingleChildScrollView(
              child: Column(
                  children: [
                    // Container(
                    //   height: 100,
                    //   width: double.infinity,
                    //   decoration: const BoxDecoration(
                    //     color: ColorManager.darkBlueBackground,
                    //   ),
                    //   padding: const EdgeInsets.all(16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const NotificationIcon(),
                    //       Text('الواجبات', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,color: ColorManager.white)),
                    //       SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Text(
                                'التسليمات القادمة',
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontSize: FontSize.s20,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(
                                          context: context,
                                          bottomSheet: const TaskSubmissionBottomSheet()
                                      );
                                      },
                                    child: const CalenderListItem());
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: 5,
                            ),
                            const SizedBox(
                              height: AppSize.s20,
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Text(
                                'الامتحانات القادمة',
                                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                      fontSize: FontSize.s20,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(
                                          context: context,
                                          bottomSheet: const StartQuizBottomSheet()
                                      );
                                    },
                                    child: const CalenderListItem());
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
            )
            : Column(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text(
                      'التسليمات القادمة',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSize.s20,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  const CalenderEmptyState(),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text(
                      'الامتحانات القادمة',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSize.s20,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  const CalenderEmptyState(),
                ],
              ));
  }
}
