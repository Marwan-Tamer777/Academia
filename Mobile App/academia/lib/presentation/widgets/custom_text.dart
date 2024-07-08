import 'package:academia/app/language/locale_controller.dart';
import 'package:academia/presentation/resources/shared_preference_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final int lines;
  final TextStyle style;
  final double height;
  final TextOverflow overflow; 
  final TextAlign? textAlign;

  const CustomText(
      {super.key,
        required this.text,
        this.color = Colors.white,
        this.lines = 99,
        required this.style,
        this.height = 1.5,
        this.overflow = TextOverflow.ellipsis, 
        this.textAlign,
      });

  @override
  Widget build(BuildContext context) { 
    MyLocaleController localeController = Get.find<MyLocaleController>();
    return Text(
      text.tr,
      style: style.copyWith(height: height),
      maxLines: lines,
      textDirection: SharedPrefManager.getDataString(key: 'lang') == 'ar'
          ? TextDirection.ltr
          : TextDirection.rtl,
      overflow: overflow, 
      textAlign: textAlign,
    );
  }
}
