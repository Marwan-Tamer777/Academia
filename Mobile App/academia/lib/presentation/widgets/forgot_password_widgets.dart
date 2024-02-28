import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/style_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/widgets_manager.dart';

class VerificationCodeField extends StatelessWidget {
  const VerificationCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsManager.textFormField(
      height: 110,
      expands: true,
      maxLines: null,
      style: getBoldTextStyle(fontSize: 30, fontFamily: FontConstants.cairo),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      contentPadding: const EdgeInsets.all(10),
      boxShadow: [],
      inputFormattersNumber: 1,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    );
  }
}
