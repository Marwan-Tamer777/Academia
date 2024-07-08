import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';

class FingerPrintButton extends StatelessWidget {
  const FingerPrintButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      onPressed: () {},
      child: SvgPicture.asset(
          ImageAssets.imagesAndroidFingerprint),
    );
  }
}
