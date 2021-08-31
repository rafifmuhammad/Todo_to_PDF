import 'package:d_my_task/widgets/header_new_task.dart';
import 'package:flutter/material.dart';

class DescNewTask extends StatelessWidget {
  const DescNewTask({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderNewTask(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Creates a new resources and inserts it into a collection.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'POST on a collecttion URI, where you pass in data for a new resource.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
