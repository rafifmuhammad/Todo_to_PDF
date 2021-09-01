import 'package:d_my_task/pages/main_page.dart';
import 'package:d_my_task/widgets/input_field.dart';
import 'package:d_my_task/widgets/my_input.dart';
import 'package:flutter/material.dart';

class InputTask extends StatelessWidget {
  double containerMargin(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.3;

  List<String> listTitle;
  List<String> listType;
  List<String> listTime;
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  InputTask({this.listTitle, this.listType, this.listTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add your task',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Easy to schedule &\nCreating PDF',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'images/event.png',
                              height: 180,
                              width: 170,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: containerMargin(context)),
              padding: const EdgeInsets.all(30),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: InputField(listTitle: listTitle, titleController: titleController, listType: listType, typeController: typeController, listTime: listTime, timeController: timeController),
            ),
          ],
        ),
      ),
    );
  }
}