import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import 'notification_icon.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  const ScreenHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const NotificationIcon(),
        Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s17,color: ColorManager.white)),
        InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white)),
      ],
    );
  }
}
