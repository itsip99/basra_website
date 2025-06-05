// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelCategoryTotal.dart';
import 'package:stsj/core/service/ReusableService.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:stsj/core/controller/SalesDashboardController/STUbypages1_controller.dart';

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

class BarChartCategoryLY extends StatefulWidget {
  List<DataDashboardTipe> STUbyKategori = [];

  BarChartCategoryLY({
    Key? key,
    required this.STUbyKategori,
  }) : super(key: key);

  @override
  State<BarChartCategoryLY> createState() => _BarChartState();
}

class _BarChartState extends State<BarChartCategoryLY> {
  late List<_ChartData1> data1 = [];
  late List<_ChartData2> data2 = [];

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    print(widget.STUbyKategori);

    _tooltip = TooltipBehavior(enable: true);

    if (widget.STUbyKategori.isNotEmpty) {
      widget.STUbyKategori.forEach((e) {
        data1.add(_ChartData1(e.category.toString(), e.LY!));
        data2.add(_ChartData2(e.category.toString(), e.Qty3!));
      });
    }

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
              'STU BY THIS YEAR & LAST YEAR',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "fontdashboard",
                  color: Colors.blueGrey,
                  fontSize: 14),
            ),
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              legend: Legend(),
              primaryYAxis:
                  NumericAxis(minimum: 0, maximum: 16000, interval: 10),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<dynamic, dynamic>>[
                ColumnSeries<_ChartData1, String>(
                  dataSource: data1,
                  xValueMapper: (_ChartData1 data, _) => data.x,
                  yValueMapper: (_ChartData1 data, _) => data.y,
                  name: ServiceReusable.cekbulan(
                    ServiceReusable.bulan2BeforeCheck(
                        int.parse(STUbyPages1.bulan)),
                  ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
