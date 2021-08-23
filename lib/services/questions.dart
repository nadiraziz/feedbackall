import 'package:firebase_auth/firebase_auth.dart';

class Question {
  String questionText;

  Question({required this.questionText});
}



class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(questionText: 'How was the Hotel?'),
    Question(questionText: 'How was the car?'),
    Question(questionText: 'How was the room?'),
    Question(questionText: 'How was the kitchen?'),
    Question(questionText: 'How was the toilet?'),
  ];



  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }



  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

}

// sign out
