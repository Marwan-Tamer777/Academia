import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class LastTaskGradeAndEvents extends StatelessWidget { 
  final Course course;
  const LastTaskGradeAndEvents({
    super.key, required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p8,
      ),
      child: Row(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(text: 
                    AppStrings.upcomingEvent,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: FontSize.s10, color: ColorManager.lightGrey),
                  ),
                  const SizedBox(height: AppSize.s5),
                  CustomText(text: 
                    dateFormatter(course.mostRecentDeadline!.toIso8601String()),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: FontSize.s11, color: ColorManager.textOrange),
                  ),
                ],
              ),
              const SizedBox(width: AppSize.s5),
              Container(
                height: AppSize.s40,
                width: AppSize.s45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  color: ColorManager.externalOrangeOverlay,
                ),
                child: SvgPicture.asset(
                  ImageAssets.calendar,
                  width: AppSize.s30,
                  height: AppSize.s30,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(text: 
                    AppStrings.lastTaskGrade,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: FontSize.s10, color: ColorManager.lightGrey),
                  ),
                  const SizedBox(height: AppSize.s5),
                  CustomText(text: 
                    AppStrings.notFound,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: FontSize.s11, color: ColorManager.textOrange),
                  ),
                ],
              ),
              const SizedBox(width: AppSize.s5),
              Container(
                height: AppSize.s40,
                width: AppSize.s45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  color: ColorManager.externalOrangeOverlay,
                ),
                child: SvgPicture.asset(
                  ImageAssets.grades,
                  width: AppSize.s30,
                  height: AppSize.s30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
