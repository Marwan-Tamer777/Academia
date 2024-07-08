import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/widgets/elements/last_task_grade_and_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';
import 'category_item.dart';

class LastAccessedCourseItem extends StatelessWidget { 
  final Course course;
  const LastAccessedCourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        height: AppSize.s300,
        width: AppSize.s400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          color: Theme.of(context).canvasColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Course Title Tags
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.lock,
                            width: AppSize.s41,
                            height: AppSize.s15,
                          ),
                          SizedBox(
                            width: AppSize.s200,
                            height: AppSize.s20,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                CategoryItem(
                                  title: course.status,
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
                                  title: course.programName,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p10,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: AppPadding.p5,
                                  ),
                                  color: ColorManager.lightOrange1,
                                  textColor: ColorManager.textOrange,
                                ),
                                CategoryItem(
                                  title: course.courseCode,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p10,
                                  ),
                                  margin: EdgeInsets.only(
                                    left: AppPadding.p5,
                                  ),
                                  color: ColorManager.lightOrange1,
                                  textColor: ColorManager.textOrange,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s15),
                      // Course Title
                      CustomText(text: 
                        course.name!,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: FontSize.s16),
                      ),
                      const SizedBox(height: AppSize.s15),
                      // Course Instructors
                      CustomText(text: "مروان تامر - أحمد محسن  +1 آخرون",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: FontSize.s12)),
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.s10),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: AppSize.s115,
                    width: AppSize.s115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      color: ColorManager.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Theme.of(context)
                            .extension<CustomThemeExtension>()!
                            .courseIcon,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: AppSize.s20),
            LastTaskGradeAndEvents(course: course),
          ],
        ));
  }
}
