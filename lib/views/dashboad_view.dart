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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextButton(
              label: "Add Project",
            ),
            MySpace(30.0),
            MyTextButton(
              label: "View Projects",
              onpressed: () {
                print("object");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchView()));
              },
            )
          ],
        ),
      ),
    );
  }
}
