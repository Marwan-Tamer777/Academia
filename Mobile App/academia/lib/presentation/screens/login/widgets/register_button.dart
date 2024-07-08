import 'package:flutter/Material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/style_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/custom_text.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: CustomText(
            text: AppStrings.register,
            style: getBoldTextStyle(
              fontSize: AppSize.s16,
              fontFamily: FontConstants.cairo,
              color: ColorManager.lightOrangeStatusBar,
            ),
          ),
        ),
        CustomText(
            text: AppStrings.noAccount,
            style: Theme.of(context).textTheme.bodyMedium!),
      ],
    );
  }
}
