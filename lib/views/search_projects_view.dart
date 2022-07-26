import 'package:achieval_project/widgets/search_box.dart';
import 'package:flutter/material.dart';

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
                children: cards(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> cards(length) {
  return List.generate(
      length,
      (index) => Card(
            child: ListTile(
              title: Text("project ${index} title "),
              leading: CircleAvatar(),
            ),
          ));
}
