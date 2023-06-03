import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Quizzler(),
      ),
    ),
  );
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  QuizBrain quizBrain = QuizBrain();

  Widget addCheckMark() {
    return const Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Widget addCrossMark() {
    return const Icon(
      Icons.cancel_outlined,
      color: Colors.red,
    );
  }

  List<Widget> results = [];

  checkAnswer(bool userPickedAnswer) {
    setState(
      () {
        bool correctAnswer = quizBrain.getQuestionAnswer();
        if (userPickedAnswer == correctAnswer) {
          results.add(addCheckMark());
        } else {
          results.add(addCrossMark());
        }
        bool isFinished = quizBrain.isFinished();
        if (isFinished) {
          Alert(
            context: context,
            title: "You have finished the Quizz!",
            desc:
                "The quizz has been completed, Congratulations! Now you can try it again!",
            buttons: [
              DialogButton(
                  child: const Text("Try again!"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            style: const AlertStyle(alertAlignment: Alignment.bottomCenter),
          ).show();
          quizBrain.questionNumber = 0;
          results.clear();
        } else {
          quizBrain.questionNumber++;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(quizBrain.getQuestionText()),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text("True"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("False"),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: results,
            ),
          ),
        ],
      ),
    );
  }
}
