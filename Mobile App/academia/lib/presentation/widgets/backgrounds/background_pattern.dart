import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class BackgroundPattern extends StatelessWidget {
  const BackgroundPattern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: AppSize.s5,
          sigmaY: AppSize.s5,
        ),
        child: Opacity(
          opacity: 0.15,
          child: SvgPicture.asset(
            ImageAssets.imagesOnBoardingPattern,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
