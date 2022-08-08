import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final label;
  final onpressed;
  const MyTextButton({Key? key, this.label, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onpressed, child: Text('${label}'));
  }
}

class MyElevatedButton extends StatelessWidget {
  final label;
  final onpressed;
  const MyElevatedButton({Key? key, this.label, this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onpressed, child: Text('${label}'));
  }
}
