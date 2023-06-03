import 'package:quizzler/Questions.dart';

class QuizBrain {
  int questionNumber = 0;

  final List<Questions> _questionBank = [
    Questions(q: "The sky is always blue", a: false),
    Questions(q: "2 + 2 = 3", a: false),
    Questions(q: "Fish live in the sea", a: true),
    Questions(q: "You love this app", a: true),
    Questions(q: "Your name is George", a: false)
  ];

  String getQuestionText() {
    return _questionBank[questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
