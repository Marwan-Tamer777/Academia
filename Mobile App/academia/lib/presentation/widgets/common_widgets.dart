import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/widgets_manager.dart';   

class BigButton extends StatelessWidget {
  final String   text;
  final VoidCallback   onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const BigButton(
      {this.margin,
      this.padding,
      required this.onPressed,
      required this.text,
      super.key
      });

  @override
  Widget build(BuildContext context) {
    return WidgetsManager.customElevatedButton(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
      padding: padding,
      context: context,
      onPressed: onPressed,
      child: Text(
        text,
        style: getBoldTextStyle(
          fontSize: 18,
          fontFamily: FontConstants.cairo,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CommonTextFormField extends StatelessWidget {
  final bool obscureText;
  final String? label;
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CommonTextFormField({
    this.margin,
    this.obscureText = false,
    this.contentPadding,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetsManager.textFormField(
      controller: controller,
      margin:margin?? const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      keyboardType:keyboardType?? TextInputType.emailAddress,
      obscureText: obscureText,
      hintText: hint,
      labelText: label,
      textAlign: TextAlign.end,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}
