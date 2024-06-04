import 'package:flutter/material.dart';

class CellDashboard6 extends StatelessWidget {
  const CellDashboard6({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 188, 224, 238),
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
