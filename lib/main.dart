import 'package:flutter/material.dart';
// import './question.dart';
// import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite programming language?',
      'answers': [
        {'text': 'Python', 'score': 10},
        {'text': 'Java', 'score': 8},
        {'text': 'C', 'score': 5},
        {'text': 'C++', 'score': 3}
      ],
    },
    {
      'questionText': 'what\'s your favorite data Structure?',
      'answers': [
        {'text': 'Stack', 'score': 8},
        {'text': 'Linkedlist', 'score': 9},
        {'text': 'Queue', 'score': 6}
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 2},
        {'text': 'Tiger', 'score': 4},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite place?',
      'answers': [
        {'text': 'London', 'score': 7},
        {'text': 'India', 'score': 10},
        {'text': 'Tokyo', 'score': 9},
        {'text': 'Japan', 'score': 8}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
