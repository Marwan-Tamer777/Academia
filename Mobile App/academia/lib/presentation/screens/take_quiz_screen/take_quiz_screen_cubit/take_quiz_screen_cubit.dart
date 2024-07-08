import 'dart:ui';

import 'package:academia/app/constants.dart';
import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/domain/models/main_schema.dart';
import 'package:academia/domain/models/question.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:academia/presentation/screens/take_quiz_screen/take_quiz_screen_cubit/take_quiz_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/color_manager.dart';

class TakeQuizCubit extends Cubit<CurrentQuizState> {
  TakeQuizCubit() : super(QuizInitial());

  static TakeQuizCubit of(context) => BlocProvider.of<TakeQuizCubit>(context); 

  Quiz? quiz;  
  List<Question>? questions;

  int numberOfQuestions = 0;
  int currentQuestion = 0;

  int currentAnswer = -1;

  void setQuiz(Quiz quiz) async {
    this.quiz = quiz; 
    await getQuestions(quiz.id!).then((value) {
        if(questions != null) {
              numberOfQuestions = questions!.length; 
              print(questions!.length);
        emit(InitQuizState()); 
        } 
        else {
        emit(FailInitQuizState()); 
        }
    });

  }

Map<int,int> questionAswers = {};


  void next() {  
  if(currentQuestion < questions!.length -1) {
      currentQuestion++; 
      currentAnswer = -1;
  } else if(currentQuestion == questions!.length -1) { 
    //submitQuiz(); 
    emit(SubmitQuizSuccessState());
  }


      if(questionAswers.containsKey(currentQuestion)) {
        currentAnswer = questionAswers[currentQuestion]!;
      } else {
        currentAnswer = -1;
      }
      
  List<String> answers = questionAswers.entries.map((e) => questions![e.key].options![e.value]).toList();
  print("ANSWERS:"); 
  print(answers);
          emit(NextQuestionState());
       }

  void previous() {
      if(currentQuestion  > 0) {
        currentQuestion--;
      } 
      if(questionAswers.containsKey(currentQuestion)) {
        currentAnswer = questionAswers[currentQuestion]!;
      } else {
        currentAnswer = -1;
      }
    emit(PreviousQuestionState());
  }

  Color getColor(int questionNumber) {
    if (questionNumber  < currentQuestion) {
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


  
  void answerQuestion(index) {
    currentAnswer = index; 
    print("option ${questions![currentQuestion].options![currentAnswer]}");
    print("Question Number ${currentQuestion}");

    questionAswers[currentQuestion] = currentAnswer;
    emit(AnswerState());
  }
  Color getQuestionColor(BuildContext context, int index) {
    // Check if this option is the selected answer
    if (index == currentAnswer) {
      return ColorManager.buttonColor; // Selected option color
    } else {
      return Theme.of(context).extension<CustomThemeExtension>()!.pollColor; // Default option color
    }
  }
  
  Color getQuestionTextColor(BuildContext context, int index) {
    if (index == currentAnswer) {
      return ColorManager.white; // Selected option text color
    } else {
      return Theme.of(context).textTheme.bodyMedium!.color!; // Default option text color
    }
  }


      Future<void> getQuestions(String quizId) async {
    emit(GetQuestionsLoadingState()); 
    try {
      await DioHelper.getData(url: EndPoint.questions, token: userToken,queryParameters: {'quizId': quizId}).then((value) {
          if(value.statusCode == 200) {
            questions = (value.data as List).map((e) => Question.fromJson(e)).toList(); 
            emit(GetQuestionsSuccessState());
          } else { 
            print("Error" + value.statusMessage.toString());
            emit(GetQuestionsErrorState(value.statusMessage.toString()));
          }
        
      }).catchError((error) { 
                    print("Error" + error.toString());
        emit(GetQuestionsErrorState(error.toString()));
      }); 
    } catch (error) { 
                          print("Error" + error.toString());
        emit(GetQuestionsErrorState(error.toString()));
    }
  } 



  void submitQuiz() async {
    emit(SubmitQuizLoadingState()); 
    Map<String, dynamic> data = submitQuizSchema(
      quizId: quiz!.id!,
      courseId: quiz!.courseId!,
      userId: userId!,
      answers: questionAswers.entries.map((e) => questions![e.key].options![e.value]).toList()
    );
    try {
      await DioHelper.postData(url: EndPoint.submitQuiz, token: userToken, data: data).then((value) {
        if(value.statusCode == 201) {
          emit(SubmitQuizSuccessState());
        } else {
          emit(SubmitQuizErrorState(value.statusMessage.toString()));
        }
      }).catchError((error) {
        emit(SubmitQuizErrorState(error.toString()));
      });
    } catch (error) {
      emit(SubmitQuizErrorState(error.toString()));
    }
  }

}
