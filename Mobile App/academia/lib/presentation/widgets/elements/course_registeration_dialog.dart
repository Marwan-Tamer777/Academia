import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';

class CourseRegistrationDialog extends StatelessWidget {
  const CourseRegistrationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        height: AppSize.s250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: ColorManager.white,
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppSize.s36,
              backgroundColor: ColorManager.success,
              child: SvgPicture.asset(
                ImageAssets.success,
                width: AppSize.s50,
                height: AppSize.s50,
              ),
            ),
            const SizedBox(height: AppSize.s16),
            Text(
              "تمت إضافة المادة",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
                color: ColorManager.black,
              ),
            ),
            SizedBox(height: AppSize.s16),
            Text(
              " يمكنك الآن متابعة أحدث  المستجدات ",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: FontSize.s14,
                color: ColorManager.lightGrey,
              ),
            ),

            const SizedBox(height: AppSize.s16),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("تصفح المحتوى", style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
          ],
        ),
      )
    );
  }
}
