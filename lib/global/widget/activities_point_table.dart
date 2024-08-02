// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/models/Activities/point_calculation.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/widget/activities_point_table_content.dart';

class ActivitiesPointTable extends StatefulWidget {
  ActivitiesPointTable({
    this.isModify = false,
    super.key,
  });

  bool isModify;

  @override
  State<ActivitiesPointTable> createState() => _ActivitiesPointTableState();
}

class _ActivitiesPointTableState extends State<ActivitiesPointTable> {
  @override
  Widget build(BuildContext context) {
    final activitiesPointTableState = Provider.of<MapState>(context);

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
                              'Point 1',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 2',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 3',
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
                              'Point 1',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 2',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 3',
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
                              'Point 1',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 2',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 3',
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
                              'Point 1',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 2',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Point 3',
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
          for (int i = 0;
              i < activitiesPointTableState.activitiesPointList.length;
              i++)
            TableRow(
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
                        activitiesPointTableState.activitiesPointList[i].date,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.275,
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Column(
                          children: activitiesPointTableState
                              .activitiesPointList[i].morningBriefing
                              .asMap()
                              .entries
                              .map((e) {
                            final index = e.key;
                            final ModelPointCalculation point = e.value;

                            if (activitiesPointTableState.activitiesPointList[i]
                                        .morningBriefing.length -
                                    1 ==
                                index) {
                              return Text(
                                point.shopName,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              );
                            } else {
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                  ),
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
                      )),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    activitiesPointTableState
                        .activitiesPointList[i].morningBriefing,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    activitiesPointTableState
                        .activitiesPointList[i].visitMarket,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    activitiesPointTableState
                        .activitiesPointList[i].recruitmentInterview,
                    isModify: widget.isModify,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: ActivitiesPointTableContent(
                    activitiesPointTableState
                        .activitiesPointList[i].dailyReport,
                    isModify: widget.isModify,
                  ),
                ),
                // ... Similarly define TableCell widgets for other columns ...
              ],
            ),
        ],
      ),
    );
  }
}
