// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stsj/core/views/sales_dashboard/subpages/STUbyLeasingArea_pages/STUbyLeasingAreaPieChart.dart';
import 'package:pie_chart/pie_chart.dart';

class STUbyLeasingAreaPieChartAll extends StatefulWidget {
  List<ChartData> AreaChart = [];

  STUbyLeasingAreaPieChartAll({
    Key? key,
    required this.AreaChart,
  }) : super(key: key);

  @override
  State<STUbyLeasingAreaPieChartAll> createState() =>
      _STUbyLeasingAreaPieChartState();
}

class _STUbyLeasingAreaPieChartState
    extends State<STUbyLeasingAreaPieChartAll> {
  Map<String, double> listFilterGraph = {};

  @override
  void initState() {
    super.initState();

    // fetch data chart terlebih dahulu
    if (widget.AreaChart.isNotEmpty) {
      for (var i = 0; i < widget.AreaChart.length; i++) {
        listFilterGraph[widget.AreaChart[i].x] = widget.AreaChart[i].y;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text("LEASING",
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
            colorList: [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.orange,
              Colors.purple,
              Colors.teal,
              Colors.pink,
              Colors.amber,
              Colors.indigo,
              Colors.deepOrange,
            ],

            // Set the radius of the pie chart
            // Set the center text of the pie chart
            // centerText: "Jenis Pembayaran",
            // Set the width of the
            // ring around the pie chart
            ringStrokeWidth: 2,
            // Set the animation duration of the pie chart
            animationDuration: const Duration(seconds: 2),
            // Set the options for the chart values (e.g. show percentages, etc.)
            chartValuesOptions: const ChartValuesOptions(
                showChartValues: true,
                showChartValuesOutside: false,
                showChartValuesInPercentage: true,
                showChartValueBackground: false),
            // Set the options for the legend of the pie chart
            legendOptions: LegendOptions(
              showLegends: true,
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(fontSize: 10),
            ),
            dataMap: listFilterGraph,
            // Set the list of gradients for
            // the background of the pie chart
          ),
        ],
      ),
    );
  }
}
