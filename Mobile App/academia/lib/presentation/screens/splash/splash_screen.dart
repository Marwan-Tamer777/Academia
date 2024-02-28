import 'dart:async';
import 'dart:ui';

import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/constants.dart';
import '../../resources/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: AppConstants.splashTime), () {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Background Color
          Container(
            color: ColorManager.darkBlueBackground,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),

          /// Background Pattern
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Opacity(
                opacity: 0.1, 
                child: SvgPicture.asset(
                  ImageAssets.imagesSplashScreenPattern,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// Logo
          SvgPicture.asset(ImageAssets.imagesAcademiaLogo),
        ],
      ),
    );
  }
}
