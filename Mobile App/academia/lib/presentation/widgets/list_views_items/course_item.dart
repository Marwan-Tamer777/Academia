import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/widgets/bottom_sheets/profile_bottom_sheet.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        Navigator.of(context, rootNavigator: true).pushNamed(Routes.coursesScreen);
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        height: AppSize.s150,
        width: AppSize.s336,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          color: ColorManager.white,
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
                      Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                          isLocked ? ImageAssets.lock : ImageAssets.notification,
                          width: AppSize.s30,
                          height: AppSize.s30,
                          color: ColorManager.textOrange,
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: CategoryItem(
                          title: "مادة نشطة",
                          width: AppSize.s70,
                          height: AppSize.s30,
                          color: ColorManager.lightGreen2,
                          textColor: ColorManager.lightGreen,
                          fontSize: FontSize.s10,
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s5,
                      ),
                      const Expanded(
                        flex: 2,
                        child: CategoryItem(
                          title: "نظم المعلومات",
                          width: AppSize.s100,
                          height: AppSize.s30,
                          color: ColorManager.lightOrange1,
                          textColor: ColorManager.textOrange,
                          fontSize: FontSize.s8,
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s5,
                      ),
                      const Expanded(
                        flex: 2,
                        child: CategoryItem(
                          title: "IS1545",
                          width: AppSize.s50,
                          height: AppSize.s30,
                          color: ColorManager.lightOrange1,
                          textColor: ColorManager.textOrange,
                          fontSize: FontSize.s10,
                        ),
                      ),
                    ],
                  ),
                  Text("منهجيات البحث العلمي والتطوير ", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("  +1 آخرون", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s11)),
                      const SizedBox(width: AppSize.s10,),
                      InkWell(
                          onTap: () {
                            showCustomBottomSheet(
                                context: context,
                                bottomSheet: const ProfileBottomSheet()
                            );
                          },
                          child: Text("مروان تامر - أحمد محسن", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12))),
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
                  color: ColorManager.white,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.courseIcon,
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
