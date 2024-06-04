import 'package:flutter/material.dart';

class CellDashboard3 extends StatelessWidget {
  const CellDashboard3({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 128, 179, 255),
      ),
      child: Center(
        child: Text(
          textTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 11),
        ),
      ),
    );
  }
}
