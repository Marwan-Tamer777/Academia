import 'package:academia/app/constants.dart';
import 'package:academia/data/network/dio_helpers/dio_helpers.dart';
import 'package:academia/data/network/dio_helpers/end_points.dart';
import 'package:academia/domain/models/question.dart';
import 'package:academia/domain/models/quiz.dart';
import 'package:academia/presentation/resources/routes_manager.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/assignments_cubit/assignments_states.dart';
import 'package:academia/presentation/screens/bottom_nav_bar/bottom_nav_bar_screens/quiz/cubit/quiz_cubit/quiz_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<QuizState> {
  // constructor
  QuizCubit() : super(QuizInitial());


  // static method to get the instance of the cubit
  static QuizCubit of(context) => BlocProvider.of(context);

List<Quiz>? quizes; 
Quiz? currentQuiz; 
List<Question>? questions;

  Future<void> getQuizes() async {
    emit(GetQuizezLoadingState()); 
    try {
      await DioHelper.getData(url: EndPoint.quizzez, token: userToken).then((value) {
          if(value.statusCode == 200) {
            quizes = (value.data as List).map((e) => Quiz.fromJson(e)).toList(); 
            emit(GetQuizezSuccessState());
          } else { 
            print("Error" + value.statusMessage.toString());
            emit(GetQuizezErrorState(value.statusMessage.toString()));
          }
        
      }).catchError((error) { 
                    print("Error" + error.toString());
        emit(GetQuizezErrorState(error.toString()));
      }); 
    } catch (error) { 
                          print("Error" + error.toString());
        emit(GetQuizezErrorState(error.toString()));
    }
  }

  void initQuiz(BuildContext context, Quiz quiz) {
    currentQuiz = quiz; 
    if(quiz.numOfRetries! > 0) {
        // getQuestions(quiz.id!).then((value) {
        //   if(questions != null ) {
        //     Navigator.pushNamed(context, Routes.takeQuizScreen);
        //   }
        // });
    }
  } 
}