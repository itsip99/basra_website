import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

class TextDisplay extends StatelessWidget {
  const TextDisplay(
    this.size,
    this.textHeader,
    this.textContent, {
    this.isBold = false,
    super.key,
  });

  final double size;
  final String textHeader;
  final String textContent;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: Row(
        children: [
          Expanded(
            child: Text(
              textHeader,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              textContent,
              style: GlobalFont.bigfontR,
            ),
          ),
        ],
      ),
    );
  }
}
