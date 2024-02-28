import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';

class ClipPathBackground extends StatelessWidget {
  final int height;
  const ClipPathBackground({Key? key, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height.toDouble(),
          width: MediaQuery.of(context).size.width,
          child: ClipPath(
            child: Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                ImageAssets.imagesSplashScreenPattern,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
