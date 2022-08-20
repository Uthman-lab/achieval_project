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
  final genre;
  const SearchView({Key? key, required this.genre}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    List title = widget.genre.toString().split("");
    String firstLetter = title.removeAt(0);
    firstLetter = firstLetter.toUpperCase();
    String remainingWord = title.reduce((value, element) => "$value$element");
    String displayTitle = firstLetter + remainingWord;
    List<Map<String, dynamic>> source = [];
    TextEditingController searchController = TextEditingController();
    var projectController = Provider.of<ProjectController>(context);
    var firebaseObj = Provider.of<FirebaseProvider>(context);
    //    projectController.docs = [];
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Search For Projects by $displayTitle",
        style: TextStyle(fontSize: 14),
      )),
      body: Container(
        child: Column(
          children: [
            MySearchBox(
              controller: searchController,
              label: 'search for project',
              suffix: GestureDetector(
                child: Icon(Icons.search),
                onTap: () async {
                  var a = await firebaseObj.searchByField(
                      genre: widget.genre, searchText: searchController.text);
                  setState(() {
                    projectController.searchList = a;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: cards(projectController.searchList, context),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> cards(List<Map<String, dynamic>> source, context) {
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
              trailing: GestureDetector(child: Text('')),
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
