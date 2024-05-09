import 'package:bookreader/view/pdfview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home_page(),debugShowCheckedModeBanner: false,
  ));
}

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {

  var Pdf=["assets/documents/one.pdf","assets/documents/two.pdf","assets/documents/three.pdf","assets/documents/four.pdf","assets/documents/file-example.pdf"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.blue,
        title: Text("BOOK READER"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PdfView(
                      pdf : Pdf[index]
                    )));
              },
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  child: Image.asset("assets/images/pdf3.png",height:100,width: 100,),
                ),
              ),
            );
          }),
    );
  }
 }


