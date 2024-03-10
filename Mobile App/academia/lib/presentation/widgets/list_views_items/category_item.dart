import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  // final double width;
  // final double height;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsets? padding;
  const CategoryItem(
      {super.key,
      required this.title,
      // required this.width,
      // required this.height,
      this.padding,
      required this.color,
      required this.textColor,
      this.fontSize = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(AppPadding.p10),
      // height: height,
      // width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s30),
        color: color,
      ),
      child: Center(
          child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: fontSize, color: textColor),
      )),
    );
  }
}
