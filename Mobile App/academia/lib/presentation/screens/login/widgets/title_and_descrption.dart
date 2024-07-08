import 'package:flutter/Material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/custom_text.dart';

class TitleAndDescrption extends StatelessWidget {
  const TitleAndDescrption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: AppSize.s20),
      child: Column(
        children: [
          /// Welcome Title
          CustomText(
            text: AppStrings.loginWelcomeTitleMessage,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: FontSize.s34),
          ),
          const SizedBox(height: AppSize.s10),

          /// Welcome Description
          CustomText(
            text: AppStrings.loginWelcomeDescriptionMessage,
            style: getRegularTextStyle(
              fontSize: AppSize.s17,
              color: ColorManager.lightGrey,
              fontFamily: FontConstants.cairo,
            ),
          ),
        ],
      ),
    );
  }
}
