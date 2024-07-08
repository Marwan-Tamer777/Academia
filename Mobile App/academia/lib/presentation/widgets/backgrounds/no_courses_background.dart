import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../custom_text.dart';

class NoCoursesBackground extends StatelessWidget {
  const NoCoursesBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.s50,),
            Stack(
              children: [
                Center(child: SvgPicture.asset(ImageAssets.empty,color: ColorManager.lightOrange1,),),
                Center(child: SvgPicture.asset(ImageAssets.noCourses)),
              ],
            ),
            const SizedBox(height: AppSize.s20,),
            CustomText(text: AppStrings.noCourses, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s18)),
            const SizedBox(height: AppSize.s10,),
            CustomText(text: AppStrings.exploreCourses, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
            CustomText(text: AppStrings.searchBySubject, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
            CustomText(text: AppStrings.searchByCode, style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
          ],
        ),
      )
    );
  }
}
