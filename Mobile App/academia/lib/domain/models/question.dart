class Question {
    final String id;
    final String quizId;
    final String question;
    final List<String> options;
    final String correctAnswer;
    final bool multipleAnswers;
    final List<String> correctAnswers;
    final int weight;

    Question({
        required this.id,
        required this.quizId,
        required this.question,
        required this.options,
        required this.correctAnswer,
        required this.multipleAnswers,
        required this.correctAnswers,
        required this.weight,
    });

    factory Question.fromJson(Map<String, dynamic> json) {
        return Question(
        id: json['_id'],
        quizId: json['quizId'],
        question: json['question'],
        options: List<String>.from(json['options']),
        correctAnswer: json['correctAnswer'],
        multipleAnswers: json['multipleAnswers'],
        correctAnswers: List<String>.from(json['correctAnswers']),
        weight: json['weight'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
        '_id': id,
        'quizId': quizId,
        'question': question,
        'options': options,
        'correctAnswer': correctAnswer,
        'multipleAnswers': multipleAnswers,
        'correctAnswers': correctAnswers,
        'weight': weight,
        };
    }
    }