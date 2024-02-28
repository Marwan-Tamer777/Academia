import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class LastTaskGradeAndEvents extends StatelessWidget {
  const LastTaskGradeAndEvents({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8,),
      child: Row(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("درجة اخر اختبار", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s10, color: ColorManager.lightGrey),),
                  const SizedBox(height: AppSize.s5),
                  Text("لا يوجد", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s11, color: ColorManager.textOrange),),
                ],
              ),
              const SizedBox(width: AppSize.s5),
              Container(
                height: AppSize.s40,
                width: AppSize.s45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  color: ColorManager.darkWhite,
                ),
                child: SvgPicture.asset(
                  ImageAssets.calendar,
                  width: AppSize.s30,
                  height: AppSize.s30,
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("الحدث القادم", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s10, color: ColorManager.lightGrey),),
                  const SizedBox(height: AppSize.s5),
                  Text("12 فبراير 2023", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s11, color: ColorManager.textOrange),),
                ],
              ),
              const SizedBox(width: AppSize.s5),
              Container(
                height: AppSize.s40,
                width: AppSize.s45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s5),
                  color: ColorManager.darkWhite,
                ),
                child: SvgPicture.asset(
                  ImageAssets.grades,
                  width: AppSize.s30,
                  height: AppSize.s30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
