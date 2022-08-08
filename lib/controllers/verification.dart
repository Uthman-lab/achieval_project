import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/dashboad_view.dart';

class Verification extends ChangeNotifier {
  late String _uid;
  String get uid => _uid;
  void verify({email, password, required context}) async {
    try {
      var methods = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      _uid = methods.user!.uid;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDashBoad()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
