import 'package:academia/app/dep_injection.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../../screens/bottom_nav_bar/bottom_nav_bar_screens/courses/Courses_cubit/courses_cubit.dart';
import '../custom_text.dart';
import '../common_widgets.dart';
import '../elements/horizontal_bar.dart';
import '../list_views_items/category_item.dart';


class CourseRegistrationBottomSheet extends StatelessWidget {
  final Course course;
  const CourseRegistrationBottomSheet({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Container( 
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 15,
            right: 15,
            top: 10,
          ),
          margin: const EdgeInsets.only(
            bottom: 30,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppPadding.p16),
              topRight: Radius.circular(AppPadding.p16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HorizontalBar(),

              const SizedBox(
                height: AppSize.s10,
              ),


              CircleAvatar(
                radius: AppSize.s36,
                backgroundColor: ColorManager.lightOrange1,
                child: Center(
                  child: SvgPicture.asset(
                    ImageAssets.lock,
                    height: AppSize.s40,
                    width: AppSize.s40,
                  ),
                ),
              ),

              const SizedBox(
                height: AppSize.s10,
              ),
              CustomText(text:
              course.name!,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: FontSize.s16,
                ),
              ),


              const SizedBox(
                height: AppSize.s10,
              ),
              CustomText(text:
              '${course.status} - ${course.courseCode}',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: FontSize.s14,
                ),
              ),


              const SizedBox(
                height: AppSize.s16,
              ),


              CommonTextFormField(
                controller: searchController,
                hint: AppStrings.writeCourseCode,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child:InkWell(
                      onTap: () {
                        var cubit = getItInstance<CoursesCubit>();
                        cubit.enrollInCourse(course.id!, searchController.text); 
                        Navigator.pop(context); 
                      },
                      child: SvgPicture.asset(ImageAssets.send)),
                ),
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CategoryItem(
                    title: course.programName,
                    color: ColorManager.lightOrange1,
                    textColor: ColorManager.textOrange,
                    fontSize: 12,
                  ),
                  const Spacer(),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: CustomText(text:
                    AppStrings.courseDescription,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: Colors.grey,
                        fontSize: FontSize.s16,
                        height: AppSize.s2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              CustomText(text:
              course.description!,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: FontSize.s12, 
                ),
                lines: 3,
              ),
              const SizedBox(
                height: AppSize.s16,
              ),

              // // todo: students circle avatars
              // Circles(),
            ],
          ),
        );
  }
}
