import 'package:achieval_project/widgets/search_box.dart';
import 'package:flutter/material.dart';

import '../models/project_work_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search For Projects ")),
      body: Container(
        child: Column(
          children: [
            MySearchBox(
              label: 'search for project',
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: cards(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> cards() {
  var source = Projects.projects;
  return List.generate(
      source.length,
      (index) => Card(
            child: ListTile(
              title: Text(" ${source[index].title}  "),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${source[index].author}"),
                    Text("date created :${source[index].date}"),
                    Text("supervisor : ${source[index].supervisor}"),
                  ]),
              leading: CircleAvatar(),
            ),
          ));
}
