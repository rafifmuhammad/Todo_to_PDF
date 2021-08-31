import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
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
                fontSize: 20,
              ),
            ),
          ],
        ),
        FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          mini: true,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Belum Ada Notifikasi',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}