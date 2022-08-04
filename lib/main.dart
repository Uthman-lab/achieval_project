import 'package:achieval_project/views/add_project.dart';
import 'package:achieval_project/views/dashboad_view.dart';
import 'package:achieval_project/views/search_projects_view.dart';
import 'package:achieval_project/views/sign_in_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Achieval Project",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddView();
  }
}
