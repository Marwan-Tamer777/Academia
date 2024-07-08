import 'package:academia/domain/models/question.dart';
import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/list_views_items/question_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import '../custom_text.dart';

class QuestionListItem extends StatelessWidget { 
  final Question question;
  const QuestionListItem({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakeQuizCubit, CurrentQuizState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = TakeQuizCubit.of(context);
        return Align(
          alignment: Alignment.center,
          child: Container(  
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p20),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(AppSize.s16),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(text: 
                  "السؤال السابع عشر",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: ColorManager.textOrange,
                        fontSize: FontSize.s17,
                      ),
                ),
                const SizedBox(height: AppSize.s10),
                CustomText(text: 
                  question.question!,
                  lines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                const SizedBox(height: AppSize.s8), 
                if(question.multipleAnswers!)
                  CustomText(text: 
                  "ملاحظة : يمكنك اختيار أكثر من إجابة على هذا السؤال",
                  lines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: FontSize.s9,
                      ),
                ),
                const SizedBox(height: AppSize.s17),

                ListView.separated( 
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return const SizedBox(
                      height: AppSize.s15,
                    );
                  },
                  itemCount: question.options!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          cubit.answerQuestion(index);
                        },
                        child: QuestionOption(
                          questionNumber: index, 
                          option: question.options![index],
                        ));
                  },
                ),
                const SizedBox(height: AppSize.s20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    cubit.currentQuestion != 0 ? 
                    InkWell(
                      onTap: () {
                        cubit.previous();
                      },
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s118,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p20,
                            vertical: AppPadding.p5),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .extension<CustomThemeExtension>()!
                              .pollColor,
                          borderRadius: BorderRadius.circular(AppSize.s35),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.arrowLeft,
                              height: AppSize.s24,
                              width: AppPadding.p24,
                            ),
                            const SizedBox(width: AppSize.s8),
                            CustomText(text: 
                              AppStrings.previous,
                              style: Theme.of(context).textTheme.titleMedium!,
                            ),
                          ],
                        ),
                      ),
                    )
                    : Spacer(),

                    InkWell(
                      onTap: () {
                        cubit.next();
                      },
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s118,
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p20,
                            vertical: AppPadding.p5),
                        decoration: BoxDecoration(
                          color: ColorManager.darkBlueBackground,
                          borderRadius: BorderRadius.circular(AppSize.s35),
                        ),
                        child: Row(
                          children: [
                            CustomText(text: 
                            cubit.currentQuestion != cubit.questions!.length -1 ?
                              AppStrings.next : AppStrings.submit,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: ColorManager.white,
                                  ),
                            ),
                            const SizedBox(width: AppSize.s8),
                            SvgPicture.asset(
                              ImageAssets.arrowBackIcon,
                              height: AppSize.s24,
                              width: AppPadding.p24,
                              color: ColorManager.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
