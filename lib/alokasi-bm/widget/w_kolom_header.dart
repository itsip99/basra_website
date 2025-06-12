import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

DataColumn wKolomHeader(BuildContext context, String value, double lebar,
    MainAxisAlignment posisi) {
  return DataColumn(
    columnWidth: FixedColumnWidth(MediaQuery.of(context).size.width * lebar),
    label: Text(value, style: GlobalFont.mediumfontRBold),
    headingRowAlignment: posisi,
  );
}
