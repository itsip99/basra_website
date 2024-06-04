import 'package:flutter/material.dart';

class CellDashboard1Image extends StatelessWidget {
  const CellDashboard1Image({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 182, 255, 250),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 8,
          backgroundImage: AssetImage(textTitle),
        ),
      ),
    );
  }
}
