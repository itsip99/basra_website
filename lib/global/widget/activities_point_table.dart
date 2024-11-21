// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/models/Activities/point_calculation.dart';
import 'package:stsj/core/models/Activities/points_type.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/widget/activities_point_table_content.dart';

class ActivitiesPointTable extends StatefulWidget {
  ActivitiesPointTable({
    this.isModify = false,
    this.isMobile = false,
    super.key,
  });

  bool isModify;
  bool isMobile;

  @override
  State<ActivitiesPointTable> createState() => _ActivitiesPointTableState();
}

class _ActivitiesPointTableState extends State<ActivitiesPointTable> {
  Widget computerView(BuildContext context) {
    final state = Provider.of<MenuState>(context);

    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          style: BorderStyle.solid,
          borderRadius: BorderRadius.circular(15.0),
        ),
        columnWidths: {
          0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
          1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.25),
          2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          4: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          5: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
        },
        children: [
          // ============================== HEADER ===============================
          TableRow(
            children: [
              // Main Header 1
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  'Tanggal',
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Header 2
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  'Nama Dealer',
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Header 3
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Briefing Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 4
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Keliling dan Kunjungan Market',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 5
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Kunjungan dan Laporan Harian Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 6
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Recruitment & Interview Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // =============================== DATA ================================
          ...state.getActivitiesPointList.asMap().entries.map((e) {
            final pointsIndex = e.key;
            final ModelPointsType points = e.value;

            return TableRow(
              children: [
                // Main Header 1 with sub-headers (if applicable)
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      Format.tanggalFormat(
                        points.date,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: SingleChildScrollView(
                    child: Column(
                      children: points.morningBriefing.asMap().entries.map((e) {
                        final index = e.key;
                        final ModelPointCalculation point = e.value;

                        if (pointsIndex % 2 == 0) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: ((points.morningBriefing.length - 1) ==
                                      index)
                                  ? Border()
                                  : Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                              color: (index % 2 == 0)
                                  ? Colors.grey[350]
                                  : Colors.transparent,
                            ),
                            child: Text(
                              point.shopName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: ((points.morningBriefing.length - 1) ==
                                      index)
                                  ? Border()
                                  : Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                              color: (index % 2 == 0)
                                  ? Colors.transparent
                                  : Colors.grey[350],
                            ),
                            child: Text(
                              point.shopName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.morningBriefing,
                    pointsIndex,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.visitMarket,
                    pointsIndex,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.recruitmentInterview,
                    pointsIndex,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.dailyReport,
                    pointsIndex,
                    isModify: widget.isModify,
                  ),
                ),
                // ... Similarly define TableCell widgets for other columns ...
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget mobileView(BuildContext context) {
    final state = Provider.of<MenuState>(context);

    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          style: BorderStyle.solid,
          borderRadius: BorderRadius.circular(15.0),
        ),
        columnWidths: {
          0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.1),
          1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.25),
          2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          4: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          5: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
        },
        children: [
          // ============================== HEADER ===============================
          TableRow(
            children: [
              // Main Header 1
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  'Tanggal',
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Header 2
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  'Nama Dealer',
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Header 3
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Briefing Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 4
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Keliling dan Kunjungan Market',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 5
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Kunjungan dan Laporan Harian Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Main Header 6
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text(
                        'Recruitment & Interview Salesman',
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                    // Sub-headings
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Photo',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Caption',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // =============================== DATA ================================
          ...state.getActivitiesPointList.asMap().entries.map((e) {
            final pointsIndex = e.key;
            final ModelPointsType points = e.value;

            return TableRow(
              children: [
                // Main Header 1 with sub-headers (if applicable)
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Text(
                      Format.tanggalFormat(
                        points.date,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: SingleChildScrollView(
                    child: Column(
                      children: points.morningBriefing.asMap().entries.map((e) {
                        final index = e.key;
                        final ModelPointCalculation point = e.value;

                        if (pointsIndex % 2 == 0) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: ((points.morningBriefing.length - 1) ==
                                      index)
                                  ? Border()
                                  : Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                              color: (index % 2 == 0)
                                  ? Colors.grey[350]
                                  : Colors.transparent,
                            ),
                            child: Text(
                              point.shopName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: ((points.morningBriefing.length - 1) ==
                                      index)
                                  ? Border()
                                  : Border(
                                      bottom: BorderSide(color: Colors.black),
                                    ),
                              color: (index % 2 == 0)
                                  ? Colors.transparent
                                  : Colors.grey[350],
                            ),
                            child: Text(
                              point.shopName,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.morningBriefing,
                    pointsIndex,
                    isModify: widget.isModify,
                    isMobile: true,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.visitMarket,
                    pointsIndex,
                    isModify: widget.isModify,
                    isMobile: true,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.recruitmentInterview,
                    pointsIndex,
                    isModify: widget.isModify,
                    isMobile: true,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    points.dailyReport,
                    pointsIndex,
                    isModify: widget.isModify,
                    isMobile: true,
                  ),
                ),
                // ... Similarly define TableCell widgets for other columns ...
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMobile) {
      return mobileView(context);
    } else {
      return computerView(context);
    }
  }
}
