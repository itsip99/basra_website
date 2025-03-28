import 'package:flutter/material.dart';

Widget rasioTable(double judul) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Row(
      children: [
        Flexible(
          child: Icon(
            judul.isInfinite
                ? Icons.all_inclusive_rounded
                : judul > 100
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
            color: judul.isInfinite
                ? Colors.black
                : judul > 100
                    ? Colors.indigo
                    : Colors.orange,
            size: 30,
          ),
        ),
        const SizedBox(width: 5),
        Align(
          alignment: Alignment.center,
          child: Text(
            judul.isInfinite ? '➖' : '${judul.toStringAsFixed(2)}%',
            style: const TextStyle(fontSize: 13),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}
