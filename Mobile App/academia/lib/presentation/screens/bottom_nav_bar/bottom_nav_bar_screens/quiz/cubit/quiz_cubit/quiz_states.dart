abstract class QuizState {} 

class QuizInitial extends QuizState {} 

class GetQuizezLoadingState extends QuizState {} 

class GetQuizezSuccessState extends QuizState {} 

class GetQuizezErrorState extends QuizState { 
  String error; 
  GetQuizezErrorState(this.error);
} 

