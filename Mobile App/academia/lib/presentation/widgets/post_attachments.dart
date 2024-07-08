import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'custom_text.dart';
import 'list_views_items/category_item.dart';

class PostAttachments extends StatelessWidget {
  const PostAttachments({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        CategoryItem(
          width: AppSize.s100,
          color: ColorManager.lightOrange1,
          textColor: ColorManager.textOrange,
          fontSize: FontSize.s12,
          child: Row(
            children: [
              CustomText(text:
              AppStrings.summary,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 10, color: ColorManager.textOrange),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(ImageAssets.pdf),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        CategoryItem(
          width: AppSize.s100,
          color: ColorManager.lightOrange1,
          textColor: ColorManager.textOrange,
          fontSize: FontSize.s12,
          child: Row(
            children: [
              CustomText(text:
              AppStrings.summary,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 10, color: ColorManager.textOrange),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(ImageAssets.pdf),
            ],
          ),
        ),
      ],
    );
  }
}
