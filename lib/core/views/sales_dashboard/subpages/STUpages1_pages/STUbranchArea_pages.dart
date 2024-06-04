import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stsj/core/controller/SalesDashboardController/STUbypages1_controller.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbypage1.dart';
import 'package:stsj/core/service/ReusableService.dart';

import 'package:stsj/router/router_const.dart';

import 'package:stsj/core/views/Sales_Dashboard/components/dataCell3.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/dataCell.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/dataCell2.dart';

import 'package:intl/intl.dart' as intl;

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    intl.NumberFormat currencyFormatter = intl.NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

class STUbyBranch extends StatefulWidget {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  STUbyBranch({required this.groupedDataSTUpage1});

  @override
  _SalesPagesState createState() => _SalesPagesState(groupedDataSTUpage1);
}

class _SalesPagesState extends State<STUbyBranch> {
  final Map<String, List<DataSTUBYKategori>> groupedDataSTUpage1;

  _SalesPagesState(this.groupedDataSTUpage1);

  var tanggalsekarang = DateTime.now().day;
  var bulansekarang = DateTime.now().month;
  var tahunsekarang = DateTime.now().year;

  var bulansebelumnya = DateTime.now().month - 1;
  var duabulansebelumnya = DateTime.now().month - 2;

  @override
  void initState() {
    super.initState();

    print('==================SalesAreaPages==================');
  }

