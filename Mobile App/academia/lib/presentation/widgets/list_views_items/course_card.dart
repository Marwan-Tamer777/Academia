import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../elements/last_task_grade_and_events.dart';
import 'category_item.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 400,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(16),
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: AppSize.s50,
            backgroundColor: ColorManager.lightOrange1,
            child: Center(
              child: SvgPicture.asset(
                ImageAssets.book,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s16),
          Text("منهجيات البحث العلمي والتطوير ", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s16)),
          const SizedBox(height: AppSize.s16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CategoryItem(
                title: "مادة نشطة",
                // width: AppSize.s70,
                // height: AppSize.s30,
                color: ColorManager.lightGreen2,
                textColor: ColorManager.lightGreen,
                fontSize: FontSize.s10,
              ),
              SizedBox(width: AppSize.s5),
              CategoryItem(
                title: "نظم المعلومات",
                // width: AppSize.s80,
                // height: AppSize.s30,
                color: ColorManager.lightOrange1,
                textColor: ColorManager.textOrange,
                fontSize: FontSize.s10,
              ),
              SizedBox(width: AppSize.s5),
              CategoryItem(
                title: "IS1545",
                // width: AppSize.s50,
                // height: AppSize.s30,
                color: ColorManager.lightOrange1,
                textColor: ColorManager.textOrange,
                fontSize: FontSize.s10,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s16),
          const LastTaskGradeAndEvents(),
          const SizedBox(height: AppSize.s16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'الوصف',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s16,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            'دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ دكتور تجميل وجراحة مناظير بمستشفى الخانكة قسم اول أ',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: Colors.grey,
              fontSize: FontSize.s12,
              height: AppSize.s2,
            ),
            textDirection: TextDirection.rtl,
          ),

          // todo: add students circle avatars


        ],
      ),
    );
  }
}
