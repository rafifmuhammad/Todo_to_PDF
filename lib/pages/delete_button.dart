import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.delete,
            color: Colors.red,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
