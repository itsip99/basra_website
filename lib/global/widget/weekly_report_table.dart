import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/widget/weekly_table_report_content.dart';

class WeeklyReportTable extends StatefulWidget {
  const WeeklyReportTable({
    super.key,
  });

  @override
  State<WeeklyReportTable> createState() => _WeeklyReportTableState();
}

class _WeeklyReportTableState extends State<WeeklyReportTable> {
  @override
  Widget build(BuildContext context) {
    final weeklyTableReportState = Provider.of<MenuState>(context);

    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(
          color: Colors.black,
          style: BorderStyle.solid,
          borderRadius: BorderRadius.circular(20.0),
        ),
        columnWidths: {
          0: FlexColumnWidth(MediaQuery.of(context).size.width * 0.15),
          1: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          2: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          3: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
          4: FlexColumnWidth(MediaQuery.of(context).size.width * 0.225),
        },
        children: [
          // ============================== HEADER ===============================
          TableRow(
            children: [
              // Main Header 1
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Text(
                  'Nama Dealer',
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Header 2
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    // Main heading
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text('Briefing Salesman'),
                    ),
                    // Sub-headings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Senin'),
                        Text('Selasa'),
                        Text('Rabu'),
                        Text('Kamis'),
                        Text('Jumat'),
                        Text('Sabtu'),
                        Text('Total'),
                      ],
                    ),
                  ],
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
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text('Keliling dan Kunjungan Market'),
                    ),
                    // Sub-headings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Senin'),
                        Text('Selasa'),
                        Text('Rabu'),
                        Text('Kamis'),
                        Text('Jumat'),
                        Text('Sabtu'),
                        Text('Total'),
                      ],
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
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text('Kunjungan dan Laporan Harian Salesman'),
                    ),
                    // Sub-headings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Senin'),
                        Text('Selasa'),
                        Text('Rabu'),
                        Text('Kamis'),
                        Text('Jumat'),
                        Text('Sabtu'),
                        Text('Total'),
                      ],
                    ),
                  ],
                ),
              ),

              // Main Header 5
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Text('Recruitment & Interview Salesman'),
                    ),
                    // Sub-headings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text('Senin'),
                        Text('Selasa'),
                        Text('Rabu'),
                        Text('Kamis'),
                        Text('Jumat'),
                        Text('Sabtu'),
                        Text('Total'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // =============================== DATA ================================
          for (int i = 0;
              i < weeklyTableReportState.weeklyReportTypeList.length;
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
                      weeklyTableReportState.weeklyReportTypeList[i].branchName,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: WeeklyTableReportContent(
                    weeklyTableReportState
                        .weeklyReportTypeList[i].morningBriefing,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: WeeklyTableReportContent(
                    weeklyTableReportState.weeklyReportTypeList[i].visitMarket,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: WeeklyTableReportContent(
                    weeklyTableReportState
                        .weeklyReportTypeList[i].recruitmentInterview,
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: WeeklyTableReportContent(
                    weeklyTableReportState.weeklyReportTypeList[i].dailyReport,
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
