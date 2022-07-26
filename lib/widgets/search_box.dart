import 'package:flutter/material.dart';

class MySearchBox extends StatelessWidget {
  final label;
  const MySearchBox({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            label: Text(label),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
