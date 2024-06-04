import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  TitleHeader({required this.textTitle});
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textTitle,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "fontdashboard",
            color: Colors.blueGrey,
            fontSize: 16),
      ),
    );
  }
}
