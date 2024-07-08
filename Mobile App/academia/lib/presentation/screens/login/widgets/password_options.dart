import 'package:flutter/Material.dart';

import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/custom_text.dart';

class PasswordOptions extends StatelessWidget {
  const PasswordOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Forgot Password Text Button
          TextButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, Routes.forgotPasswordScreen);
            },
            child: CustomText(
              text: AppStrings.forgotPassword,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
          const Spacer(),

          /// Remember Me
          CustomText(
              text: AppStrings.rememberMe,
              style: Theme.of(context).textTheme.bodyMedium!),
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
