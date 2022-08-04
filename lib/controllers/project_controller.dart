import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProjectController extends ChangeNotifier {
  String? _title;
  String? _author;
  String? _supervisor;
  late DateTime _date = DateTime.now();
  File? _file;

  String get title => this._title!;
  String get author => this._author!;
  String get supervisor => this._supervisor!;
  DateTime get date => this._date;
  File get file => this._file!;

  set title(String newTitle) {
    _title = newTitle;
  }

  set author(newAuthor) {
    _author = newAuthor;
  }

  set supervisor(newSupervisor) {
    _supervisor = newSupervisor;
  }

  set date(newDate) {
    _date = newDate;
  }

  set file(newFile) {
    _file = newFile;
  }
}
