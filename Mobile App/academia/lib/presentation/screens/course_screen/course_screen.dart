import 'package:academia/app/dep_injection.dart';
import 'package:academia/domain/models/course.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/home/home_widgets/no_data_state.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_cubit.dart';
import 'package:academia/presentation/screens/course_screen/cubit/course_states.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:academia/presentation/widgets/bottom_sheets/task_submission_bottom_sheet.dart';
import 'package:academia/presentation/widgets/elements/header.dart';
import 'package:academia/presentation/widgets/list_views_items/calender_task_list.dart';
import 'package:academia/presentation/widgets/list_views_items/course_card.dart';
import 'package:academia/presentation/widgets/list_views_items/text_post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/values_manager.dart';
import '../../widgets/list_views_items/category_item.dart';

class CourseScreen extends StatelessWidget { 
  final Course course;
  const CourseScreen({super.key,required this.course});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseCubit>.value ( 
      value: getItInstance<CourseCubit>()..setCourse(course), 
       child: BlocConsumer<CourseCubit, CourseStates>(
        listener: (context, state) {  
          if(state is UnEnrollCourseSuccessState) {
            Navigator.pop(context);  
            Navigator.pop(context);  
          }
        },
        builder: (context, state) { 
          var cubit = CourseCubit.of(context);
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
                      const ScreenHeader(title: AppStrings.academicSubject,),
                      const SizedBox(height: AppSize.s40,),
          
                      // course card details
                      CourseCard(course: course,),
                      const SizedBox(height: AppSize.s20,),
          
                      // course partitions
                     Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < cubit.categories.length; i++)
                                GestureDetector(
                                  onTap: () => cubit.changeTab(i),
                                  child: CategoryItem(
                                    title: cubit.categories[i],
                                    color: cubit.currentTab == i ? ColorManager.buttonColor : ColorManager.transparent,
                                    textColor: cubit.currentTab == i ? ColorManager.white : ColorManager.lightGrey,
                                    fontSize: FontSize.s16,
                                  ),
                                ),
                            ],
                          ),
                        
                      const SizedBox(height: AppSize.s20,),
          
                      // posts 
                      if(cubit.currentTab == 2)
                      state is GetPostsLoadingState ? const Center(child: CircularProgressIndicator(),) :
                      cubit.posts.isEmpty ? const NoDataState() : ListView.separated(
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) {
                          return TextPostItem(post: cubit.posts[index],);
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(height: AppSize.s10,);
                        },
                        itemCount: cubit.posts.length,
                      ),
                      
                      
                      if(cubit.currentTab == 1)

                      cubit.assignments.isEmpty ? const NoDataState() : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      showCustomBottomSheet(
                                          context: context,
                                          bottomSheet:
                                             TaskSubmissionBottomSheet(assignment: cubit.assignments[index],));
                                    },
                                    child: CalenderListItem( 
                                      assignment: cubit.assignments[index],
                                    ));
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: AppSize.s10),
                              itemCount: cubit.assignments.length,
                            ),

                      if(cubit.currentTab == 0)
                                            state is GetPostsLoadingState ? const Center(child: CircularProgressIndicator(),) :
                      cubit.posts.isEmpty ? const NoDataState() : ListView.separated(
                        shrinkWrap: true, 
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index) {
                          return TextPostItem(post: cubit.warnings[index],);
                        },
                        separatorBuilder: (context,index) {
                          return const SizedBox(height: AppSize.s10,);
                        },
                        itemCount: cubit.warnings.length,
                      ),
                      

                    ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
    },
       ),
    );  
    }
}
