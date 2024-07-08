import 'package:academia/domain/models/assignment.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../custom_text.dart';
import '../elements/horizontal_bar.dart';
import '../list_views_items/category_item.dart';
import '../list_views_items/task_component.dart';

class StartQuizBottomSheet extends StatelessWidget { 
    final Quiz quiz;
  const StartQuizBottomSheet({super.key,required this.quiz});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppPadding.p16),
          topRight: Radius.circular(AppPadding.p16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HorizontalBar(),
            const SizedBox(
              height: AppSize.s10,
            ),
           Expanded(
              flex: 10,
              child: TaskComponent(quiz: quiz!),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
               CategoryItem(
                  title: '${quiz.duration} ${AppStrings.minute.tr}',
                  color: ColorManager.lightOrange1,
                  textColor: ColorManager.textOrange,
                  fontSize: 12,
                ),
                const SizedBox(width: AppSize.s10,),
                 CategoryItem(
                  title: '${quiz.questions!.length} ${AppStrings.question}',
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
              quiz.description!,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.grey,
                fontSize: FontSize.s12,
              ),
            ),
            const SizedBox(
              height: AppSize.s16,
            ),
            SizedBox(
              width: double.infinity,
              height: AppSize.s50,
              child: ElevatedButton(
                onPressed: () { 
                  Get.back();
                  Navigator.pushNamed(context, Routes.takeQuizScreen, arguments: quiz);
                },
                child: CustomText(text: AppStrings.startTest, style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
