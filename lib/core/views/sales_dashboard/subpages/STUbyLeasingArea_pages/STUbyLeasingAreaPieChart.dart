// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class STUbyLeasingAreaPieChart extends StatefulWidget {
  List<ChartData> AreaChart = [];

  STUbyLeasingAreaPieChart({
    Key? key,
    required this.AreaChart,
  }) : super(key: key);

  @override
  State<STUbyLeasingAreaPieChart> createState() =>
      _STUbyLeasingAreaPieChartState();
}

class _STUbyLeasingAreaPieChartState extends State<STUbyLeasingAreaPieChart> {
  Map<String, double> listFilterGraph = {};

  bool isloading = false;

  // void fetchgapch() {
  //   setState(() {
  //     isloading = true;
  //   });
  //   if (widget.AreaChart.isNotEmpty) {
  //     for (var i = 0; i < widget.AreaChart.length; i++) {
  //       if (widget.AreaChart[i].x == 'TUNAI' ||
  //           widget.AreaChart[i].x == 'KREDIT') {
  //         listFilterGraph[widget.AreaChart[i].x] = widget.AreaChart[i].y;
  //       }
  //     }

  //     setState(() {
  //       isloading = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // fetch data chart terlebih dahulu
    if (widget.AreaChart.isNotEmpty) {
      for (var i = 0; i < widget.AreaChart.length; i++) {
        if (widget.AreaChart[i].x == 'TUNAI' ||
            widget.AreaChart[i].x == 'KREDIT') {
          listFilterGraph[widget.AreaChart[i].x] = widget.AreaChart[i].y;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: isloading
          ? LinearProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text("JENIS PEMBAYARAN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "fontdashboard",
                          color: Colors.blueGrey,
                          fontSize: 14)),
                ),
                PieChart(
                  chartRadius: 400,
                  // Pass in the data for
                  // the pie chart
                  // Set the colors for the
                  // pie chart segments
                  // Set the radius of the pie chart
                  // Set the center text of the pie chart
                  // centerText: "Jenis Pembayaran",
                  // Set the width of the
                  // ring around the pie chart
                  ringStrokeWidth: 2,
                  // Set the animation duration of the pie chart
                  animationDuration: const Duration(seconds: 3),
                  // Set the options for the chart values (e.g. show percentages, etc.)
                  chartValuesOptions: const ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesOutside: false,
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false),
                  // Set the options for the legend of the pie chart
                  legendOptions: const LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.bottom,
                      legendShape: BoxShape.rectangle,
                      legendTextStyle: TextStyle(fontSize: 10),
                      showLegendsInRow: true),
                  dataMap: listFilterGraph,
                  // Set the list of gradients for
                  // the background of the pie chart
                ),
              ],
            ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class ChartDataBaru {
  ChartDataBaru(this.x, this.y);
  final String x;
  final double y;
}
