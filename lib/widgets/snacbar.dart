import 'package:flutter/material.dart';

class MySnacBar extends StatelessWidget {
  final content;
  const MySnacBar({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(content));
  }
}
