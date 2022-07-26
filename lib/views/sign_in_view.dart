import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:achieval_project/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dashboad_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              label: "Enter Name",
            ),
            MySpace(10.0),
            MyTextFormField(
              label: "Enter Password",
            ),
            MySpace(20.0),
            MyTextButton(
                label: "Sign In",
                onpressed: () {
                  print('hello');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyDashBoad()));
                })
          ],
        ),
      )),
    );
  }
}
