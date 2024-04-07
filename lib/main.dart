import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank q = QuestionBank();

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("CBS"),
        ),
        backgroundColor: Colors.black,
        body: const Quiz(),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (q.isFinished() == true) {
        Alert(
          context: context,
          title: "Hurray",
          desc: "Congratulation! You have finished this quiz app",
        ).show();
        scoreKeeper.clear();
        q.reset();
      } else {
        bool correctAnswer = q.getAnswer();
        if (correctAnswer == userPickedAnswer) {
          print('User got it right');
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        } else {
          print('User got it wrong');
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        }
        q.isFinished();
        q.nextQuestion();
      }
    });
  }

  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Question text
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  q.getQuestion(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            //True button
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  'TRUE',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            )),
            //False button
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'FALSE',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )),
            //Answer status shower at the bottom (write or wrong)
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}
