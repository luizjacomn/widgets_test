import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  BlueButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.yellowAccent,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
    );
  }
}
