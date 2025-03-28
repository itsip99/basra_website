import 'package:flutter/material.dart';

Widget headerTable(String judul) {
  return Center(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          judul,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
      ),
    ),
  );
}
