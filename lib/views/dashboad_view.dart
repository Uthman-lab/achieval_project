import 'package:achieval_project/controllers/firebase_controller.dart';
import 'package:achieval_project/controllers/verification.dart';
import 'package:achieval_project/views/add_project.dart';
import 'package:achieval_project/views/search_projects_view.dart';
import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

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
              children: [
                SearchTile(
                  label: "Search by Authur",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchView(
                                  genre: "author",
                                )));
                  },
                ),
                SearchTile(
                  label: "Search by Supervisor",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchView(
                                  genre: "supervisor",
                                )));
                  },
                ),
                SearchTile(
                  label: "Search by Title",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView(
                                  genre: "title",
                                )));
                  },
                ),
                SearchTile(
                  label: "Search by Year",
                  onpress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchView(
                                  genre: "year",
                                )));
                  },
                )
              ],
            ),
          ),
        ),
      ),
      body: MyGridView(),
    );
  }
}

class SearchTile extends StatelessWidget {
  final label;
  final onpress;
  const SearchTile({
    this.onpress,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Text(label)),
    );
  }
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  var data;

  void set() async {
    var provider = Provider.of<FirebaseProvider>(context);
    data = await provider.getAllTitles();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // set();
    var provider = Provider.of<FirebaseProvider>(context);
    return FutureBuilder(
        future: provider.getAllTitles(),
        builder:
            ((context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: cards(snapshot.data!));
            }
          }
          return ListView(
            children: [LinearProgressIndicator(), RefreshProgressIndicator()],
          );
        }));
    // return StreamBuilder(
    //     stream: data,
    //     builder:
    //         ((context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         if (snapshot.hasData) {
    //
    //         }
    //       } else if (snapshot.connectionState == ConnectionState.active) {
    //         if (snapshot.hasData) {
    //           return GridView(
    //             shrinkWrap: true,
    //             physics: NeverScrollableScrollPhysics(),
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2),
    //             children: cards(snapshot.data!),
    //           );
    //         }
    //       }
    //       print(snapshot.connectionState);
    //       print(snapshot.hasData);
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }));
  }

  List<Widget> cards(List<Map<String, dynamic>> list) {
    return List.generate(list.length, (index) {
      return Card(
        color: Theme.of(context).cardTheme.copyWith(color: Colors.green).color,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('title ${list[index]["title"]}',
              softWrap: true, style: Theme.of(context).textTheme.headlineSmall),
        )),
      );
    });
  }
}
