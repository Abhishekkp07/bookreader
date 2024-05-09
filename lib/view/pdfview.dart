import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatefulWidget {
  PdfView({super.key,this.pdf,});
  String? pdf;

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      title: Text("View"),
      backgroundColor: Colors.blue,),
    body: Container(
      child: SfPdfViewer.asset("${widget.pdf}"),
    ),);
  }
}
