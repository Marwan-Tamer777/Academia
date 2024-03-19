import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import 'notification_icon.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 70,
      backgroundColor: ColorManager.darkBlueBackground,
      leading: const Padding(
        padding: EdgeInsets.all(16.0),
        child: NotificationIcon(),
      ),
      title: Text('اسم المادة', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s20,color: ColorManager.white)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p13, vertical: AppPadding.p16),
          child: SvgPicture.asset(ImageAssets.arrowBackIcon, color: ColorManager.white),
        ),
      ],
    );
  }
}
