import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/project_work_model.dart';

class ProjectController extends ChangeNotifier {
  String? _title;
  String? _author;
  String? _supervisor;
  late DateTime _date = DateTime.now();
  File? _file;
  List<Map> _docs = [];
  List<Map> _searchList = [];

  List<Map> get docs => _docs;
  List<Map> get searchList => _docs;
  set docs(List<Map> newDocs) {
    _docs = newDocs;
    notifyListeners();
  }

  set searchList(List<Map> newList) {
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

  Stream<List<Map<String, dynamic>>> readProjects() {
    var projects = FirebaseFirestore.instance
        .collection("project")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    return projects;
  }

  Future uploadFile(File file) async {
    String? link;
    try {
      final ref =
          FirebaseStorage.instance.ref("files/${file.path.split("/").last}");
      final storedFile = await ref.putFile(file);
    } catch (e) {
      print(e);
    }

    return link ?? "empty";
  }

  Future getFile() async {
    final fileName = file.path.split("/").last;
    final upFile =
        await FirebaseStorage.instance.ref("files/$fileName").getDownloadURL();
    print(upFile);
  }

  Future getMetaData() async {
    final fileName = file.path.split("/").last;
    final upFile =
        await FirebaseStorage.instance.ref("files/$fileName").getMetadata();
    print(upFile.name);
  }

  void addToFirebase(Project project) async {
    await FirebaseFirestore.instance.collection("project").doc().set({
      "title": project.title,
      "author": project.author,
      "supervisor": project.supervisor,
      "date": project.date
    });
  }
}
