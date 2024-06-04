import 'package:flutter/material.dart';

class CellDashboard6Image extends StatelessWidget {
  const CellDashboard6Image({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 188, 224, 238),
      ),
      child: Center(
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 8,
            backgroundImage: AssetImage(textTitle),
          ),
        ),
      ),
    );
  }
}
