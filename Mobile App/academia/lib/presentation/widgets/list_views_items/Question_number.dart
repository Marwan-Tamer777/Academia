import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/font_manager.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_cubit.dart';
import '../../screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';

class QuestionNumber extends StatelessWidget {
  final int questionNumber;
  const QuestionNumber({super.key, required this.questionNumber});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = QuizCubit.of(context);
        return Container(
          height: 70,
          width: 50,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: cubit.getColor(questionNumber),
            borderRadius: BorderRadius.circular(150),
            border: Border.all(color: cubit.getBorderColor(questionNumber), width: 2),
          ),
          child: Center(
            child: Text(
              "$questionNumber",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: FontSize.s20,
                color: ColorManager.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
