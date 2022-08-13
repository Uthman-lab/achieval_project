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
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  "assets/images/logo_kstu.png",
                  width: 100,
                ),
              ),
              MySpace(10),
              Text(
                "Project Work Achival System",
                softWrap: true,
                style: Theme.of(context).textTheme.headline6,
              ),
              MySpace(50),
              Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 20,
                          blurStyle: BlurStyle.outer,
                          color: Colors.greenAccent,
                          offset: Offset(0, 0),
                          spreadRadius: 0)
                    ],
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [Colors.greenAccent, Colors.greenAccent])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                      MyElevatedButton(
                          label: "Sign In",
                          onpressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: LinearProgressIndicator()));
                            verificationProvider.verify(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text);
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
