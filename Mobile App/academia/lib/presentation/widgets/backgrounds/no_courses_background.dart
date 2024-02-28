import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

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
            const SizedBox(height: AppSize.s150,),
            Stack(
              children: [
                Center(child: SvgPicture.asset(ImageAssets.empty,color: ColorManager.lightOrange1,),),
                Center(child: SvgPicture.asset(ImageAssets.noCourses)),
              ],
            ),
            const SizedBox(height: AppSize.s20,),
            Text("لا يوجد لديك أي مواد دراسية", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s18)),
            const SizedBox(height: AppSize.s10,),
            Text("استكشف الآن المواد الدراسية الخاصة بك", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
            Text("عن طريق البحث باسم المادة أو الكود", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
            Text("لخاص بها ورمز التفعيل", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
          ],
        ),
      )
    );
  }
}
