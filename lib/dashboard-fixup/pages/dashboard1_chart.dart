import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/dashboard-fixup/models/dashboard1_model.dart';
import 'package:stsj/dashboard-fixup/models/detail_dashboard1_model.dart';
import 'package:stsj/dashboard-fixup/utilities/utils.dart';
import 'package:stsj/dashboard-fixup/widgets/legend_widget.dart';
import 'package:stsj/dashboard-fixup/widgets/top_widget.dart';
import 'package:stsj/dashboard-fixup/widgets/vs_horizontal.dart';
import 'package:stsj/dashboard-fixup/widgets/vs_vertical.dart';

class Dashboard1Chart extends StatefulWidget {
  const Dashboard1Chart(this.listDashboard1, this.sortDetailOmset, this.bln,
      {super.key});
  final List<Dashboard1> listDashboard1;
  final List<DetailDashboard1> sortDetailOmset;
  final String bln;

  @override
  State<Dashboard1Chart> createState() => _Dashboard1ChartState();
}

class _Dashboard1ChartState extends State<Dashboard1Chart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          //*BARIS 1
          Expanded(
            flex: 1,
            child: Column(
              children: [
                //*COLUMN 1.1
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 10),
                        const Text('TOTAL UNIT ENTRY',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Expanded(
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: VSVertical(
                                    widget.listDashboard1[0].unitEntryTm,
                                    widget.listDashboard1[0].unitEntryLm,
                                    'LM',
                                  ),
                                ),
                                const RotatedBox(
                                  quarterTurns: -1,
                                  child: Divider(
                                    thickness: 2,
                                    color: Colors.grey,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: VSVertical(
                                    widget.listDashboard1[0].unitEntryTm,
                                    widget.listDashboard1[0].unitEntryLy,
                                    'LY',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //*COLUMN 1.2
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          'TOTAL OMSET',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: VSHorizontal(
                                  widget.listDashboard1[0].omsetTm,
                                  widget.listDashboard1[0].omsetLm,
                                  'LM',
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: VSHorizontal(
                                  widget.listDashboard1[0].omsetTm,
                                  widget.listDashboard1[0].omsetLy,
                                  'LY',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //*COLUMN 1.3
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text('RATIO OMSET',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(enabled: false),
                                    borderData: FlBorderData(show: false),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 35,
                                    sections: [
                                      PieChartSectionData(
                                        color: Colors.indigo[500],
                                        value: (widget.listDashboard1[0].tmS *
                                            100 /
                                            widget.listDashboard1[0].omsetTm),
                                        title:
                                            '${(widget.listDashboard1[0].tmS * 100 / widget.listDashboard1[0].omsetTm).toStringAsFixed(1)}%',
                                        radius: 30,
                                        titleStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange[500],
                                          shadows: const [
                                            Shadow(
                                                color: Colors.black87,
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                      PieChartSectionData(
                                        color: Colors.indigo[300],
                                        value: (widget.listDashboard1[0].tmPS *
                                            100 /
                                            widget.listDashboard1[0].omsetTm),
                                        title:
                                            '${(widget.listDashboard1[0].tmPS * 100 / widget.listDashboard1[0].omsetTm).toStringAsFixed(1)}%',
                                        radius: 30,
                                        titleStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange[300],
                                          shadows: const [
                                            Shadow(
                                                color: Colors.black87,
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                      PieChartSectionData(
                                        color: Colors.indigo[100],
                                        value: (widget.listDashboard1[0].tmP *
                                            100 /
                                            widget.listDashboard1[0].omsetTm),
                                        title:
                                            '${(widget.listDashboard1[0].tmP * 100 / widget.listDashboard1[0].omsetTm).toStringAsFixed(1)}%',
                                        radius: 30,
                                        titleStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange[200],
                                          shadows: const [
                                            Shadow(
                                                color: Colors.black87,
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LegendWidget(
                                    Colors.indigo[500]!,
                                    'Services:\n${Format.rupiahFormat(widget.listDashboard1[0].tmS.toString())}',
                                  ),
                                  const SizedBox(height: 2),
                                  LegendWidget(
                                    Colors.indigo[300]!,
                                    'Parts & Services:\n${Format.rupiahFormat(widget.listDashboard1[0].tmPS.toString())}',
                                  ),
                                  const SizedBox(height: 2),
                                  LegendWidget(
                                    Colors.indigo[100]!,
                                    'Parts:\n${Format.rupiahFormat(widget.listDashboard1[0].tmP.toString())}',
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          //*BARIS 2
          Expanded(
            flex: 1,
            child: Column(
              children: [
                //*COLUMN 2.1
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text('RATIO MEMBER',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(enabled: false),
                                    borderData: FlBorderData(show: false),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 35,
                                    sections: [
                                      PieChartSectionData(
                                        color: Colors.indigo,
                                        value: widget.listDashboard1[0]
                                                    .unitEntryTm ==
                                                0
                                            ? 0
                                            : (widget.listDashboard1[0]
                                                    .memberTm *
                                                100 /
                                                widget.listDashboard1[0]
                                                    .unitEntryTm),
                                        title:
                                            '${widget.listDashboard1[0].unitEntryTm == 0 ? '-' : (widget.listDashboard1[0].memberTm * 100 / widget.listDashboard1[0].unitEntryTm).toStringAsFixed(1)}%',
                                        radius: 30,
                                        titleStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black87,
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                      PieChartSectionData(
                                        color: Colors.grey[300],
                                        value: 100 -
                                            (widget.listDashboard1[0]
                                                        .unitEntryTm ==
                                                    0
                                                ? 0
                                                : (widget.listDashboard1[0]
                                                        .memberTm *
                                                    100 /
                                                    widget.listDashboard1[0]
                                                        .unitEntryTm)),
                                        showTitle: false,
                                        radius: 30,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LegendWidget(Colors.indigo,
                                      'Member: ${Format.thousandFormat(widget.listDashboard1[0].memberTm.toString())}'),
                                  const SizedBox(height: 2),
                                  LegendWidget(Colors.grey[400]!,
                                      'Unit Entry: ${Format.thousandFormat(widget.listDashboard1[0].unitEntryTm.toString())}'),
                                ],
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //*COLUMN 2.2
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Text(
                          'TOP 5 OMSET ${listBulan[int.parse(widget.bln) - 1]}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: widget.sortDetailOmset.isNotEmpty
                                ? List.generate(5, (i) {
                                    return TopWidget(
                                      i + 1,
                                      widget.sortDetailOmset[i].bsName,
                                      widget.sortDetailOmset[i].omsetTmBS,
                                    );
                                  }).toList()
                                : [],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          //*BARIS 3
          Expanded(
            flex: 2,
            child: Column(
              children: [
                //*COLUMN 3.1
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text(
                          'UNIT ENTRY (PER CABANG)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: BarChart(
                            BarChartData(
                              barTouchData: BarTouchData(
                                touchCallback:
                                    (FlTouchEvent event, barTouchResponse) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        barTouchResponse == null ||
                                        barTouchResponse.spot == null) {
                                      touchedIndex = -1;
                                      return;
                                    }
                                    touchedIndex = barTouchResponse
                                        .spot!.touchedBarGroupIndex;
                                  });
                                },
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.white,
                                  tooltipHorizontalAlignment:
                                      FLHorizontalAlignment.center,
                                  maxContentWidth: 200,
                                  tooltipMargin: 10,
                                  tooltipBorder:
                                      const BorderSide(color: Colors.grey),
                                  tooltipRoundedRadius: 10,
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                    return BarTooltipItem(
                                      '${widget.listDashboard1[0].detail[groupIndex].bsName}\n',
                                      const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                      textAlign: TextAlign.center,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: Format.thousandFormat(widget
                                              .listDashboard1[0]
                                              .detail[groupIndex]
                                              .unitEntryTmBS
                                              .toString()),
                                          style: TextStyle(
                                              color: Colors.orange[700],
                                              fontSize: 13),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                topTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                leftTitles: const AxisTitles(
                                    sideTitles: SideTitles(showTitles: false)),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 26,
                                    getTitlesWidget: (value, meta) {
                                      return SideTitleWidget(
                                        axisSide: AxisSide.top,
                                        child: Text(
                                          '${widget.listDashboard1[0].detail[value.toInt()].branch}${widget.listDashboard1[0].detail[value.toInt()].shop}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(show: false),
                              gridData: const FlGridData(
                                show: true,
                                drawHorizontalLine: true,
                                drawVerticalLine: false,
                                horizontalInterval: 100,
                              ),
                              barGroups: [
                                ...(widget.listDashboard1[0].detail).map((e) {
                                  int idx = widget.listDashboard1[0].detail
                                      .indexOf(e);
                                  return BarChartGroupData(
                                    x: idx,
                                    barRods: [
                                      BarChartRodData(
                                        toY: widget.listDashboard1[0]
                                            .detail[idx].unitEntryTmBS
                                            .toDouble(),
                                        gradient: touchedIndex == idx
                                            ? LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.orange[100]!,
                                                  Colors.orange[500]!
                                                ],
                                              )
                                            : LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                                  Colors.indigo[100]!,
                                                  Colors.indigo[500]!
                                                ],
                                              ),
                                        width: 20,
                                        backDrawRodData:
                                            BackgroundBarChartRodData(
                                          show: true,
                                          toY: 1500,
                                          color: Colors.grey[300],
                                        ),
                                      )
                                    ],
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //*COLUMN 3.2
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Text(
                          'OMSET (PER CABANG)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LegendWidget(Colors.indigo[100]!, 'Parts'),
                            const SizedBox(width: 20),
                            LegendWidget(
                                Colors.indigo[300]!, 'Parts & Services'),
                            const SizedBox(width: 20),
                            LegendWidget(Colors.indigo[500]!, 'Services'),
                          ],
                        ),
                        Expanded(
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: BarChart(
                              BarChartData(
                                barTouchData: BarTouchData(
                                  touchTooltipData: BarTouchTooltipData(
                                    tooltipBgColor: Colors.white,
                                    tooltipHorizontalAlignment:
                                        FLHorizontalAlignment.center,
                                    maxContentWidth: 200,
                                    tooltipMargin: -150,
                                    tooltipHorizontalOffset: -40,
                                    tooltipBorder:
                                        const BorderSide(color: Colors.grey),
                                    tooltipRoundedRadius: 10,
                                    rotateAngle: -90,
                                    getTooltipItem:
                                        (group, groupIndex, rod, rodIndex) {
                                      return rodIndex == 0
                                          ? BarTooltipItem(
                                              '${widget.listDashboard1[0].detail[groupIndex].bsName}\n',
                                              const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                              textAlign: TextAlign.center,
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: Format.rupiahFormat(
                                                      widget
                                                          .listDashboard1[0]
                                                          .detail[groupIndex]
                                                          .tmPBS
                                                          .toString()),
                                                  style: TextStyle(
                                                      color: Colors.orange[700],
                                                      fontSize: 13),
                                                ),
                                              ],
                                            )
                                          : rodIndex == 1
                                              ? BarTooltipItem(
                                                  '${widget.listDashboard1[0].detail[groupIndex].bsName}\n',
                                                  const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                  textAlign: TextAlign.center,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: Format.rupiahFormat(
                                                          widget
                                                              .listDashboard1[0]
                                                              .detail[
                                                                  groupIndex]
                                                              .tmPSBS
                                                              .toString()),
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orange[700],
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                )
                                              : BarTooltipItem(
                                                  '${widget.listDashboard1[0].detail[groupIndex].bsName}\n',
                                                  const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13),
                                                  textAlign: TextAlign.center,
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: Format.rupiahFormat(
                                                          widget
                                                              .listDashboard1[0]
                                                              .detail[
                                                                  groupIndex]
                                                              .tmSBS
                                                              .toString()),
                                                      style: TextStyle(
                                                          color: Colors
                                                              .orange[700],
                                                          fontSize: 13),
                                                    ),
                                                  ],
                                                );
                                    },
                                  ),
                                ),
                                titlesData: FlTitlesData(
                                  show: true,
                                  rightTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  topTitles: const AxisTitles(
                                      sideTitles:
                                          SideTitles(showTitles: false)),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 25,
                                      interval: 50000000,
                                      getTitlesWidget: (value, meta) {
                                        return SideTitleWidget(
                                          axisSide: AxisSide.right,
                                          child: RotatedBox(
                                            quarterTurns: -1,
                                            child: Text(
                                              '${(value % 1000000) == 0 ? value / 1000000 : (value / 1000000).toStringAsFixed(1)}M',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 42,
                                      getTitlesWidget: (value, meta) {
                                        return SideTitleWidget(
                                          axisSide: AxisSide.top,
                                          child: RotatedBox(
                                            quarterTurns: -1,
                                            child: Text(
                                              '${widget.listDashboard1[0].detail[value.toInt()].branch}${widget.listDashboard1[0].detail[value.toInt()].shop}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: false),
                                gridData: const FlGridData(
                                  show: true,
                                  drawHorizontalLine: true,
                                  drawVerticalLine: false,
                                  horizontalInterval: 50000000,
                                ),
                                barGroups: [
                                  ...(widget.listDashboard1[0].detail).map((e) {
                                    int idx = widget.listDashboard1[0].detail
                                        .indexOf(e);
                                    return BarChartGroupData(
                                      x: idx,
                                      groupVertically: true,
                                      barRods: [
                                        BarChartRodData(
                                          fromY: 0,
                                          toY: widget.listDashboard1[0]
                                              .detail[idx].tmPBS
                                              .toDouble(),
                                          color: Colors.indigo[100],
                                          width: 20,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        BarChartRodData(
                                          fromY: widget.listDashboard1[0]
                                              .detail[idx].tmPBS
                                              .toDouble(),
                                          toY: widget.listDashboard1[0]
                                                  .detail[idx].tmPBS
                                                  .toDouble() +
                                              widget.listDashboard1[0]
                                                  .detail[idx].tmPSBS
                                                  .toDouble(),
                                          color: Colors.indigo[300],
                                          width: 20,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        BarChartRodData(
                                          fromY: widget.listDashboard1[0]
                                                  .detail[idx].tmPBS
                                                  .toDouble() +
                                              widget.listDashboard1[0]
                                                  .detail[idx].tmPSBS
                                                  .toDouble(),
                                          toY: widget.listDashboard1[0]
                                                  .detail[idx].tmPBS
                                                  .toDouble() +
                                              widget.listDashboard1[0]
                                                  .detail[idx].tmPSBS
                                                  .toDouble() +
                                              widget.listDashboard1[0]
                                                  .detail[idx].tmSBS
                                                  .toDouble(),
                                          color: Colors.indigo[500],
                                          width: 20,
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        )
                                      ],
                                    );
                                  })
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
