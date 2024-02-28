import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s40,
      height: AppSize.s40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10)),
      ),
      child: SvgPicture.asset(
        ImageAssets.notification,
        width: AppSize.s30,
        height: AppSize.s30,
      ),
    );
  }
}
