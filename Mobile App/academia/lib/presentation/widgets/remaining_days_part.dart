import 'package:flutter/cupertino.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'list_views_items/category_item.dart';

class RemainingDays extends StatelessWidget {
  final int remainingDays;
  const RemainingDays({super.key, required this.remainingDays});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: CategoryItem(
          title: AppStrings.remainingDays,
          width: 60,
          color: ColorManager.lightOrange1,
          textColor: ColorManager.textOrange,
          fontSize: FontSize.s12,
        ),
      ),
    );
  }
}
