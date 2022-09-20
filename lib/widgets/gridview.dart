import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/firebase_controller.dart';

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
