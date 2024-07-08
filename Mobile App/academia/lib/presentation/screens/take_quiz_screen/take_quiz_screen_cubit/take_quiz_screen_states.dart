abstract class CurrentQuizState {}

class QuizInitial extends CurrentQuizState {}

class QuizLoading extends CurrentQuizState {}

class QuizSuccess extends CurrentQuizState {}

class QuizError extends CurrentQuizState {}

class NextQuestionState extends CurrentQuizState {}

class PreviousQuestionState extends CurrentQuizState {}

class AnswerState extends CurrentQuizState {} 



class InitQuizState extends CurrentQuizState {}

class FailInitQuizState extends CurrentQuizState {}


class GetQuestionsLoadingState extends CurrentQuizState {}

class GetQuestionsSuccessState extends CurrentQuizState {} 

class GetQuestionsErrorState extends CurrentQuizState { 
  String error; 
  GetQuestionsErrorState(this.error);
} 

class SubmitQuizLoadingState extends CurrentQuizState {}

class SubmitQuizSuccessState extends CurrentQuizState {}

class SubmitQuizErrorState extends CurrentQuizState { 
  String error; 
  SubmitQuizErrorState(this.error);
}
