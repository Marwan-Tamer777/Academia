import 'package:academia/app/dep_injection.dart';
import 'package:academia/domain/models/assignment.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_cubit.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_states.dart';
import 'package:academia/presentation/widgets/elements/horizontal_bar.dart';
import 'package:academia/presentation/widgets/list_views_items/task_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';
import '../elements/finish_quiz_dialog.dart';
import '../list_views_items/category_item.dart';
import '../list_views_items/task-submission_list_item.dart';

class TaskSubmissionBottomSheet extends StatelessWidget { 
  final Assignment assignment;
  const TaskSubmissionBottomSheet({super.key, required this.assignment});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssignmentsCubit>.value (
      value: getItInstance<AssignmentsCubit>(),
      child: BlocConsumer<AssignmentsCubit,AssignmentsStates> (
          listener: (context, state) {},
          builder: (context, state) {
            var assignmentsCubit = AssignmentsCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const HorizontalBar(),
                  const SizedBox(
                    height: AppSize.s30,
                  ),
                  TaskComponent(assignment: assignment,),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(text:
                      AppStrings.files,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: FontSize.s16,
                            height: AppSize.s2,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  InkWell(
                    onTap: () {
                      assignmentsCubit.pickAndUploadFile();
                    },
                    child: Container(
                      height: AppSize.s150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImageAssets.drobFile),
                            const SizedBox(height: AppSize.s10),
                            CustomText(text:
                              AppStrings.uploadFilesNow,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: FontSize.s14,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  const Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      CategoryItem(
                        title: '10 MB<',
                        color: ColorManager.transparent,
                        textColor: ColorManager.textOrange,
                        fontSize: FontSize.s12,
                      ),
                      SizedBox(
                        width: AppSize.s5,
                      ),
                      CategoryItem(
                        title: 'TXT',
                        color: ColorManager.lightOrange1,
                        textColor: ColorManager.textOrange,
                        fontSize: FontSize.s12,
                      ),
                      SizedBox(
                        width: AppSize.s5,
                      ),
                      CategoryItem(
                        title: 'DOCX',
                        color: ColorManager.lightOrange1,
                        textColor: ColorManager.textOrange,
                        fontSize: FontSize.s12,
                      ),
                      SizedBox(
                        width: AppSize.s5,
                      ),
                      CategoryItem(
                        title: 'PDF',
                        color: ColorManager.lightOrange1,
                        textColor: ColorManager.textOrange,
                        fontSize: FontSize.s12,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                
                  if(state is FileUploadProgressState)
                   TaskSubmissionListItem(progress: state.progress),
                
                  if(state is FileUploadSuccessState)
                    TaskSubmissionListItem(progress: 1,),
                
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  SizedBox(
                    height: AppSize.s60,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if(state is FileUploadSuccessState) {
                          Get.back();
                          showDialog(
                            context: context,
                            builder: (context) => const FinishQuizDialog(),
                          );
                        } 
                        assignmentsCubit.changeStateToInitial();
                          
                      },
                      child: CustomText(text:
                        'تبقى 4  محاولات',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                              fontSize: FontSize.s16,
                              color: ColorManager.white,
                            ),
                      ),
                    ),
                  ),
                  // todo: students circle avatars
                ],
              ),
            );
          },
        ),
    );
  }
}

void showCustomBottomSheet(
    {required Widget bottomSheet, required BuildContext context}) {
  showModalBottomSheet<dynamic>( 
        useSafeArea: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      side: BorderSide(
        color: Colors.transparent,
      ),
    ),
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (context) => bottomSheet,
  );
}
