import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcons extends StatelessWidget {
  final String iconPath;
  const SocialMediaIcons({Key? key, required this.iconPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s63,
      width: AppSize.s63,
      child: Stack(
        children: [
          Container(
            height: AppSize.s63,
            width: AppSize.s63,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
          ),
          Center(
            child: Container(
              height: AppSize.s43,
              width: AppSize.s43,
              decoration: BoxDecoration(
                color: ColorManager.lightOrange1,
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p6),
                child: SvgPicture.asset(
                  iconPath,
                  color: ColorManager.textOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
