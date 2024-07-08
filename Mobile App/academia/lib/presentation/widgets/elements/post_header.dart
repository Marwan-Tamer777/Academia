import 'package:academia/domain/models/post.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/courses/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.more_horiz,
          size: AppSize.s24,
        ),
        const SizedBox(width: AppSize.s16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p4),
          decoration: BoxDecoration(
            color: ColorManager.textOrange,
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 
                AppStrings.contact,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: FontSize.s12,
                  color: ColorManager.white,
                ),
              ),
              SvgPicture.asset(
                ImageAssets.messageComment,
                width: AppSize.s24,
                height: AppSize.s24,
              ),
            ],
          ),
        ),         const Spacer(),

              CustomText(text: 
              dateTimeFormatter(post.postingDate!.toIso8601String()),
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: FontSize.s14,
                color: ColorManager.lightGrey,
              ),
            ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: [
        //     CustomText(text: 
        //       post.user!.name ?? '',
        //       style: Theme.of(context).textTheme.displayLarge!.copyWith(
        //         fontSize: FontSize.s12,
        //       ),
        //     ),
        //     const SizedBox(height: 5,),
        //     CustomText(text: 
        //       post.postingDate ?? '',
        //       style: Theme.of(context).textTheme.displayMedium!.copyWith(
        //         fontSize: FontSize.s8,
        //         color: ColorManager.lightGrey,
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(width: 10,),
        // const CircleAvatar(
        //   radius: AppSize.s20,
        //   backgroundColor: ColorManager.lightOrange1,
        // ),
      ],
    );
  }
}
