// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelDataLeasingCategoryDP.dart';
import 'package:stsj/core/service/ReusableService.dart';
import 'package:stsj/core/views/sales_dashboard/components/dataCell6.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:stsj/core/controller/SalesDashboardController/STUbyLeasing.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/dataCell.dart';

class CategoryDPComponent extends StatefulWidget {
  List<DataDashboardKategoriDP> listDataAPIleasingDP = [];

  CategoryDPComponent({
    Key? key,
    required this.listDataAPIleasingDP,
  }) : super(key: key);

  @override
  _DPpagesState createState() => _DPpagesState();
}

class _DPpagesState extends State<CategoryDPComponent> {
  var tanggalsekarang = DateTime.now().day;
  var bulansekarang = DateTime.now().month;
  var tahunsekarang = DateTime.now().year;

  bool isLoading = true;
  bool isReset = false;
  bool isError = false;

  // Future<void> fetchData() async {
  //   print('Fetch Data Leasing DP');
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     await STUbyLeasingController.fetchDataLeasingDP(
  //             FilterbyArea.selectedArea,
  //             FilterKategoriRadio.selectedKategori,
  //             FilterByLeasingRadio.selectedLeasingDP,
  //             FilterbyKab.selectedKab,
  //             FilterDatesV2.currentSelectionMode ==
  //                     DateRangePickerSelectionMode.multiple
  //                 ? FilterDatesV2.selectedDates
  //                 : (FilterDatesV2.currentSelectionMode ==
  //                         DateRangePickerSelectionMode.range
  //                     ? FilterDatesV2.rangeDate
  //                     : null))
  //         .then((value) {
  //       listDataAPIleasingDP.addAll(value);

  //       setState(() {
  //         isError = false;
  //         isLoading = false;
  //       });
  //     });
  //   } catch (e) {
  //     isError = true;
  //     isLoading = false;
  //   }
  // }

  @override
  void initState() {
    super.initState();

    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Kode UI Anda di sini
    final double screenWidth = MediaQuery.of(context).size.width;

    double fontsize = 12;

    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text("STU BY RANGE UM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "fontdashboard",
                        color: Colors.blueGrey,
                        fontSize: fontsize)),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text("RANGE UM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "fontdashboard",
                        color: Colors.blueGrey,
                        fontSize: fontsize)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text(
                  "${ServiceReusable.cekbulan(ServiceReusable.bulan2BeforeCheck(int.parse(STUbyLeasingController.bulan)))}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontdashboard",
                    color: Colors.blueGrey,
                    fontSize: fontsize,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text(
                  "${ServiceReusable.cekbulan(ServiceReusable.bulanBeforeCheck(int.parse(STUbyLeasingController.bulan)))}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontdashboard",
                    color: Colors.blueGrey,
                    fontSize: fontsize,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text(
                  "${ServiceReusable.cekbulan(int.parse(STUbyLeasingController.bulan))}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontdashboard",
                    color: Colors.blueGrey,
                    fontSize: fontsize,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text("VSLM",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "fontdashboard",
                        color: Colors.blueGrey,
                        fontSize: fontsize)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text(
                  "LY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontdashboard",
                    color: Colors.blueGrey,
                    fontSize: fontsize,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey, // Warna border
                  width: 1.0, // Lebar border
                ),
              ),
              child: Center(
                child: Text(
                  "VSLY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "fontdashboard",
                    color: Colors.blueGrey,
                    fontSize: fontsize,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      ...widget.listDataAPIleasingDP.map((emp) {
        return Row(
          children: [
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: '${emp.judul}'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.qty1.toString()),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.qty2.toString()),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.qty3.toString()),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.vSLM.toString() + '%'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.lY.toString()),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard1(textTitle: emp.vSLY.toString() + '%'),
            ),
          ],
        );
      }).toList(),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: CellDashboard6(textTitle: 'GRAND TOTAL'),
          ),
          Expanded(
            flex: 1,
            child: CellDashboard6(
                textTitle: STUbyLeasingController.sumQty1RangeUM.toString()),
          ),
          Expanded(
              flex: 1,
              child: CellDashboard6(
                  textTitle: STUbyLeasingController.sumQty2RangeUM.toString())),
          Expanded(
            flex: 1,
            child: CellDashboard6(
                textTitle: STUbyLeasingController.sumQty3RangeUM.toString()),
          ),
          Expanded(
            flex: 1,
            child: CellDashboard6(
                textTitle:
                    '${(STUbyLeasingController.sumQty3RangeUM / STUbyLeasingController.sumQty2RangeUM) * 100}%'),
          ),
          Expanded(
            flex: 1,
            child: CellDashboard6(
              textTitle: ((STUbyLeasingController.sumLyRangeUM).toString()),
            ),
          ),
          Expanded(
            flex: 1,
            child: CellDashboard6(
              textTitle:
                  ('${ServiceReusable.parseAndHandleNaNPercent((STUbyLeasingController.sumQty3RangeUM / STUbyLeasingController.sumLyRangeUM) * 100)}%'),
            ),
          )
        ],
      )
    ]);
  }
}
