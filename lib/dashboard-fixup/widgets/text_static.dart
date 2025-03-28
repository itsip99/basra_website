import 'package:flutter/material.dart';

class TextStatic extends StatelessWidget {
  const TextStatic(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 3.0),
      alignment: Alignment.centerLeft,
      child: Text('$text : ', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}
