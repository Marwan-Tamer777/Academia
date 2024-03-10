import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/widgets/elements/course_registeration_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../common_widgets.dart';
import '../horizontal_bar.dart';
import '../list_views_items/category_item.dart';

class CourseRegisterationBottomSheet extends StatelessWidget {
  const CourseRegisterationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
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
          mainAxisSize: MainAxisSize.max,
          children: [
            const HorizontalBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
            CircleAvatar(
              radius: AppSize.s36,
              backgroundColor: ColorManager.lightOrange1,
              child: Center(
                child: SvgPicture.asset(
                  ImageAssets.lock,
                  height: AppSize.s40,
                  width: AppSize.s40,
                ),
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'منهجيات البحث العلمي والتطوير ',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'مادة نشطة - IS1545',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            CommonTextFormField(
              controller: searchController,
              hint: "اكتب كود التفعيل",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child:InkWell(
                    onTap: () {
                      const CourseRegistrationDialog();
                    },
                    child: SvgPicture.asset(ImageAssets.send)),
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CategoryItem(
                  title: 'نظم المعلومات',
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

            // todo: students circle avatars
          ],
        ),
      ),
    );
  }
}
