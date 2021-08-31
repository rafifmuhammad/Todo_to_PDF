import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    this.text
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}