  @override
  Widget build(BuildContext context) {
    double fontsize = 12;

    final Map<String, dynamic> kategoriSum = {
      'sumQTY1': 0,
      'sumQTY2': 0,
      'sumQTY3': 0,
      'sumVSLM': 0,
      'sumVSLY': 0,
      'sumLY': 0,
    };

    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 20)),
                ),
                onPressed: () {
                  context.goNamed(RoutesConstant.salesDashboardareaGroup);
                },
                child: Row(
                  children: [
                    Icon(Icons.group),
                    Text('GROUP'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  elevation: MaterialStateProperty.all<double>(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 20)),
                ),
                onPressed: () {
                  context.goNamed(RoutesConstant.salesDashboardkab);
                },
                child: Row(
                  children: [
                    Icon(Icons.area_chart_sharp),
                    Text('KAB'),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
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
                  child: Text("STU BY AREA",
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
                  child: Text("AREA",
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
                    "${ServiceReusable.cekbulan(ServiceReusable.bulan2BeforeCheck(int.parse(STUbyPages1.bulan)))}",
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
                    "${ServiceReusable.cekbulan(ServiceReusable.bulanBeforeCheck(int.parse(STUbyPages1.bulan)))}",
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
                    "${ServiceReusable.cekbulan(int.parse(STUbyPages1.bulan))}",
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
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Warna border
                          width: 1.0, // Lebar border
                        ),
                      ),
                      child: Center(
                        child: Text("",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "fontdashboard",
                                color: Colors.blueGrey,
                                fontSize: fontsize)),
                      ),
                    ),
                  ),
                  Expanded(
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
                ],
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
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Warna border
                          width: 1.0, // Lebar border
                        ),
                      ),
                      child: Center(
                        child: Text("",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "fontdashboard",
                                color: Colors.blueGrey,
                                fontSize: fontsize)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Warna border
                          width: 1.0, // Lebar border
                        ),
                      ),
                      child: Center(
                        child: Text("VSLY",
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
            ),
          ],
        ),
        ...groupedDataSTUpage1['2']!.map((emp) {
          kategoriSum['sumQTY1'] += emp.Qty1;
          kategoriSum['sumQTY2'] += emp.Qty2;
          kategoriSum['sumQTY3'] += emp.Qty3;
          kategoriSum['sumLY'] += emp.LY;
          kategoriSum['sumVSLM'] += emp.VSLM;
          kategoriSum['sumVSLY'] += emp.VSLY;

          return Row(
            children: [
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.Kategori}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(
                    textTitle: emp.Qty1.toString().length > 3
                        ? CurrencyFormat.convertToIdr(emp.Qty1, 0).toString()
                        : emp.Qty1.toString()),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(
                    textTitle: emp.Qty2.toString().length > 3
                        ? CurrencyFormat.convertToIdr(emp.Qty2, 0).toString()
                        : emp.Qty2.toString()),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(
                    textTitle: emp.Qty3.toString().length > 3
                        ? CurrencyFormat.convertToIdr(emp.Qty3, 0).toString()
                        : emp.Qty3.toString()),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Color.fromARGB(255, 182, 255, 250),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 8,
                            backgroundImage: AssetImage(emp.UrlGambarVZLM),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CellDashboard1(
                          textTitle:
                              (emp.VSLM.toString().replaceAll(",", ".") + '%')),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard1(
                    textTitle: emp.Qty3.toString().length > 3
                        ? CurrencyFormat.convertToIdr(emp.Qty3, 0).toString()
                        : emp.LY.toString()),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 182, 255, 250),
                          ),
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 8,
                              backgroundImage: AssetImage(emp.UrlGambarVZLY),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CellDashboard1(
                            textTitle:
                                (emp.VSLY.toString().replaceAll(",", ".") +
                                    '%')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CellDashboard2(textTitle: 'GRAND TOTAL'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard2(textTitle: '${kategoriSum['sumQTY1']}'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard2(textTitle: '${kategoriSum['sumQTY2']}'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard2(textTitle: '${kategoriSum['sumQTY3']}'),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: CellDashboard2(
                    textTitle: "",
                  )),
                  Expanded(
                    child: CellDashboard2(
                        textTitle: (ServiceReusable.parseAndHandleNaNPercent(
                                    (kategoriSum['sumQTY3'] /
                                            kategoriSum['sumQTY2']) *
                                        100))
                                .toString() +
                            '%'),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: CellDashboard2(
                  textTitle: kategoriSum['sumLY'].toString().length > 3
                      ? CurrencyFormat.convertToIdr(kategoriSum['sumLY'], 0)
                          .toString()
                      : kategoriSum['sumLY'].toString(),
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CellDashboard2(
                          textTitle: "",
                        )),
                    Expanded(
                      flex: 1,
                      child: CellDashboard2(
                          textTitle: (ServiceReusable.parseAndHandleNaNPercent(
                                      (kategoriSum['sumQTY3'] /
                                              kategoriSum['sumLY']) *
                                          100))
                                  .toString() +
                              '%'),
                    ),
                  ],
                )),
          ],
        ),
        ...groupedDataSTUpage1['2']!.map((emp2) {
          var g = intl.NumberFormat("#.##", "en_US");

          String Temp = "";
          String TempLY = "";
          double resultEMP = (emp2.Qty3 / kategoriSum['sumQTY3']).isNaN
              ? 0
              : (emp2.Qty3 / kategoriSum['sumQTY3']);

          double parseAndHandleNaN(double value) {
            if (value.isNaN) {
              return 0;
            } else {
              return double.parse(g.format(value));
            }
          }

          double sumVSLM = parseAndHandleNaN(
              (resultEMP - (emp2.Qty2 / kategoriSum['sumQTY2']) * 100));

          double resultEMP2 = (emp2.Qty3 / kategoriSum['sumQTY3']).isNaN
              ? 0
              : (emp2.Qty3 / kategoriSum['sumQTY3']);

          double sumVSLY = parseAndHandleNaN(
              (resultEMP2 - emp2.LY / kategoriSum['sumLY']) * 100);

          double sumLY =
              parseAndHandleNaN((emp2.LY / kategoriSum['sumLY']) * 100);

          if ((sumVSLM) >= 100) {
            Temp = "assets/images/icon-up.png";
          } else {
            Temp = "assets/images/icon-down.png";
          }

          if (sumVSLY >= 100) {
            TempLY = "assets/images/icon-up.png";
          } else {
            TempLY = "assets/images/icon-down.png";
          }

          return Row(
            children: [
              Expanded(
                flex: 1,
                child: CellDashboard3(textTitle: '${emp2.Kategori}'),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard3(
                  textTitle:
                      '${g.format(((emp2.Qty1 / (kategoriSum['sumQTY1'] ?? 1)) * 100).isNaN ? 0 : (emp2.Qty1 / (kategoriSum['sumQTY1'] ?? 1)) * 100)} %',
                ),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard3(
                  textTitle:
                      '${g.format(((emp2.Qty2 / (kategoriSum['sumQTY2'] ?? 1)) * 100).isNaN ? 0 : (emp2.Qty2 / (kategoriSum['sumQTY2'] ?? 1)) * 100)} %',
                ),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard3(
                  textTitle:
                      '${g.format(((emp2.Qty3 / (kategoriSum['sumQTY3'] ?? 1)) * 100).isNaN ? 0 : (emp2.Qty3 / (kategoriSum['sumQTY3'] ?? 1)) * 100)} %',
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 128, 179, 255),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 8,
                            backgroundImage: AssetImage(Temp),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CellDashboard3(textTitle: '${sumVSLM} %'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CellDashboard3(textTitle: '${sumLY} %'),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 128, 179, 255),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 8,
                            backgroundImage: AssetImage(TempLY),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CellDashboard3(textTitle: '${sumVSLY} %'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList()
      ]),
    ));
  }
}
