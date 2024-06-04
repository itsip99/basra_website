import 'package:flutter/material.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbypage1.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class _ChartData1 {
  _ChartData1(this.x, this.y);

  final String x;
  final double y;
}

class _ChartData2 {
  _ChartData2(this.x, this.y);

  final String x;
  final double y;
}

class _ChartData3 {
  _ChartData3(this.x, this.y);

  final String x;
  final double y;
}

class BarChartAreaLY extends StatefulWidget {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  BarChartAreaLY({required this.groupedDataSTUpage1});

  @override
  State<BarChartAreaLY> createState() => _BarChartState(groupedDataSTUpage1);
}

class _BarChartState extends State<BarChartAreaLY> {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  _BarChartState(this.groupedDataSTUpage1);

  late List<_ChartData1> data1 = [];
  late List<_ChartData2> data2 = [];

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    _tooltip = TooltipBehavior(enable: true);
    groupedDataSTUpage1['2']!.forEach((e) {
      print(e.Kategori);
      data1.add(_ChartData1(e.Kategori, e.LY));
      data2.add(_ChartData2(e.Kategori, e.Qty3));
    });

    // If you want the chart to be built after the data is populated, you may call setState.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: Text('STU BY LAST YEAR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "fontdashboard",
                      color: Colors.blueGrey,
                      fontSize: 14)),
            ),
            SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis:
                    NumericAxis(minimum: 0, maximum: 4000, interval: 10),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<dynamic, String>>[
                  ColumnSeries<_ChartData1, String>(
                      dataSource: data1,
                      xValueMapper: (_ChartData1 data, _) => data.x,
                      yValueMapper: (_ChartData1 data, _) => data.y,
                      name: 'LAST YEAR',
                      color: Color.fromRGBO(105, 4, 246, 1)),
                  ColumnSeries<_ChartData2, String>(
                      dataSource: data2,
                      xValueMapper: (_ChartData2 data, _) => data.x,
                      yValueMapper: (_ChartData2 data, _) => data.y,
                      name: 'THIS YEAR',
                      color: Color.fromRGBO(4, 246, 145, 1)),
                ]),
          ],
        ),
      ),
    );
  }
}
