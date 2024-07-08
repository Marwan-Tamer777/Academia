import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/widgets/assignments_data.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/widgets/quiz_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/font_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../../widgets/elements/notification_icon.dart';
import '../../../../../widgets/custom_text.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          title: CustomText(text: AppStrings.homework,
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
        
        
        body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: CustomText(text: 
                                AppStrings.upcomingDeliveries,
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
                            
                            const AssignmentsData(),
                            // the next quiz
                            Align(
                              alignment: const AlignmentDirectional(1, 0),
                              child: CustomText(text: 
                                AppStrings.upcomingExams,
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
                            const QuizData(), 
                            ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
    );  
  }
}
