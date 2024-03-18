import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:academia/presentation/widgets/header.dart';
import 'package:academia/presentation/widgets/list_views_items/course_card.dart';
import 'package:academia/presentation/widgets/list_views_items/text_post_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/elements/notification_icon.dart';
import '../../widgets/list_views_items/category_item.dart';
import '../bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '../bottom_nav_bar/bottom_nav_bar_cubit/bottom_nav_bar_states.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
              children: [
                // background
                Background(height: AppSize.s300.toInt(),),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    children: [
                      // title and notification icon
                      const ScreenHeader(title: "المادة الدراسية",),
                      const SizedBox(height: AppSize.s40,),
          
                      // course card details
                      const CourseCard(),
                      const SizedBox(height: AppSize.s20,),
          
                      // course partitions
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryItem(
                            title: "تنبيهات",
                            // width: AppSize.s100,
                            // height: AppSize.s50,
                            color: ColorManager.transparent,
                            textColor: ColorManager.lightGrey,
                            fontSize: FontSize.s16,
                          ),
                          CategoryItem(
                            title: "تكليفات",
                            // width: AppSize.s100,
                            // height: AppSize.s50,
                            color: ColorManager.transparent,
                            textColor: ColorManager.lightGrey,
                            fontSize: FontSize.s16,
                          ),
                          CategoryItem(
                            title: "منشورات",
                            // width: AppSize.s100,
                            // height: AppSize.s50,
                            color: ColorManager.darkBlueBackground,
                            textColor: ColorManager.white,
                            fontSize: FontSize.s16,
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s20,),
          
                      // posts
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) {
                          return const TextPostItem();
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(height: AppSize.s10,);
                        },
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
