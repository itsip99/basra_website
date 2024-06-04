import 'package:flutter/material.dart';

class CellDashboard2 extends StatelessWidget {
  const CellDashboard2({required this.textTitle});

  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 152, 228, 255),
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
