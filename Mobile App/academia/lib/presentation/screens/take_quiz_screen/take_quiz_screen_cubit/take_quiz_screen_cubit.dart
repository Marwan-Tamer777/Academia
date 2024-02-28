import 'dart:ui';

import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/color_manager.dart';

class QuizCubit extends Cubit<QuizState> {

  QuizCubit() : super(QuizInitial());

  static QuizCubit of(context) => BlocProvider.of<QuizCubit>(context);

  int numberOfQuestions = 10;
  int currentQuestion = 1;

  int currentAnswer = 0;

  void next() {
    currentQuestion ++;
    emit(NextQuestionState());
  }

  void previous() {
    currentQuestion --;
    emit(PreviousQuestionState());
  }

  Color getColor(int questionNumber) {
    if (questionNumber < currentQuestion) {
      return ColorManager.textOrange;
    } else {
      return ColorManager.transparent;
    }
  }

  Color getBorderColor(int questionNumber) {
    if (questionNumber == currentQuestion) {
      return ColorManager.textOrange;
    } else if (questionNumber < currentQuestion) {
      return ColorManager.textOrange;
    } else {
      return ColorManager.darkGrey;
    }
  }

void answer(int answer) {
    currentAnswer = answer;
    emit(AnswerState());
  }

Color getQuestionColor(int questionNumber) {
    if (questionNumber == currentAnswer) {
      return ColorManager.darkBlueBackground;
    } else {
      return ColorManager.bottomSheetBackground;
    }
  }

Color getQuestionTextColor(int questionNumber) {
    if (questionNumber == currentAnswer) {
      return ColorManager.white;
    } else {
      return ColorManager.darkBlueBackground;
    }
  }

}
