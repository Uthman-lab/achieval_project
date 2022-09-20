import 'package:achieval_project/controllers/firebase_controller.dart';
import 'package:achieval_project/controllers/verification.dart';
import 'package:achieval_project/views/add_project.dart';
import 'package:achieval_project/views/search_projects_view.dart';
import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../widgets/gridview.dart';
import '../widgets/search_view.dart';

class MyDashBoad extends StatelessWidget {
  const MyDashBoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<Verification>(context).uid;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddView()));
        },
      ),
      appBar: AppBar(
        leading: Container(),
        // centerTitle: true,
        actions: [
          GestureDetector(
              child: GestureDetector(
            child: Icon(Icons.more_vert),
            onTap: () {
              print("email");
            },
          ))
        ],
        title: Text(" email's Dashboard"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SearchTile(
                  label: "Search by Authur",
                  screen: SearchView(genre: "indexedAuthor"),
                ),
                SearchTile(
                  label: "Search by Supervisor",
                  screen: SearchView(genre: "indexedSupervisor"),
                ),
                SearchTile(
                  label: "Search by Title",
                  screen: SearchView(genre: "indexedTitle"),
                ),
                SearchTile(
                    label: "Search by Year",
                    screen: SearchView(
                      genre: "year",
                    ))
              ],
            ),
          ),
        ),
      ),
      body: MyGridView(),
    );
  }
}
