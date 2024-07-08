import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/assets_manager.dart';
import 'package:academia/presentation/resources/font_manager.dart';
import 'package:academia/presentation/resources/strings_manager.dart';
import 'package:academia/presentation/resources/style_manager.dart';
import 'package:academia/presentation/resources/values_manager.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import 'package:academia/presentation/widgets/backgrounds/background.dart';
import 'package:academia/presentation/widgets/elements/finish_quiz_dialog.dart';
import 'package:academia/presentation/widgets/list_views_items/Question_number.dart';
import 'package:academia/presentation/widgets/list_views_items/question_list_item.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../resources/color_manager.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/elements/notification_icon.dart';


class TakeQuizScreen extends StatelessWidget { 
  final Quiz quiz; 
  const TakeQuizScreen({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TakeQuizCubit>(
      create: (BuildContext context) => TakeQuizCubit()..setQuiz(quiz),
      child: BlocConsumer<TakeQuizCubit, CurrentQuizState>(
        listener: (BuildContext context, state) { 
          if(state is SubmitQuizSuccessState) {
            Get.back(); 
            showDialog(
            context: context,
            builder: (context) => const FinishQuizDialog(),
          );
          }
        },
        builder: (BuildContext context, state) { 
          var cubit = TakeQuizCubit.of(context);
            return SafeArea(
            child: Scaffold(
              body: state is GetQuestionsLoadingState ? Center(child: CircularProgressIndicator()) : 
                    state is GetQuestionsErrorState ? CustomText(text: "Error", style: getBoldTextStyle(fontSize: 12)) : 
                    Stack(
                children: [
                  const Background(
                    height: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const NotificationIcon(),
                            // TODO: Add tr
                            CustomText(text: "${AppStrings.test.tr} 1",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontSize: FontSize.s15,
                                        color: ColorManager.white)),
                            SvgPicture.asset(ImageAssets.arrowBackIcon,
                                color: ColorManager.white),
                          ],
                        ),
                        const SizedBox(height: 24),


                        SizedBox(
                          height: 80,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return QuestionNumber(questionNumber: index);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 5),
                            itemCount: cubit.numberOfQuestions,
                          ),
                        ),
                        const SizedBox(height: 24),
                        QuestionListItem(question: cubit.questions![cubit.currentQuestion],)
                        ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
