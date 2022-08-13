import 'package:achieval_project/widgets/snacbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/dashboad_view.dart';

class Verification extends ChangeNotifier {
  late String _uid;
  String get uid => _uid;
  String? _email;

  get email => _email!;

  void verify({email, password, required context}) async {
    try {
      var methods = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _uid = methods.user!.uid;
      _email = methods.user!.email;

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDashBoad()));
    } on FirebaseAuthException catch (e) {
      String message = e.toString().split(']')[1].trim();
      bool isNetwork = message.contains("network");

      String networkError = "check your network connection and try again";
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${isNetwork ? networkError : message}')));
      print(e);
    }
  }
}
