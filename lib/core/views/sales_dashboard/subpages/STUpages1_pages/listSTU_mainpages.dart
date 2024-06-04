import 'package:flutter/material.dart';
import 'package:stsj/core/controller/SalesDashboardController/STUbypages1_controller.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbypage1.dart';

import 'package:stsj/core/views/errorHandling_pages.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/tipeFilterArea.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/tipeFilterDatesUpdate.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/tipeFilterKategori.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/tipeFilterTahunBelow.dart';
import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/STUareaGraphLM.dart';
import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/STUareaGraphLY.dart';
import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/STUbranchArea_pages.dart';
import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/STUkategori_pages.dart';
import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/STUlLeasing_pages.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ListSTU extends StatefulWidget {
  List<DataSTUBYKategori> listDataArea;
  Function fetchData;

  ListSTU({
    required this.listDataArea,
    required this.fetchData,
  });

  static Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1 = {};

  @override
  _ListAreaPagesState createState() => _ListAreaPagesState();
}

class _ListAreaPagesState extends State<ListSTU> {
  var tanggalsekarang = DateTime.now().day;
  var bulansekarang = DateTime.now().month;
  var tahunsekarang = DateTime.now().year;

  final ValueNotifier<String> selectedServices =
      ValueNotifier<String>('STU By Leasing Area');

  bool isError = false;
  bool isLoading = true;
  bool isReset = false;

  void fetchdata() {
    ListSTU.groupedDataSTUpage1.clear();

    for (var data in widget.listDataArea) {
      if (ListSTU.groupedDataSTUpage1.containsKey(data.kode)) {
        ListSTU.groupedDataSTUpage1[data.kode]!.add(data);
      } else {
        ListSTU.groupedDataSTUpage1[data.kode] = [data];
      }
    }
  }

  @override
  void initState() {
    super.initState();

    fetchdata();

    print('==================SalesAreaPages==================');
  }

  @override
  Widget build(BuildContext context) {
    // Kode UI Anda di sini

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 500,
                      child: STUbyKategori(
                          groupedDataSTUpage1: ListSTU.groupedDataSTUpage1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 400,
                      child: STUbyLeasing(
                          groupedDataSTUpage1: ListSTU.groupedDataSTUpage1),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 500,
                      child: STUbyBranch(
                          groupedDataSTUpage1: ListSTU.groupedDataSTUpage1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: BarChartAreaLM(
                              groupedDataSTUpage1: ListSTU.groupedDataSTUpage1),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: BarChartAreaLY(
                              groupedDataSTUpage1: ListSTU.groupedDataSTUpage1),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
