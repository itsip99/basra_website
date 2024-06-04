// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:stsj/core/controller/SalesDashboardController/STUbyLeasing.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelLeasingCategory.dart';
import 'package:stsj/core/service/ReusableService.dart';

import 'package:stsj/core/views/Sales_Dashboard/components/dataCell.dart';
import 'package:stsj/core/views/sales_dashboard/components/dataCell6.dart';

class LeasingCategoryComponent extends StatefulWidget {
  List<DataLeasingCategory> listDataAPIleasingCategory = [];

  LeasingCategoryComponent({
    Key? key,
    required this.listDataAPIleasingCategory,
  }) : super(key: key);

  @override
  ListLeasingCategoryState createState() => ListLeasingCategoryState();
}

class ListLeasingCategoryState extends State<LeasingCategoryComponent> {
  bool isLoading = true;
  bool isReset = false;
  bool isError = false;

  void resetFilter() async {
    // Simulasikan operasi reset dengan penundaan selama 2 detik
    await Future.delayed(Duration(seconds: 1));
    // Setelah reset selesai, Anda dapat menghentikan loading
    setState(() {
      isReset = false;
    });
  }

//   Future<void> FetchData() async {
//     print('Fetch Data Leasing by Category');
//     listDataAPIleasingCategory.clear();

//     setState(() {
//       isLoading = true;
//     });

//     try {
//       await STUbyLeasingController.fetchDataLeasingCategory(
//               FilterbyArea.selectedArea,
//               FilterKategori.selectedKategori,
//               FilterByLeasingRadio.selectedLeasingDP,
//               FilterbyKab.selectedKab,
//               FilterDatesV2.currentSelectionMode ==
//                       DateRangePickerSelectionMode.multiple
//                   ? FilterDatesV2.selectedDates
//                   : (FilterDatesV2.currentSelectionMode ==
//                           DateRangePickerSelectionMode.range
//                       ? FilterDatesV2.rangeDate
//                       : null))
//           .then((value) {
//         setState(() {
//           listDataAPIleasingCategory.addAll(value);
//           isLoading = false;
//           isError = false;
//         });
//       });
//     } catch (e) {
//       print(e);
//       isError = true;
//       isLoading = true;

// // Rethrow the exception
//     }
//   }

  @override
  void initState() {
    super.initState();
    print("==================STUBYLEASINGCATEGORY==================");
    // FetchData();
  }

  @override
  Widget build(BuildContext context) {
    // Kode UI Anda di sini

    double fontsize = 12;

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                child: Text("STU BY LEASING CATEGORY",
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
                child: Text("Judul",
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
                child: Text("LY",
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
      Column(
        children: widget.listDataAPIleasingCategory.map((emp) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.judul}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.qty1}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.qty2}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.qty3}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.vSLM} %'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.lY}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.vSLY} %'),
              ),
            ],
          );
        }).toList(),
      ),
      Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CellDashboard6(textTitle: 'GRAND TOTAL'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard6(
                    textTitle:
                        STUbyLeasingController.sumQty1Category.toString()),
              ),
              Expanded(
                  flex: 1,
                  child: CellDashboard6(
                      textTitle:
                          STUbyLeasingController.sumQty2Category.toString())),
              Expanded(
                flex: 1,
                child: CellDashboard6(
                    textTitle:
                        STUbyLeasingController.sumQty3Category.toString()),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard6(
                    textTitle:
                        '${ServiceReusable.parseAndHandleNaNPercent((STUbyLeasingController.sumQty3Category / STUbyLeasingController.sumQty2Category) * 100)}%'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard6(
                  textTitle:
                      ((STUbyLeasingController.sumLyCategory).toString()),
                ),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard6(
                  textTitle:
                      ('${ServiceReusable.parseAndHandleNaNPercent((STUbyLeasingController.sumQty3Category / STUbyLeasingController.sumLyCategory) * 100)} %'),
                ),
              )
            ],
          ),
        ],
      )
    ]);
  }
}
