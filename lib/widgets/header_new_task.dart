import 'package:flutter/material.dart';

class HeaderNewTask extends StatelessWidget {
  const HeaderNewTask({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://www.seekpng.com/png/detail/252-2521178_open-man-with-laptop-vector-png.png',
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Guest',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.attachment,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '01.00',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}