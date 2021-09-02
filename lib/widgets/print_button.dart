import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';

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
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        tooltip: 'Print Kegiatan ke PDF',
        onPressed: _createPDF,
        icon: Icon(
          Icons.print_outlined,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();

    grid.style.font = PdfStandardFont(PdfFontFamily.timesRoman, 14,
        style: PdfFontStyle.regular);

    grid.columns.add(count: 3);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.style.font = PdfStandardFont(
      PdfFontFamily.timesRoman,
      14,
      style: PdfFontStyle.bold,
    );
    header.cells[0].stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle);
    header.cells[0].value = 'Time';
    header.cells[1].stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle);
    header.cells[1].value = 'Type Task';
    header.cells[2].stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle);
    header.cells[2].value = 'Title Task';

    PdfGridRow row;
    for (int i = 0; i < widget.listTitle.length; i++) {
      row = grid.rows.add();
      row.cells[0].stringFormat = PdfStringFormat(
        alignment: PdfTextAlignment.center,
        lineAlignment: PdfVerticalAlignment.middle,
      );
      row.cells[0].value = widget.listTime[i];
      row.cells[1].value = widget.listType[i];
      row.cells[2].value = widget.listTitle[i];
    }

    grid.draw(
      page: document.pages.add(),
      bounds: Rect.fromLTWH(0, 0, 0, 0),
    );

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Kegiatan.pdf');
  }
}
