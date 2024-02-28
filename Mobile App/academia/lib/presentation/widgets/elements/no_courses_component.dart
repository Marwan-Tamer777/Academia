import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';

class NoCoursesComponent extends StatelessWidget {
  const NoCoursesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: MediaQuery.of(context).size.height / 2 - 250, // make it in the center
          // make it in the center
          left: MediaQuery.of(context).size.width / 2 - 168,
          right: MediaQuery.of(context).size.width / 2 - 168,
      child: Container(
        height: AppSize.s187,
        width: AppSize.s336,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: ColorManager.white,
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
            Text("لا يوجد مواد دراسية",style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s18),),
            const SizedBox(height: AppSize.s10),
            Text(" يمكنك إضافة موادك الدراسية",style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s18),),
          ],
        ),
      ),
    );
  }
}
