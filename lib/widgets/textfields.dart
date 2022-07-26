import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final label;
  const MyTextFormField({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), label: Text("${label}")),
    );
  }
}
