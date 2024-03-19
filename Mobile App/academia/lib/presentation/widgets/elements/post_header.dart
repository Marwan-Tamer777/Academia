import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

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
              Text(
                'تواصل',
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
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'محمد أحمد حسنين',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s12,
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              'منذ 15 ساعة',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: FontSize.s8,
                color: ColorManager.lightGrey,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10,),
        const CircleAvatar(
          radius: AppSize.s20,
          backgroundColor: ColorManager.lightOrange1,
        ),
      ],
    );
  }
}
