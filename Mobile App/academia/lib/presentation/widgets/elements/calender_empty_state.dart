import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class CalenderEmptyState extends StatelessWidget {
  const CalenderEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorManager.lightOrange1,
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
        ),
        child: Align(
            alignment: Alignment.centerRight,
            child: CustomText(text: 
              AppStrings.calenderEmptyState,
              style: Theme.of(context).textTheme.bodyLarge!,
            )));
  }
}
