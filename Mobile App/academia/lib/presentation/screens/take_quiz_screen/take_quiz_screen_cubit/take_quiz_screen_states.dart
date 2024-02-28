abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizSuccess extends QuizState {}

class QuizError extends QuizState {}

class NextQuestionState extends QuizState {}

class PreviousQuestionState extends QuizState {}

class AnswerState extends QuizState {}