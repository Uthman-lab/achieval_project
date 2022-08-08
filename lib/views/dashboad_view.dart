import 'package:achieval_project/views/add_project.dart';
import 'package:achieval_project/views/search_projects_view.dart';
import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:flutter/material.dart';

class MyDashBoad extends StatelessWidget {
  const MyDashBoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: ListView(
        // shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyElevatedButton(
                label: "Add Project",
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddView()));
                },
              ),
              MySpace(30.0),
              MyElevatedButton(
                label: "View Projects",
                onpressed: () {
                  print("object");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchView()));
                },
              ),
            ],
          ),
          MyGridView()
        ],
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: cards(10),
    );
  }

  List<Widget> cards(num) {
    return List.generate(
        num,
        (index) => Card(
              child: Text('title $index'),
            ));
  }
}
