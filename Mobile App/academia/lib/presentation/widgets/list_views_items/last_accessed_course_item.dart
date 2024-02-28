import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/widgets/elements/last_task_grade_and_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import 'category_item.dart';

class LastAccessedCourseItem extends StatelessWidget {
  const LastAccessedCourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      height: AppSize.s300,
      width: AppSize.s400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p16),
        color: ColorManager.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.lock,
                          width: AppSize.s41,
                          height: AppSize.s15,
                        ),
                        const CategoryItem(
                          title: "مادة نشطة",
                          width: AppSize.s50,
                          height: AppSize.s15,
                          color: ColorManager.lightGreen2,
                          textColor: ColorManager.lightGreen,
                        ),
                        const CategoryItem(
                          title: "نظم المعلومات",
                          width: AppSize.s25,
                          height: AppSize.s15,
                          color: ColorManager.lightOrange1,
                          textColor: ColorManager.textOrange,
                        ),
                        const CategoryItem(
                          title: "IS1545",
                          width: AppSize.s25,
                          height: AppSize.s15,
                          color: ColorManager.lightOrange1,
                          textColor: ColorManager.textOrange,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.s15),
                    Text("منهجيات البحث العلمي والتطوير ", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s16)),
                    const SizedBox(height: AppSize.s15),
                    Text("مروان تامر - أحمد محسن  +1 آخرون", style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: FontSize.s12)),
                  ],
                ),
              ),
              const SizedBox(width: AppSize.s10),
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
          ),
          const SizedBox(height: AppSize.s20),
          const LastTaskGradeAndEvents(),
        ],
      )
    );
  }
}
