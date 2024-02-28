import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screens_states.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/screens_cubit/screents_cubit.dart';
import 'package:academia/presentation/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';
import '../../../widgets/backgrounds/background.dart';
import '../../../widgets/elements/notification_icon.dart';
import '../../../widgets/list_views_items/category_item.dart';
import '../../../widgets/list_views_items/course_item.dart';
import '../../../widgets/list_views_items/last_accessed_course_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return BlocConsumer<CoursesCubit,CoursesState>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = CoursesCubit.of(context);
        return SingleChildScrollView(
          child: Stack(
              children: [
                Background(height: AppSize.s300.toInt(),),
                Column(
                  children: [
                    // title and notification icon
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const NotificationIcon(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("اهلا مروان", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s15,color: ColorManager.white)),
                              const SizedBox(height: AppSize.s10,),
                              Text("أكمل رحلتك الدراسية الآن", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s29, color: ColorManager.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s40,),
                    // last accessed courses

                    SizedBox(
                      height: AppSize.s230,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context,index) {
                          return const LastAccessedCourseItem();
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(width: AppSize.s10,);
                        },
                        itemCount: cubit.coursesList.length,
                      ),
                    ),
                    const SizedBox(height: AppSize.s20,),

                    // last accessed courses indicator
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(cubit.coursesList.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            height: 10,
                            width: 1 == index ? 30 : 10,
                            decoration: BoxDecoration(
                              color: cubit.currenttIndex == index
                                  ? ColorManager.textOrange
                                  : ColorManager.lightOrange1,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20,),

                    // search field
                    Positioned(
                        top: 150,
                        // make it in the center
                        left: MediaQuery.of(context).size.width / 2 - 190,
                        right: MediaQuery.of(context).size.width / 2 - 190,
                        child: CommonTextFormField(
                          controller: searchController,
                          hint: "ابحث عن موادك الدراسية بالاسم أو الكود ... ",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(ImageAssets.search),
                          ),
                        )
                    ),
                    const SizedBox(height: AppSize.s20,),

                    // categories
                    SizedBox(
                      height: AppSize.s50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context,index) {
                          return const CategoryItem(
                            title: "نظم المعلومات",
                            width: AppSize.s119,
                            height: AppSize.s36,
                            color: ColorManager.lightOrange1,
                            textColor: ColorManager.textOrange,
                            fontSize: FontSize.s13,
                          );
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(width: AppSize.s10,);
                        },
                        itemCount: 10,
                      ),
                    ),
                    const SizedBox(height: AppSize.s20,),

                    // courses
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context,index) {
                          return const CourseItem();
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(height: AppSize.s10,);
                        },
                        itemCount: 10,
                      ),
                    ),

                    // if there is no courses
                    // const NoCoursesBackground(),
                    // const NoCoursesComponent(),
                  ],
                ),
              ]
          ),
        );
      },
    );
  }
}
