import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8BC34A),
          title: Text('QuizAdda'),
        ),
        body: QuizApp(),
      ),
    ),
  );
}

QuizBrain quizBrain = QuizBrain();

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

List<Icon> scoreKepper = [];
int questionNumber = 0;

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  quizBrain.questionBank[questionNumber].questionText,
                  style: TextStyle(
                    color: Color(0xff212121),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(45.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
                onPressed: () {
                  bool corectAnswer =
                      quizBrain.questionBank[questionNumber].questionAnswer;
                  if (corectAnswer == true) {
                    print("User got it correct");
                  } else {
                    print("User got it wrong");
                  }
                  setState(() {
                    questionNumber++;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(45.0),
              child: FlatButton(
                height: 50,
                minWidth: 50,
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool corectAnswer =
                      quizBrain.questionBank[questionNumber].questionAnswer;
                  if (corectAnswer == false) {
                    print("User got it correct");
                  } else {
                    print("User got it wrong");
                  }
                  setState(() {
                    questionNumber++;
                  });
                  //The user picked false.
                },
              ),
            ),
          ),
          Row(
            children: scoreKepper,
          ),
        ],
      ),
    );
  }
}
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
