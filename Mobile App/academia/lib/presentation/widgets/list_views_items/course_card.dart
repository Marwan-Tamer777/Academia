import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_cubit.dart';
import 'package:academia/presentation/screens/login/widgets/custom_alert_dialog.dart';
import 'package:academia/presentation/widgets/bottom_sheets/evaluation_bottom_sheet.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';
import '../elements/last_task_grade_and_events.dart';
import 'category_item.dart';

class CourseCard extends StatelessWidget { 
  final Course course;
  const CourseCard({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      //height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max, 
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 

          // evaluation button 
          IconButton(
            onPressed: () {
              showCustomBottomSheet(bottomSheet: const EvaluationBottomSheet(), context: context);
            },
            icon: const Icon(Icons.rate_review_outlined,color: ColorManager.textOrange,),
          ),
          

          // unenroll button
          IconButton(
            onPressed: () {  
              showCustomAlertDialog(context: context, title: AppStrings.areYouSureYouWantToEnrollThisCourse.tr, content: Row(children: [
                Expanded(
                  child: BigButton(onPressed: () {
                    CourseCubit.of(context).unEnrollCourse();
                  }, text: AppStrings.ok.tr, ),
                ), 
                const SizedBox(width: 10,), 
                Expanded(
                  child: BigButton(onPressed: () {
                    Navigator.pop(context);
                  }, text: AppStrings.cancel.tr, ),
                ),
              ],), 
          
              );
            },
            icon: const Icon(Icons.logout_outlined),
            color:  ColorManager.textOrange,
          ),
              ],
          ),
          CircleAvatar(
            radius: AppSize.s50,
            backgroundColor: ColorManager.lightOrange1,
            child: Center(
              child: SvgPicture.asset(
                ImageAssets.book,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          CustomText(text: course.name!,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: FontSize.s16)),
          const SizedBox(height: AppSize.s16),
                          Center(
                            child: SizedBox(
                              height: AppSize.s50,
                              child: ListView( 
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  CategoryItem(
                                    title: course.status!,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10,
                                    ),
                                    margin: const EdgeInsets.only(
                                      left: AppPadding.p5,
                                    ),
                                    color: Theme.of(context)
                                        .extension<CustomThemeExtension>()!
                                        .greenOverlayColor,
                                    textColor: Theme.of(context)
                                        .extension<CustomThemeExtension>()!
                                        .successColor,
                                  ),
                                  CategoryItem(
                                    title: course.programName!,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10,
                                    ),
                                    margin: const EdgeInsets.only(
                                      left: AppPadding.p5,
                                    ),
                                    color: ColorManager.lightOrange1,
                                    textColor: ColorManager.textOrange,
                                  ),
                                  CategoryItem(
                                    title: course.courseCode!,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppPadding.p10,
                                    ),
                                    margin: const EdgeInsets.only(
                                      left: AppPadding.p5,
                                    ),
                                    color: ColorManager.lightOrange1,
                                    textColor: ColorManager.textOrange,
                                  ),
                                ],
                              ),
                            ),
                          ),const SizedBox(height: AppSize.s16),
          LastTaskGradeAndEvents(course: course,),
          const SizedBox(height: AppSize.s16),
          Align(
            alignment: Alignment.centerRight,
            child: CustomText(text: 
              AppStrings.courseDescription,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.grey,
                    fontSize: FontSize.s16,
                  ),
            ),
          ),
          const SizedBox(height: AppSize.s8),
          CustomText(text: 
            course.description!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: FontSize.s12,
                  height: AppSize.s2,
                ),
          ),

          // todo: add students circle avatars
        ],
      ),
    );
  }
}
