import 'package:flutter/material.dart';
import 'package:stsj/core/controller/SalesDashboardController/STUbypages1_controller.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbypage1.dart';
import 'package:stsj/core/service/ReusableService.dart';

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

class BarChartAreaLM extends StatefulWidget {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  BarChartAreaLM({required this.groupedDataSTUpage1});

  @override
  State<BarChartAreaLM> createState() => _BarChartState(groupedDataSTUpage1);
}

class _BarChartState extends State<BarChartAreaLM> {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  _BarChartState(this.groupedDataSTUpage1);

  late List<_ChartData1> data1 = [];
  late List<_ChartData2> data2 = [];
  late List<_ChartData3> data3 = [];

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    _tooltip = TooltipBehavior(enable: true);
    groupedDataSTUpage1['2']!.forEach((e) {
      print(e.Kategori);
      data1.add(_ChartData1(e.Kategori, e.Qty1));
      data2.add(_ChartData2(e.Kategori, e.Qty2));
      data3.add(_ChartData3(e.Kategori, e.Qty3));
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
            Text(
              'STU BY AREA BY MONTH',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "fontdashboard",
                  color: Colors.blueGrey,
                  fontSize: 14),
            ),
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis:
                  NumericAxis(minimum: 0, maximum: 4000, interval: 10),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<dynamic, dynamic>>[
                ColumnSeries<_ChartData1, String>(
                  dataSource: data1,
                  xValueMapper: (_ChartData1 data, _) => data.x,
                  yValueMapper: (_ChartData1 data, _) => data.y,
                  name: ServiceReusable.cekbulan(
                      ServiceReusable.bulan2BeforeCheck(
                          int.parse(STUbyPages1.bulan))),
                  color: Color.fromRGBO(96, 228, 1, 1),
                ),
                ColumnSeries<_ChartData2, String>(
                  dataSource: data2,
                  xValueMapper: (_ChartData2 data, _) => data.x,
                  yValueMapper: (_ChartData2 data, _) => data.y,
                  name: ServiceReusable.cekbulan(
                      ServiceReusable.bulanBeforeCheck(
                          int.parse(STUbyPages1.bulan))),
                  color: Color.fromRGBO(27, 4, 234, 1),
                ),
                ColumnSeries<_ChartData3, String>(
                  dataSource: data3,
                  xValueMapper: (_ChartData3 data, _) => data.x,
                  yValueMapper: (_ChartData3 data, _) => data.y,
                  name: ServiceReusable.cekbulan(int.parse(STUbyPages1.bulan)),
                  color: Color.fromRGBO(234, 4, 165, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
