import 'dart:async';
import 'dart:io';

import 'package:achieval_project/controllers/firebase_controller.dart';
import 'package:achieval_project/views/pdf_view.dart';
import 'package:achieval_project/widgets/search_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/project_controller.dart';
import '../models/project_work_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    String a = File("").toString();

    List<Map> source = [];
    TextEditingController searchController = TextEditingController();
    var projectController = Provider.of<ProjectController>(context);
    var firebaseObj = Provider.of<FirebaseProvider>(context);
    // projectController.docs = [];
    return Scaffold(
      appBar: AppBar(title: Text("Search For Projects ")),
      body: Container(
        child: Column(
          children: [
            MySearchBox(
              controller: searchController,
              label: 'search for project',
              suffix: GestureDetector(
                child: Icon(Icons.search),
                onTap: () async {
                  Stream<List<Map>> a = firebaseObj.readProjects();
                  a.listen((event) {
                    projectController.searchList = event
                      ..retainWhere((element) =>
                          element.containsValue(searchController.text));
                    print(projectController.searchList);

                    // print(projectController.searchList);
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: cards(projectController.searchList, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> cards(List<Map> source, context) {
  var firebaseObj = Provider.of<FirebaseProvider>(context);
  return List.generate(
    source.length,
    (index) {
      Timestamp timestamp = source[index]['date'];
      DateTime date = timestamp.toDate();
      String formatedDate = "${date.day}, ${date.month}, ${date.year}";

      return GestureDetector(
          child: Card(
            child: ListTile(
              title: Text(" ${source[index]['title']}  "),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Author  :${source[index]['author']}"),
                    Text("Date created :$formatedDate"),
                    Text("Supervisor : ${source[index]['supervisor']}"),
                  ]),
              leading: CircleAvatar(),
              trailing: GestureDetector(child: OpenPdfButton()),
            ),
          ),
          onTap: () async {
            File f = File("helo");
            var link =
                await firebaseObj.getDownloadLink(source[index]['filePath']);
            var res = await firebaseObj.httpFile(link);
            print("$res in response");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => View(
                          file: res,
                        )));
          });
    },
  );
}

class OpenPdfButton extends StatefulWidget {
  const OpenPdfButton({Key? key}) : super(key: key);

  @override
  State<OpenPdfButton> createState() => _OpenPdfButtonState();
}

class _OpenPdfButtonState extends State<OpenPdfButton> {
  bool isIcon = false;
  void setIcon() {
    Timer.periodic(Duration(seconds: 100), (timer) {
      setState(() {
        isIcon = !isIcon;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setIcon();
    return isIcon
        ? Container(
            child: Text(
            "open Pdf",
            softWrap: true,
          ))
        : Container(
            color: Colors.blue[500],
            child: Text(
              "open Pdf",
              softWrap: true,
            ));
  }
}
