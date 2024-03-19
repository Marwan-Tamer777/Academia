import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/widgets/elements/horizontal_bar.dart';
import 'package:academia/presentation/widgets/list_views_items/task_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../list_views_items/category_item.dart';
import '../list_views_items/task-submission_list_item.dart';

class TaskSubmissionBottomSheet extends StatelessWidget {
  const TaskSubmissionBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
          //mainAxisSize: MainAxisSize.max,
          children: [
            // make a custom horizontal line by a container with a height of 1
            const HorizontalBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
            const TaskComponent(),
            const SizedBox(
              height: AppSize.s10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الملفات',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.grey,
                  fontSize: FontSize.s16,
                  height: AppSize.s2,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Container(
              height: AppSize.s150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImageAssets.drobFile),
                    const SizedBox(height: AppSize.s10),
                    Text('ارفع ملفاتك الآن', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s12, color: ColorManager.black),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSize.s10),
            const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                CategoryItem(
                  title: '10 MB<',
                  // height: AppSize.s40,
                  // width: AppSize.s80,
                  color: ColorManager.transparent,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
                SizedBox(width: AppSize.s5,),
                CategoryItem(
                  title: 'TXT',
                  // height: AppSize.s30,
                  // width: AppSize.s40,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
                SizedBox(width: AppSize.s5,),
                CategoryItem(
                  title: 'DOCX',
                  // height: AppSize.s30,
                  // width: AppSize.s50,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
                SizedBox(width: AppSize.s5,),
                CategoryItem(
                  title: 'PDF',
                  // height: AppSize.s30,
                  // width: AppSize.s40,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            const TaskSubmissionListItem(),
            const SizedBox(
              height: AppSize.s15,
            ),
            SizedBox(
              height: AppSize.s50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context,rootNavigator: true).pushNamed(Routes.takeQuizScreen);
                },
                child: Text('تبقى 4  محاولات', style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
            // todo: students circle avatars
          ],
        ),
      ),
    );
  }
}

void showCustomBottomSheet({required Widget bottomSheet,required BuildContext context}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (context) => bottomSheet,
  );
}
