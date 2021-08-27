
class Question {
  String questionText;

  Question({required this.questionText});
}



class QuizBrain {
  int _questionNumber = 0;

  // list of the project
  List<Question> _questionBank = [
    Question(questionText: 'How was the Hotel?'),
    Question(questionText: 'How was the car?'),
    Question(questionText: 'How was the room?'),
    Question(questionText: 'How was the kitchen?'),
    Question(questionText: 'How was the toilet?'),
  ];


// next question
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }


  // get question
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }


// is question is finished
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }


  // question to be reset
  void reset() {
    _questionNumber = 0;
  }

}

