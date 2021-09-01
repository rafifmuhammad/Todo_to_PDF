import 'package:d_my_task/widgets/print_button.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.listTitle,
    this.listType,
    this.listTime,
  }) : super(key: key);

  final List<String> listTitle;
  final List<String> listType;
  final List<String> listTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
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
              'Welcome, Guest',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        PrintButton(
          listTime: listTime,
          listTitle: listTitle,
          listType: listType,
        ),
      ],
    );
  }
}
