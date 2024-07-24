// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stsj/core/models/Activities/weekly_report.dart';
import 'package:stsj/global/font.dart';

class WeeklyTableReportContent extends StatelessWidget {
  WeeklyTableReportContent(this.list, {super.key});

  final List<ModelWeeklyReport> list;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: list.asMap().entries.map((e) {
              final ModelWeeklyReport report = e.value;

              if (report.isActAvailable == 1) {
                total += 1;
                return Icon(
                  Icons.check_box,
                  color: Colors.green[600],
                );
              } else {
                return Icon(
                  Icons.check_box,
                  color: Colors.grey,
                );
              }
            }).toList(),
          ),
        ),
        Expanded(
          child: Text(
            total.toString(),
            style: GlobalFont.bigfontR,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
