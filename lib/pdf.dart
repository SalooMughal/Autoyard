import 'package:flutter/material.dart';

class PDFScreen extends StatefulWidget {
  final String pdfUrl;

  PDFScreen({required this.pdfUrl});

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  bool _isLoading = true;
  // PDFDocument? document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  // Load the PDF from the URL
  loadDocument() async {
    // document = await PDFDocument.fromURL(widget.pdfUrl);
    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Purchase Receipt")),

    );
  }
}
