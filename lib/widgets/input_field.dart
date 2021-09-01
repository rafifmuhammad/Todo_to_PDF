import 'package:d_my_task/pages/main_page.dart';
import 'package:d_my_task/widgets/my_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class InputField extends StatefulWidget {
  InputField({
    Key key,
    @required this.listTitle,
    @required this.titleController,
    @required this.listType,
    @required this.typeController,
    @required this.listTime,
    @required this.timeController,
  }) : super(key: key);

  List<String> listTitle;
  TextEditingController titleController;
  List<String> listType;
  TextEditingController typeController;
  List<String> listTime;
  TextEditingController timeController;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setStringList('title', widget.listTitle);
      pref.setStringList('type', widget.listType);
      pref.setStringList('time', widget.listTime);
    });
  }

  void loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      widget.listTitle = pref.getStringList('title') ?? [];
      widget.listType = pref.getStringList('type') ?? [];
      widget.listTime = pref.getStringList('time') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MyInput(
              icon: Icons.title,
              text: 'Title of task...',
              actionText: widget.listTitle,
              controller: widget.titleController),
          SizedBox(
            height: 10,
          ),
          MyInput(
            icon: Icons.description,
            text: 'Type of task...',
            actionText: widget.listType,
            controller: widget.typeController,
          ),
          SizedBox(
            height: 10,
          ),
          MyInput(
              icon: Icons.access_time,
              text: 'Time of task...',
              actionText: widget.listTime,
              controller: widget.timeController),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blueGrey,
            onPressed: () {
              widget.listTitle.add(widget.titleController.text);
              widget.listType.add(widget.typeController.text);
              widget.listTime.add(widget.timeController.text);
              saveData();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Data Ditambahkan',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.pop(
                context,
                MainPage(
                  titleTask: widget.listTitle,
                  typeTask: widget.listType,
                  time: widget.listTime,
                ),
              );
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
