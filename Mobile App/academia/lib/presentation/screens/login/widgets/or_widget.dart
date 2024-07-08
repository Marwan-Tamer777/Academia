import 'package:flutter/Material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/custom_text.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: AppMargin.m20,
        horizontal: AppMargin.m14,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: ColorManager.lightGrey,
              thickness: AppSize.s0_5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s10),
            child: CustomText(
                text: AppStrings.or,
                style:
                Theme.of(context).textTheme.bodyMedium!),
          ),
          const Expanded(
            child: Divider(
              color: ColorManager.lightGrey,
              thickness: AppSize.s0_5,
            ),
          ),
        ],
      ),
    );
  }
}
