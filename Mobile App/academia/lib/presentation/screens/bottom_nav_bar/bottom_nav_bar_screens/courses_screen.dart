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
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    //int isSearch = 1; // 0 for not searching, 1 for searching

    TextEditingController searchController = TextEditingController();
    return BlocConsumer<CoursesCubit,CoursesState>(
      listener: (context,state) {},
      builder: (context,state) {

        var cubit = CoursesCubit.of(context);
        return Stack(
            children: [
              // background
              const Background(),
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
                            Text("اكتشف المزيد من", style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: FontSize.s15,color: ColorManager.white)),
                            const SizedBox(height: AppSize.s10,),
                            Text("المواد الدراسية", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s29, color: ColorManager.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s40,),

                  // search bar
                  Positioned(
                      top: 150,
                      // make it in the center
                      left: MediaQuery.of(context).size.width / 2 - 190,
                      right: MediaQuery.of(context).size.width / 2 - 190,
                      child: CommonTextFormField(
                        controller: searchController,
                        hint: "ابحث عن المواد الجديدة ",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                              onTap: () {
                                cubit.search();
                              },
                              child: SvgPicture.asset(ImageAssets.search)),
                        ),
                      )
                  ),
                  const SizedBox(height: AppSize.s20,),

                  // categories and courses
                  if(!cubit.isSearch)
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
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
                          const SizedBox(height: AppSize.s10,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(AppPadding.p16,),
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
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s20,),

                  // search results part
                  if(cubit.isSearch)
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Text(
                              "نتائج البحث",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSize.s15, color: ColorManager.lightGrey),
                            ),
                            leading: Text(
                              "مسح",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: FontSize.s15, color: ColorManager.lightGrey),
                            ),
                            onTap: () {
                              // navigate to course details
                            },
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context,index) {
                                return ListTile(
                                  trailing: Text("نظم المعلومات", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s15, color: ColorManager.lightGrey),),
                                  leading: Text("IS678", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: FontSize.s15, color: ColorManager.textOrange),),
                                  onTap: () {
                                    showCustomBottomSheet(
                                        context: context,
                                        bottomSheet: const CourseRegisterationBottomSheet()
                                    );
                                  },
                                );
                              },
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    ),


                  // if no courses
                  //   const NoCoursesBackground(),
                ],
              ),
            ]
        );
      },
    );
  }
}
