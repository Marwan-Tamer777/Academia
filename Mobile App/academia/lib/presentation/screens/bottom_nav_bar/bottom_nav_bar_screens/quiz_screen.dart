import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/widgets/bottom_sheets/quiz_bottom_sheet.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/elements/calender_empty_state.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/elements/notification_icon.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFound = true;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leadingWidth: 70,
          backgroundColor: Theme.of(context)
              .extension<CustomThemeExtension>()!
              .patternAppBarColor,
          leading: const Padding(
            padding: EdgeInsets.all(16.0),
            child: NotificationIcon(),
          ),
          title: Text('الواجبات',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: FontSize.s20, color: ColorManager.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p13, vertical: AppPadding.p16),
              child: SvgPicture.asset(ImageAssets.arrowBackIcon,
                  color: ColorManager.white),
            ),
          ],
        ),
        body: isFound
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // the next tasks
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Text(
                                'التسليمات القادمة',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: FontSize.s20,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(
                                          context: context,
                                          bottomSheet:
                                              const TaskSubmissionBottomSheet());
                                    },
                                    child: const CalenderListItem());
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: 5,
                            ),

                            // the next quiz
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: Text(
                                'الامتحانات القادمة',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: FontSize.s20,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s10,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(
                                          context: context,
                                          bottomSheet:
                                              const StartQuizBottomSheet());
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
            : Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    // no tasks
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: Text(
                        'التسليمات القادمة',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSize.s20,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    const CalenderEmptyState(),

                    // no quiz
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1, 0),
                      child: Text(
                        'الامتحانات القادمة',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSize.s20,
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s10,
                    ),
                    const CalenderEmptyState(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    )
                  ],
                ),
              ));
  }
}
