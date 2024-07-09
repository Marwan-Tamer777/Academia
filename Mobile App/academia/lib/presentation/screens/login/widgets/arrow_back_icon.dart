import 'package:academia/app/language/locale_controller.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({super.key});

  @override
  Widget build(BuildContext context) { 
    MyLocaleController localeController = Get.find<MyLocaleController>();

    return IconButton(
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
        );
  }
}