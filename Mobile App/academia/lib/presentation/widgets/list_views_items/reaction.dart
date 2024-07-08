import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class PostReactions extends StatelessWidget {
  // final Post post; 
  final int likes;
  final int comments;
  const PostReactions({super.key, required this.likes, required this.comments});

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
                CustomText(text: 
                  comments.toString(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: FontSize.s16,
                    color: ColorManager.lightGrey,
                  ),
                ),
                const SizedBox(
                  width: 5,
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
              CustomText(text: 
                  likes.toString(),
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
