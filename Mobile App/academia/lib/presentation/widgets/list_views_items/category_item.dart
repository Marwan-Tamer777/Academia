import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final Widget? child;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsets? padding;
  const CategoryItem(
      {super.key,
        this.title,
        this.width,
        this.height,
      this.padding,
      required this.color,
      required this.textColor,
      this.fontSize = 10,
        this.child
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s30),
        color: color,
      ),
      child: Center(
          child: child ?? Text(
            title!,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          )
      ),
    );
  }
}
