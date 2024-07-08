import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const CategoryItem(
      {super.key,
      this.title,
      this.margin,
      this.width,
      this.height,
      this.padding,
      required this.color,
      required this.textColor,
      this.fontSize = 10,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      // width: width,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s30),
        color: color,
      ),
      child: Center(
          child: child ??
              CustomText(text: 
                title!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: textColor,
                      fontSize: 12,
                    ),
              )),
    );
  }
}
