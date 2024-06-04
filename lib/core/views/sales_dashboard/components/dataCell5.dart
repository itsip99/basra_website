import 'package:flutter/material.dart';

class CellDashboard5 extends StatelessWidget {
  const CellDashboard5({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 206, 214, 255),
      ),
      child: Center(
        child: Text(
          textTitle,
          style: TextStyle(fontSize: 11),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
