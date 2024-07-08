import 'package:academia/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import 'custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(text:
                AppStrings.changeLanguage,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(ImageAssets.egypt),
              ],
            ),
            title: Align(
                alignment: Alignment.centerRight,
                child: CustomText(text:
                AppStrings.changeLanguage,
                  style: Theme.of(context).textTheme.bodyLarge!,
                )),
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.language),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          ListTile(
            leading: SvgPicture.asset(ImageAssets.switchButton),
            title: Align(
                alignment: Alignment.centerRight,
                child: CustomText(text:
                AppStrings.nightMode,
                  style: Theme.of(context).textTheme.bodyLarge!,
                )),
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.mode),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          ListTile(
            leading: SvgPicture.asset(ImageAssets.arrowLeft),
            title: Align(
                alignment: Alignment.centerRight,
                child: CustomText(text:
                AppStrings.changePassword,
                  style: Theme.of(context).textTheme.bodyLarge!,
                )),
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.lock),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          ListTile(
            leading: SvgPicture.asset(ImageAssets.arrowLeft),
            title: Align(
                alignment: Alignment.centerRight,
                child: CustomText(text:
                AppStrings.rateOurApp,
                  style: Theme.of(context).textTheme.bodyLarge!,
                )),
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.heart),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          
          ListTile(
            title: Align(
                alignment: Alignment.centerRight,
                child: CustomText(text:
                AppStrings.logout,
                  style: Theme.of(context).textTheme.bodyLarge!,
                )),
            trailing: CircleAvatar(
              radius: 30,
              backgroundColor: ColorManager.lightOrange1,
              child: SvgPicture.asset(ImageAssets.logout),
            ),
          ),
        ],
      ),
    );
  }
}
