import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  final List questions;
  final Function selectHandler;
  final int questionIndex;

  Quiz({
    @required this.questions, 
    @required this.selectHandler, 
    @required this.questionIndex}
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
          ),
           ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(
            text: answer['text'], 
            selectHandler: () => selectHandler({
              (questionIndex == 0 ? 'score' : 'res'): answer[questionIndex == 0 ? 'score' : 'res'],
              (questionIndex == 0 ? 'res' : 'score'): null,
              }),
            );
          }).toList()
        ],
      );
  }
}