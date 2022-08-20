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
      bool badFormat = message.contains("badly formatted");
      bool empty = message.contains("is empty");
      int errorCode;
      String displayMessage;
      if (isNetwork) {
        errorCode = 1;
      } else if (badFormat) {
        errorCode = 2;
      } else if (empty) {
        errorCode = 3;
      } else {
        errorCode = 0;
      }

      switch (errorCode) {
        case 1:
          displayMessage = "check your network connection and try again";
          break;
        case 2:
          displayMessage = "Email is incorrect";
          break;
        case 3:
          displayMessage = "please Enter an email and password";
          break;
        default:
          displayMessage = message;
      }

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(displayMessage)));
      print(e);
    }
  }
}
