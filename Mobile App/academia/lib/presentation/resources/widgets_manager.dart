import 'dart:math';

import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shimmer/shimmer.dart';

import 'color_manager.dart';

abstract class WidgetsManager {
  static Widget outlinedElevatedButton({
    required BuildContext context,
    required Widget child,
    VoidCallback? onPressed,
    Color borderColor = ColorManager.lightPrimary,
    Color backgroundColor = ColorManager.lightWhite,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    double borderWidth = AppSize.s1,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                ),
                borderRadius: borderRadius ??=
                    BorderRadius.circular(AppSize.s25),
              ),
            ),
            padding: MaterialStateProperty.all(padding ??= EdgeInsets.zero),
          ),
      child: child,
    );
  }

  static Widget textFormField({
    EdgeInsetsGeometry? padding = const EdgeInsets.all(AppSize.s10),
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? contentPadding,
    double? height,
    double? width,
    BorderRadiusGeometry? borderRadius,
    Color? color,
    String? hintText,
    String? labelText,
    String? helperText,
    String? errorText,
    TextStyle? style,
    TextEditingController? controller,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool readOnly = false,
    bool enabled = true,
    bool expands = false,
    InputBorder border = InputBorder.none,
    InputBorder enabledBorder = InputBorder.none,
    InputBorder focusedBorder = InputBorder.none,
    TextAlign textAlign = TextAlign.start,
    TextDirection? textDirection,
    FloatingLabelAlignment? floatingLabelAlignment,
    Widget? prefixIcon,
    Widget? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    int? inputFormattersNumber,
    int? maxLines = 1,
    int? minLines,
    Function(String)? onChanged,
    List<BoxShadow>? boxShadow,
  }) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType,
        textAlign: textAlign,
        expands: expands,
        style: style,
        textDirection: textDirection,
        onChanged: onChanged == null ? null : (value) => onChanged(value),
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          labelText: labelText,
          alignLabelWithHint: true,
          floatingLabelAlignment: floatingLabelAlignment,
          helperText: helperText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefix: prefix,
          suffix: suffix,
        ),
        maxLines: maxLines,
        minLines: minLines,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputFormattersNumber),
        ],
      ),
    );
  }

  static Widget customElevatedButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
    TextStyle? textStyle,
    Color? backgroundColor,
    Color? overlayColor,
    double width = double.infinity,
    double? height = AppSize.s56,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(AppSize.s16),
    ),
    OutlinedBorder? shape,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStatePropertyAll(backgroundColor),
              overlayColor: MaterialStatePropertyAll(overlayColor),
              elevation: MaterialStatePropertyAll(elevation),
              shape: MaterialStatePropertyAll(shape),
              padding: MaterialStatePropertyAll(padding),
            ),
        child: child,
      ),
    );
  }

  static void showLoadingDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: AppSize.s20),
            Text(message),
          ],
        ),
      ),
    );
  }

  static void showMessageDialog({
    required BuildContext context,
    required String title,
    required String message,
    bool okButton = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(title),
        content: Text(message),
        actions: [
          if (okButton)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
        ],
      ),
    );
  }

  static Widget gridProductShimmer({
    required BuildContext context,
  }) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
      highlightColor: Theme.of(context).disabledColor,
      child: Container(
        margin: const EdgeInsets.only(right: AppSize.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: AppSize.s200,
              width: AppSize.s200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              width: AppSize.s100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Theme.of(context).canvasColor,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Container(
              height: AppSize.s24,
              width: AppSize.s160,
              margin: const EdgeInsets.only(bottom: AppMargin.m10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
                color: Theme.of(context).canvasColor,
              ),
            ),
            Container(
              height: AppSize.s24,
              width: AppSize.s100,
              margin: const EdgeInsets.only(bottom: AppMargin.m10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s8),
                color: Theme.of(context).canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget categorySliderShimmer(
      {required BuildContext context, int? itemCount}) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).inputDecorationTheme.fillColor!,
      highlightColor: Theme.of(context).disabledColor,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p10),
        height: AppSize.s320,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemCount ?? Random().nextInt(10) + 5,
          itemBuilder: (context, index) {
            return gridProductShimmer(context: context);
          },
        ),
      ),
    );
  }
}
