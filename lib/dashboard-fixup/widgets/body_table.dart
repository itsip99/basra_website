import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';

Widget bodyTable(String judul, {bool formatMoney = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        formatMoney ? Format.rupiahFormat(judul) : Format.thousandFormat(judul),
        style: const TextStyle(fontSize: 13),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    ),
  );
}
