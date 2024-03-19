import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class PostReactions extends StatelessWidget {
  const PostReactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24, vertical: AppPadding.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.postComments);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4092',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: FontSize.s16,
                    color: ColorManager.lightGrey,
                  ),
                ),
                SvgPicture.asset(
                  ImageAssets.message,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ImageAssets.arrowDown,
                width: AppSize.s24,
                height: AppSize.s24,
              ),
              Text(
                '4092',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.lightGrey,
                ),
              ),
              SvgPicture.asset(
                ImageAssets.arrowUp,
                width: AppSize.s24,
                height: AppSize.s24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
