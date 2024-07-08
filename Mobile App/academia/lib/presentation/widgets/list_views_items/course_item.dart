import 'package:academia/app/constants.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_states.dart';
import 'package:academia/presentation/widgets/bottom_sheets/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/models/course.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../bottom_sheets/task_submission_bottom_sheet.dart';
import '../custom_text.dart';
import 'category_item.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesCubit,CoursesState>( 
      listener: (context, state) {},
      builder: (context, state) { 
        var cubit = CoursesCubit.of(context);
        return InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pushNamed(Routes.courseScreen, arguments: course);
          cubit.addToMyLastAccessedCourses(course);
        },
        child: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            height: AppSize.s150,
            width: AppSize.s336,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppPadding.p16),
              color: Theme.of(context).canvasColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset( 
                            ImageAssets.notification,
                            width: AppSize.s30,
                            height: AppSize.s30,
                            color: ColorManager.textOrange,
                          ),
                          SizedBox(
                            width: AppSize.s190,
                            height: AppSize.s20,
                            child: ListView(
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
                        ],
                      ),
                      CustomText(text: 
                        course.name!,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: FontSize.s16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(text: "  +1 آخرون",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: FontSize.s11)),
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          InkWell(
                              onTap: () {
                                showCustomBottomSheet(
                                    context: context,
                                    bottomSheet: const ProfileBottomSheet());
                              },
                              child: CustomText(text: "مروان تامر - أحمد محسن",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(fontSize: FontSize.s12))),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: AppSize.s115,
                    width: AppSize.s115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s16),
                      // color: ColorManager.transparent,
                    ),
                    child: Center(
                      child: SvgPicture.asset(Theme.of(context)
                          .extension<CustomThemeExtension>()!
                          .courseIcon),
                    ),
                  ),
                )
              ],
            )),
      );}
    );
  }
}
