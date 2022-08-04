import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerClass {
  Future<File?> filePicker() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {}

    return file;
  }
}
