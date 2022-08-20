import 'dart:io';

import 'package:flutter/cupertino.dart';

class ProjectController extends ChangeNotifier {
  String? _title;
  String? _author;
  String? _supervisor;
  late DateTime _date = DateTime.now();
  File? _file;
  List<Map> _docs = [];
  List<Map<String, dynamic>>? _searchList;

  List<Map> get docs => _docs;
  List<Map<String, dynamic>> get searchList =>
      _searchList ?? List<Map<String, dynamic>>.filled(0, {});

  set docs(List<Map> newDocs) {
    _docs = newDocs;
    notifyListeners();
  }

  set searchList(List<Map<String, dynamic>> newList) {
    _searchList = newList;
    notifyListeners();
  }

  String get title => this._title!;
  String get author => this._author!;
  String get supervisor => this._supervisor!;
  DateTime get date => this._date;
  File get file => this._file!;

  set title(String newTitle) {
    _title = newTitle;
    notifyListeners();
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
