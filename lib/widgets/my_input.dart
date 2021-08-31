import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  MyInput({
    Key key,
    @required this.text,
    @required this.icon,
    this.actionText,
    this.controller
  });

  TextEditingController controller = TextEditingController();
  List<String> actionText;
  final String text;
  final IconData icon;

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
        ),
        hintText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
