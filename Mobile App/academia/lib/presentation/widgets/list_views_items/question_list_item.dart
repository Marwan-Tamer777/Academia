import 'package:academia/presentation/resources/color_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/widgets/list_views_items/question_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';

class QuestionListItem extends StatelessWidget {
  const QuestionListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = QuizCubit.of(context);
        return Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p20
            ),
            decoration: BoxDecoration(
              color: ColorManager.white,
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
                Text(
                  "السؤال السابع عشر",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: ColorManager.textOrange,
                    fontSize: FontSize.s17,
                  ),
                ),
                const SizedBox(height: AppSize.s10),
                Text(
                  "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت, ,كونسيكتيتور أدايبا يسكينج أليايت ....",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSize.s8),
                Text(
                  "ملاحظة : يمكنك اختيار أكثر من إجابة على هذا السؤال",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: FontSize.s9,
                  ),
                ),
                const SizedBox(height: AppSize.s17),
                ListView.separated(
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          cubit.answer(index+1);
                        },
                        child: QuestionOption(
                          questionNumber: index + 1,
                        ));
                  },
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        cubit.previous();
                      },
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s118,
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p5),
                        decoration: BoxDecoration(
                          color: ColorManager.bottomSheetBackground,
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
                            Text(
                              "السابق",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        cubit.next();
                      },
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s118,
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20, vertical: AppPadding.p5),
                        decoration: BoxDecoration(
                          color: ColorManager.darkBlueBackground,
                          borderRadius: BorderRadius.circular(AppSize.s35),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "التالي",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
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
