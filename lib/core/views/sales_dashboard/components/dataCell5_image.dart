import 'package:flutter/material.dart';

class CellDashboard5Image extends StatelessWidget {
  const CellDashboard5Image({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 206, 214, 255),
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
