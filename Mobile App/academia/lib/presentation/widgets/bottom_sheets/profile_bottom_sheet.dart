import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/widgets/social_media_contacts.dart';
import 'package:academia/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';
import '../elements/social_media_icons.dart';
import '../elements/horizontal_bar.dart';
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
            //const UserImage(radius: AppSize.s120),


            const SizedBox(height: AppSize.s10,),

            CustomText(text: 
              'مروان تامر جلال عبدالمجيد',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            CustomText(text: 
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
                  title: AppStrings.informationSystem,
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: FontSize.s12,
                ),
                const Spacer(),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: CustomText(text: 
                    AppStrings.courseDescription,
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
            CustomText(text: 
              'دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s12,
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Align(
              alignment: const AlignmentDirectional(1, 0),
              child: CustomText(text: 
                AppStrings.socialMedia,
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
            ),
            const SizedBox(height: 10,),
            const SocialMediaContacts(),
          ],
        ),
      ),
    );
  }
}
