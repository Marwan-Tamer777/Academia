import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';

class QuestionOption extends StatelessWidget {
  final int questionNumber;
  const QuestionOption({super.key, required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = QuizCubit.of(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: 50,
          decoration: BoxDecoration(
            color: cubit.getQuestionColor(context, questionNumber),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "لوريم ايبسوم دولار سيت أميت",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          cubit.getQuestionTextColor(context, questionNumber),
                    ),
              ),
              const SizedBox(width: 8),
              Container(
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
                  child: Text(
                    "A",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: cubit.getQuestionTextColor(
                              context, questionNumber),
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
