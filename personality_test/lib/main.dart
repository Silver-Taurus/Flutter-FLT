import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Red', 'score': 1}, 
        {'text': 'Blue', 'score': 2}, 
        {'text': 'Green', 'score': 3}, 
        {'text': 'Yellow', 'score': 4}, 
        {'text': 'Purple', 'score': 5},
        {'text': 'White', 'score': 6},
        {'text': 'Black', 'score': 7},
        {'text': 'Silver', 'score':8}
      ],
    },
    {
      'questionText': 'What\'s your favorite beast symbol?',
       'answers': [
          {'text': 'Dragon', 'res': 'Ira - Sin of Wrath'},
          {'text': 'Serpent', 'res': 'Invidia - Sin of Envy'},
          {'text': 'Fox', 'res': 'Avaritia - Sin of Greed'},
          {'text': 'Grizzly', 'res': 'Acedia - Sin of Sloth'},
          {'text': 'Goat', 'res': 'Luxuria - Sin of Lust'},
          {'text': 'Boar', 'res': 'Gula - Sin of Gluttony'},
          {'text': 'Lion', 'res': 'Superbia - Sin of Pride'},
        ], 
    },
  ];

  int _score = null;
  String _archive = null;

  void _answerQuestion(var input) {

    _score = input['score'] ?? _score;
    _archive = input['res'] ?? _archive;

    setState(() {_questionIndex += 1;});
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0; 
      _score = null;
      _archive = null;
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Personality Check', 
            style: TextStyle(fontSize: 28,)
          ),
        ),
        body: _questionIndex < _questions.length 
          ? Quiz(
            questions: _questions, 
            selectHandler: _answerQuestion, 
            questionIndex: _questionIndex
            )
          : Result(
              score: _score, 
              archive: _archive,
              resetHandler: _resetQuiz,
            ),
        ),  
      );
  }
}
