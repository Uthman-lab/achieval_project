import 'package:achieval_project/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySearchBox extends StatelessWidget {
  final label;
  final suffix;
  final controller;
  const MySearchBox({Key? key, this.label, this.suffix, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffix,
            label: GestureDetector(
              child: Text(label),
              onTap: () async {},
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
