import 'package:flutter/Material.dart';
import 'package:get/get.dart';

import '../../../resources/strings_manager.dart';
import '../../../widgets/common_widgets.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController emailController;

  EmailTextFormField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return CommonTextFormField(
      controller: emailController, 
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.loginEmailError.tr;
        } else if (!GetUtils.isEmail(value)) {
          return AppStrings.loginEmailInvalid.tr;
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      hint: AppStrings.loginEmailHint.tr,
      label: AppStrings.loginEmailHint.tr,
    );
  }
}
