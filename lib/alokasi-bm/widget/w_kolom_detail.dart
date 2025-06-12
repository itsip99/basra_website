import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

DataCell wKolomDetail(String value, AlignmentGeometry posisi) {
  return DataCell(
    Align(
      alignment: posisi,
      child: Text(value, style: GlobalFont.smallfontR),
    ),
  );
}
