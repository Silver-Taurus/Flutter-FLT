import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int score;
  final String archive;
  final Function resetHandler;

  Result({this.score, this.archive, this.resetHandler});

  String get resultPhrase {
    return 'You are of the archive "${archive}" having a score of ${score}.';
  }

  @override
  Widget build(BuildContext context) { 
    return Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Text(
            'Reset the Quiz!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              )
            ),
          onPressed: resetHandler,
        )
      ],
    );
  }
}