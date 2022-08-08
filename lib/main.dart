import 'package:achieval_project/controllers/verification.dart';
import 'package:achieval_project/views/add_project.dart';
import 'package:achieval_project/views/dashboad_view.dart';
import 'package:achieval_project/views/search_projects_view.dart';
import 'package:achieval_project/views/sign_in_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/project_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProjectController>(
            create: (context) => ProjectController()),
        ChangeNotifierProvider<Verification>(
            create: (context) => Verification())
      ],
      child: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      home: SignInView(),
    );
  }
}
