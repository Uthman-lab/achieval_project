import 'dart:math';

import 'package:achieval_project/controllers/verification.dart';
import 'package:achieval_project/widgets/buttons.dart';
import 'package:achieval_project/widgets/spaces.dart';
import 'package:achieval_project/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'dashboad_view.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var verificationProvider = Provider.of<Verification>(context);
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextField(
              controller: emailController,
              label: "Enter Name",
            ),
            MySpace(10.0),
            MyTextField(
              controller: passwordController,
              label: "Enter Password",
            ),
            MySpace(20.0),
            MyTextButton(
                label: "Sign In",
                onpressed: () {
                  verificationProvider.verify(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text);
                })
          ],
        ),
      )),
    );
  }
}
