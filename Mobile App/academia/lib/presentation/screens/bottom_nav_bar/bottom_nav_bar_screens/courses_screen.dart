import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screens_states.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screents_cubit.dart';
import 'package:academia/presentation/widgets/bottom_sheets/course_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../widgets/backgrounds/background.dart';
import '../../../widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/elements/notification_icon.dart';
import '../../../widgets/list_views_items/category_item.dart';
import '../../../widgets/list_views_items/course_item.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    //int isSearch = 1; // 0 for not searching, 1 for searching

    TextEditingController searchController = TextEditingController();
    return BlocConsumer<CoursesCubit, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesCubit.of(context);
        return SingleChildScrollView(
          child: Stack(children: [
            // background
            const Background(),
            Column(
              children: [
                // title and notification icon
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NotificationIcon(),
                          Text(
                            "👋  أهلا, مروان",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: FontSize.s18,
                                  color: ColorManager.white,
                                ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      Text("أكمل رحلتك الدراسية الآن",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontSize: FontSize.s24,
                                  color: ColorManager.white)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s40,
                ),

                // search field
                CommonTextFormField(
                  controller: searchController,
                  hint: "...ابحث عن موادك الدراسية بالاسم أو الكود",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(ImageAssets.search),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),

                // categories
                SizedBox(
                  height: AppSize.s50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const CategoryItem(
                        title: "نظم المعلومات",
                        // width: AppSize.s119,
                        // height: AppSize.s36,
                        color: ColorManager.lightOrange1,
                        textColor: ColorManager.textOrange,
                        fontSize: FontSize.s13,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: AppSize.s10,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),

                // courses
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const CourseItem();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: AppSize.s10,
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s100,
                ),
                // if there is no courses
                // const NoCoursesBackground(),
                // const NoCoursesComponent(),
              ],
            ),
          ]),
        );
      },
    );
  }
}
