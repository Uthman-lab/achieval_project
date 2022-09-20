import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../models/project_work_model.dart';

class FirebaseProvider extends ChangeNotifier {
  Stream<List<Map<String, dynamic>>> readProjects() {
    print("hello___");
    var projects = FirebaseFirestore.instance
        .collection("project")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    return projects;
  }

  Future<List<Map<String, dynamic>>> searchByField({genre, searchText}) async {
    List<Map<String, dynamic>> returnList = [];

    try {
      var projects = await FirebaseFirestore.instance
          .collection("project")
          .where(genre, arrayContains: searchText)
          .snapshots()
          .first;

      List<Map<String, dynamic>> a =
          projects.docs.map((e) => e.data()).toList();
      return a;
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future uploadFile(File file, authorUpload) async {
    String destination = "files/${file.path.split("/").last}_$authorUpload";
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      await ref.putFile(file);
    } catch (e) {
      print(e);
    }

    return destination;
  }

  Future getDownloadLink(path) async {
    final link = await FirebaseStorage.instance.ref(path).getDownloadURL();
    return link;
  }

  Future getPathProvider() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return appDocDir.path;
  }

  Future httpFile(String link) async {
    final path = await getPathProvider();
    File f = File("$path/file");

    var a = await http.get(Uri.parse(link));

    if (a.statusCode == 200) {
      f.writeAsBytes(a.bodyBytes);

      return f;
    }
    return "no info";
  }

  void addToFirebase(Project project) async {
    await FirebaseFirestore.instance
        .collection("project")
        .doc()
        .set(project.toJson());
  }

  void addTitleToTitleCollection(title) async {
    await FirebaseFirestore.instance
        .collection("titles")
        .doc()
        .set({"title": title});
  }

  Future<List<Map<String, dynamic>>> getAllTitles() async {
    //  Map<String, dynamic> list = [];
    Stream<List<Map<String, dynamic>>> stream = await FirebaseFirestore.instance
        .collection("titles")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    // stream.first;
    return stream.first;
  }
}
