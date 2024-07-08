import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import 'custom_text.dart';
import 'elements/notification_icon.dart';

class WelcomeUser extends StatelessWidget {
  final String name;
  const WelcomeUser({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const NotificationIcon(),
        CustomText(
          text: "👋  ${AppStrings.hello.tr}, $name ",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(
            fontSize: FontSize.s18,
            color: ColorManager.white,
          ),
        ),
      ],
    );
  }
}
