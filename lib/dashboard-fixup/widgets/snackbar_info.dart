import 'package:flutter/material.dart';

SnackBar info(bool attention, String txt) {
  return SnackBar(
    content: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: attention ? Colors.red[600]!.withOpacity(0.9) : Colors.green[600]!.withOpacity(0.9),
      ),
      child: Text(
        txt,
        style: const TextStyle(fontSize: 16, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
    duration: const Duration(milliseconds: 3000),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  );
}
