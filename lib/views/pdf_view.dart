import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
                child: Text("show pdf"),
                onPressed: () async {
                  File? file = await filePicker();
                  // print(file);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => View(file: file!)));
                  print(file);
                })));
  }
}

class View extends StatefulWidget {
  final File? file;
  const View({Key? key, required this.file}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  PdfViewerController? controller;
  TapDownDetails? _doubleTapDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "${widget.file!.path.split('/').last}",
          style: TextStyle(fontSize: 10),
        )),
        body: Center(
          child: PdfViewer.openFile(
            widget.file!.path,
            viewerController: controller,
            params: PdfViewerParams(
              padding: 10,
            ),
          ),
        ));
  }
}
