import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import 'custom_text.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CustomText(
        text: AppStrings.searchResults,
        style: Theme
            .of(context)
            .textTheme
            .displayLarge!
            .copyWith(
            fontSize: FontSize.s15,
            color: ColorManager.lightGrey),
      ),
      leading: CustomText(
        text: AppStrings.clear,
        style: Theme
            .of(context)
            .textTheme
            .displayLarge!
            .copyWith(
            fontSize: FontSize.s15,
            color: ColorManager.lightGrey),
      ),
      onTap: () {
        // navigate to course details
      },
    );
  }
}
