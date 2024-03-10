import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../horizontal_bar.dart';
import '../list_views_items/category_item.dart';
import '../list_views_items/task_component.dart';

class StartQuizBottomSheet extends StatelessWidget {
  const StartQuizBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
        color: ColorManager.bottomSheetBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppPadding.p16),
          topRight: Radius.circular(AppPadding.p16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HorizontalBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
            const Expanded(
              flex: 10,
              child: TaskComponent(),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CategoryItem(
                  title: '30 دقيقة',
                  // height: AppSize.s25,
                  // width: AppSize.s100,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: 12,
                ),
                const SizedBox(width: AppSize.s10,),
                const CategoryItem(
                  title: '15 سؤال',
                  // height: AppSize.s25,
                  // width: AppSize.s100,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: 12,
                ),
                const Spacer(),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'الوصف',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.grey,
                      fontSize: FontSize.s16,
                      height: AppSize.s2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s12,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(Routes.takeQuizScreen);
                },
                child: Text("ابدأ الاختبار", style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
