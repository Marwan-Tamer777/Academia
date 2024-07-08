import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/widgets_manager.dart';
import 'custom_text.dart';

class BigButton extends StatelessWidget {
  final String   text;
  final VoidCallback   onPressed;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  const BigButton(
      {this.margin,
      this.padding,
      this.textStyle,
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
      child: CustomText(text: 
        text,
        style:textStyle?? getBoldTextStyle(
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
  final String? hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? color;
  final Function(String)? onChanged;
  final Function(String?)? validator; 
  final int maxLines;

  const CommonTextFormField({
    this.margin,
    this.obscureText = false,
    this.contentPadding,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.hint,
    this.color,
    super.key, this.onChanged,
    this.validator, 
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) { 
    String? newLabel = label != null ? label!.tr : null;
    String? newHint = hint != null ? hint!.tr : null;
    return WidgetsManager.textFormField(
      controller: controller,
      // color: color,
      onChanged: onChanged,
      validator: validator,
      margin:margin?? const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      keyboardType:keyboardType?? TextInputType.emailAddress,
      obscureText: obscureText,
      hintText: newHint,
      labelText: newLabel,
      textAlign: TextAlign.end,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon, 
      maxLines: maxLines,
    );
  }
}
