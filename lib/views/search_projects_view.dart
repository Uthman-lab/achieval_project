import 'dart:io';

import 'package:achieval_project/views/pdf_view.dart';
import 'package:achieval_project/widgets/search_box.dart';
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
                  Stream<List<Map>> a = projectController.readProjects();
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
  var projectController = Provider.of<ProjectController>(context);
  return List.generate(
    source.length,
    (index) => GestureDetector(
        child: Card(
          child: ListTile(
            title: Text(" ${source[index]['title']}  "),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${source[index]['author']}"),
              Text("date created :${source[index]['date']}"),
              Text("supervisor : ${source[index]['supervisor']}"),
              Text('filePath:  ${source[index]["filePath"]}')
            ]),
            leading: CircleAvatar(),
          ),
        ),
        onTap: () async {
          File f = File("helo");
          var link = await projectController
              .getDownloadLink(source[index]['filePath']);
          var res = await projectController.httpFile(link);
          print("$res in response");

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => View(
                        file: res,
                      )));
        }),
  );
}
