import 'quiz_brain.dart';

class QuestionBank {
  int questionNumber = 0;
  List questionBank = [
    QuizBrain("The first computer mouse was invented in the 1960s by Douglas Engelbart.", true),
    QuizBrain("HTML stands for Hyperlinks and Text Markup Language.", false),
    QuizBrain("Apple's first computer, the Apple I, was released in 1976.", true),
    QuizBrain("JavaScript is a compiled programming language.", false),
    QuizBrain("The first version of Microsoft Windows was released in 1985.", true),
    QuizBrain("The first smartphone with a touchscreen was the iPhone.", true),
    QuizBrain("The abbreviation PDF stands for Personal Document Format.", false),
    QuizBrain("The first search engine on the internet was called Archie.", true),
    QuizBrain("The popular coding website GitHub was founded in 2007.", true),
    QuizBrain("The first email was sent in 1971 by Ray Tomlinson.", true),
  ];

  String getQuestion() {
    return questionBank[questionNumber].questionText;
  }

  bool getAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (questionNumber < questionBank.length - 1) {
      questionNumber++;
    }
  }

  bool isFinished() {
    if (questionNumber == questionBank.length - 1) {
      print('No more questions');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    questionNumber = 0;
  }
}
