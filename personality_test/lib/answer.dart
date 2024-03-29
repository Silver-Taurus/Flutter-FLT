import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String text;
  final Function selectHandler;

  Answer({
    this.text, 
    @required this.selectHandler}
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(
          text, 
          style: TextStyle(fontSize: 20)
          ),
        onPressed: selectHandler,
      )
    );
  }
}