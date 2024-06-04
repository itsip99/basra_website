import 'package:flutter/material.dart';

class CellDashboard1 extends StatelessWidget {
  const CellDashboard1({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 182, 255, 250),
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
