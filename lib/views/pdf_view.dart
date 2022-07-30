import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PdfView extends StatelessWidget {
  const PdfView({Key? key}) : super(key: key);

  Future<File?> filePicker() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {}

    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          File? _final = await filePicker();
          print(_final!.path);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => View(file: _final)));
        },
        child: Text('choose'),
      )),
    );
  }
}

class View extends StatefulWidget {
  final File file;
  const View({Key? key, required this.file}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  //  final Completer<PDFViewController> _controller =  Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PDFView(
        filePath: widget.file.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onRender: (_pages) {
          setState(() {
            pages = _pages;
            isReady = true;
          });
        },
        onError: (error) {
          print(error.toString());
        },
        onPageError: (page, error) {
          print('$page: ${error.toString()}');
        },
        onViewCreated: (PDFViewController pdfViewController) {
          // _controller.complete(pdfViewController);
        },
      ),
    );
  }
}
