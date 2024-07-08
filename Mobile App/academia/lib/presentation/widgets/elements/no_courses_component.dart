import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';
import '../custom_text.dart';

class NoCoursesComponent extends StatelessWidget {
  const NoCoursesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s187,
      width: AppSize.s336,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        color: Theme.of(context).canvasColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: ColorManager.lightOrange1,
              radius: AppSize.s30,
              child: SvgPicture.asset(ImageAssets.error)),
          const SizedBox(height: AppSize.s20),
          CustomText(text: AppStrings.noCourses
            ,style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s18),),
          const SizedBox(height: AppSize.s10),
          CustomText(text: AppStrings.addMaterial
            ,style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s18),),
        ],
      ),
    );
  }
}
