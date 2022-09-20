import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final label;
  final screen;
  const SearchTile({
    this.screen,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Text(label)),
    );
  }
}
