import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class CircleItem extends StatelessWidget {
  final String image;
  const CircleItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppSize.s30,
      backgroundColor: ColorManager.lightOrange1,
      child: SvgPicture.asset(image),
    );
  }
}
