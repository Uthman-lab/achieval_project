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

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.controller, required this.label})
      : super(key: key);
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(label: Text(label)),
    );
  }
}
