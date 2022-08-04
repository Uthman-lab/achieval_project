import 'package:flutter/material.dart';

class MySpace extends StatelessWidget {
  final double height;
  const MySpace(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
