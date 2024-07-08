import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class CourseRegistrationDialog extends StatelessWidget {
  const CourseRegistrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        height: AppSize.s250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppSize.s36,
              backgroundColor: ColorManager.success,
              child: SvgPicture.asset(
                ImageAssets.success,
                width: AppSize.s50,
                height: AppSize.s50,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            CustomText(text: 
              AppStrings.courseRegistrationSuccess,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            CustomText(text: 
              AppStrings.courseRegistrationSuccessDescription,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: FontSize.s14,
              ),
            ),

            const SizedBox(height: AppSize.s16),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: CustomText(text: AppStrings.browseContent, style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
