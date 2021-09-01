import 'package:flutter/material.dart';

class PrintButton extends StatefulWidget {
  const PrintButton({
    Key key,
    this.listTime,
    this.listType,
    this.listTitle,
  }) : super(key: key);

  final List<String> listTitle;
  final List<String> listType;
  final List<String> listTime;

  @override
  _PrintButtonState createState() => _PrintButtonState();
}

class _PrintButtonState extends State<PrintButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Print Kegiatan ke PDF',
      elevation: 0,
      backgroundColor: Colors.grey[100],
      mini: true,
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Print Data Kegiatan',
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      child: Icon(
        Icons.print_outlined,
        color: Colors.grey[800],
      ),
    );
  }
}
