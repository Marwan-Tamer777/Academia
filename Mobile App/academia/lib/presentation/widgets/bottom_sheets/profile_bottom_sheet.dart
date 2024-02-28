import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../elements/social_media_icons.dart';
import '../horizontal_bar.dart';
import '../list_views_items/category_item.dart';

class ProfileBottomSheet extends StatelessWidget {
  const ProfileBottomSheet({Key? key}) : super(key: key);

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
          mainAxisSize: MainAxisSize.max,
          children: [
            const HorizontalBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
            Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://picsum.photos/seed/578/600',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'مروان تامر جلال عبدالمجيد',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              'أستاذ مساعد',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s14,
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
                  height: AppSize.s25,
                  width: AppSize.s100,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
                const Spacer(),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Text(
                    'الوصف',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.grey,
                      fontSize: FontSize.s16,
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
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: Text(
                'وسائل التواصل',
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
            SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SocialMediaIcons(iconPath: ImageAssets.whatsapp),
                SizedBox(width: AppSize.s10),
                SocialMediaIcons(iconPath: ImageAssets.facebook),
                SizedBox(width: AppSize.s10),
                SocialMediaIcons(iconPath: ImageAssets.linkedin),
                SizedBox(width: AppSize.s10),
                SocialMediaIcons(iconPath: ImageAssets.microsoft),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
