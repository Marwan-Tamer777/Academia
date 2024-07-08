import 'package:academia/presentation/widgets/welcome_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'custom_text.dart';

class CourseScreenHeader extends StatelessWidget {
  final String name;
  const CourseScreenHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          WelcomeUser(name: name),

          const SizedBox(
            height: AppSize.s10,
          ),

          CustomText(
              text: AppStrings.completeYourStudyJourney,
              style: Theme
                  .of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(
                  fontSize: FontSize.s24,
                  color: ColorManager.white)),
        ],
      ),
    );
  }
}
