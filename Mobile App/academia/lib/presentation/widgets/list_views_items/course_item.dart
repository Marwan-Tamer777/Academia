import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/widgets/bottom_sheets/profile_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../bottom_sheets/task_submission_bottom_sheet.dart';
import 'category_item.dart';

class CourseItem extends StatelessWidget {
  final bool isLocked;
  const CourseItem({super.key, this.isLocked = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(Routes.coursesScreen);
      },
      child: Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          height: AppSize.s150,
          width: AppSize.s336,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppPadding.p16),
            color: Theme.of(context).canvasColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          isLocked
                              ? ImageAssets.lock
                              : ImageAssets.notification,
                          width: AppSize.s30,
                          height: AppSize.s30,
                          color: ColorManager.textOrange,
                        ),
                        SizedBox(
                          width: AppSize.s190,
                          height: AppSize.s20,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              CategoryItem(
                                title: "مادة نشطة",
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppPadding.p10,
                                ),
                                // width: AppSize.s50,
                                // height: AppSize.s18,
                                color: Theme.of(context)
                                    .extension<CustomThemeExtension>()!
                                    .greenOverlayColor,
                                textColor: Theme.of(context)
                                    .extension<CustomThemeExtension>()!
                                    .successColor,
                              ),
                              const CategoryItem(
                                title: "نظم المعلومات",
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p10,
                                ),
                                // width: AppSize.s25,
                                // height: AppSize.s18,
                                color: ColorManager.lightOrange1,
                                textColor: ColorManager.textOrange,
                              ),
                              const CategoryItem(
                                title: "IS1545",
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p10,
                                ),
                                // width: AppSize.s25,
                                // height: AppSize.s18,
                                color: ColorManager.lightOrange1,
                                textColor: ColorManager.textOrange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "منهجيات البحث العلمي والتطوير ",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: FontSize.s16),
                      textAlign: TextAlign.right,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("  +1 آخرون",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: FontSize.s11)),
                        const SizedBox(
                          width: AppSize.s10,
                        ),
                        InkWell(
                            onTap: () {
                              showCustomBottomSheet(
                                  context: context,
                                  bottomSheet: const ProfileBottomSheet());
                            },
                            child: Text("مروان تامر - أحمد محسن",
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(fontSize: FontSize.s12))),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: AppSize.s115,
                  width: AppSize.s115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s16),
                    // color: ColorManager.transparent,
                  ),
                  child: Center(
                    child: SvgPicture.asset(Theme.of(context)
                        .extension<CustomThemeExtension>()!
                        .courseIcon),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
