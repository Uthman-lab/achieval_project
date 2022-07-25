import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      navigateAfterSeconds: Scaffold(
          body: Center(
        child: Text('welcome'),
      )),
    );
  }
}
