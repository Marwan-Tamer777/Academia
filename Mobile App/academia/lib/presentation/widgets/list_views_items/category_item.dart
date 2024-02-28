import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double fontSize;
  const CategoryItem({Key? key, required this.title, required this.width, required this.height, required this.color, required this.textColor, this.fontSize = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6, vertical: AppPadding.p2),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s30),
        color: color,
      ),
      child: Center(child: Text(title, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: fontSize, color: textColor),)),
    );
  }
}
