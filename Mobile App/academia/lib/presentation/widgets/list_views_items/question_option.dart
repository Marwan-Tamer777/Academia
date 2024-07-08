import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import '../custom_text.dart';

class QuestionOption extends StatelessWidget {
  final int questionNumber; 
  final String option;
  const QuestionOption({super.key, required this.questionNumber, required this.option});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakeQuizCubit, CurrentQuizState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = TakeQuizCubit.of(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: cubit.getQuestionColor(context, questionNumber),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded( 
                flex: 4,
                child: CustomText(text: 
                  option,
                  lines: 5,
                  // overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: cubit.getQuestionTextColor(context, questionNumber),
                  )
                ),
              ),
              const SizedBox(width: 8),
              Expanded( 
                flex: 1,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: cubit.getQuestionColor(context, questionNumber),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: cubit.getQuestionTextColor(context, questionNumber),
                          width: 1,
                      ),
                  ),
                  child: Center(
                    child: CustomText(text: 
                      questionNumber.toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: cubit.getQuestionTextColor(context, questionNumber),
                          ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
      },
    );
  }
}
