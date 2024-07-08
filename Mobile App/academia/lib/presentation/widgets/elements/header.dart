import 'package:academia/app/language/locale_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../custom_text.dart';
import 'notification_icon.dart';

class ScreenHeader extends StatelessWidget {
  final String title; 
  final bool isBackButton;
  const ScreenHeader({super.key, required this.title, required this.isBackButton});

  @override
  Widget build(BuildContext context) { 
    MyLocaleController localeController = Get.find<MyLocaleController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const NotificationIcon(),
        CustomText(text: title, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s17,color: ColorManager.white)),
        isBackButton ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Transform( 
            transform: localeController.isArabicLanguage() ? Matrix4.rotationY(3.141592) : Matrix4.rotationY(0),
            child: SvgPicture.asset(
              ImageAssets.arrowBackIcon,
              color: ColorManager.white,
            ),
          ),
        ) : const SizedBox(width: 24,),
      ],
    );
  }
}
