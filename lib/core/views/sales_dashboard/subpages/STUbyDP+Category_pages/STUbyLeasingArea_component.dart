// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:stsj/core/models/SalesDashboardModel/STUModelLeasingDashboardArea.dart';
import 'package:stsj/core/service/ReusableService.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:stsj/core/controller/SalesDashboardController/STUbyLeasing.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/dataCell.dart';

import 'package:stsj/core/views/sales_dashboard/components/dataCell6.dart';

class ListAreaPagesComponent extends StatefulWidget {
  List<STUDataDashboardArea> listDataArea = [];
  ListAreaPagesComponent({
    Key? key,
    required this.listDataArea,
  }) : super(key: key);

  @override
  _ListAreaPagesState createState() => _ListAreaPagesState();
}

class _ListAreaPagesState extends State<ListAreaPagesComponent> {
  List<STUDataDashboardArea> listDataArea = [];

  var tanggalsekarang = DateTime.now().day;
  var bulansekarang = DateTime.now().month;
  var tahunsekarang = DateTime.now().year;

  var bulansebelumnya = DateTime.now().month - 1;
  var duabulansebelumnya = DateTime.now().month - 2;

  bool isLoading = true;
  bool isError = false;
  bool isReset = false;

  @override
  void initState() {
    super.initState();
    print("==================TipeAreaSubPages==================");

    // FetchData();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> kategoriSum = {
      'sumQTY1': 0.00,
      'sumTotalTunaiKredit1': 0.00,
      'sumTotalTunaiKredit2': 0.00,
      'sumTotalTunaiKredit3': 0.00,
      'sumTunai': 0.00,
      'sumQTY2': 0.00,
      'sumQTY3': 0.00,
      'sumVSLM': 0.00,
      'sumVSLY': 0.00,
      'sumLY': 0.00,
    };
    // Kode UI Anda di sini

    double fontsize = 12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                  child: Text("STU BY LEASING AREA",
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
                  child: Text("CC + LEASING",
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
                    "% ${ServiceReusable.cekbulan(ServiceReusable.bulan2BeforeCheck(int.parse(STUbyLeasingController.bulan)))}",
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
                    "% ${ServiceReusable.cekbulan(ServiceReusable.bulanBeforeCheck(int.parse(STUbyLeasingController.bulan)))}",
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
                    "${ServiceReusable.cekbulan((int.parse(STUbyLeasingController.bulan)))}",
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
                    "% ${ServiceReusable.cekbulan((int.parse(STUbyLeasingController.bulan)))}",
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
        Column(
            children: widget.listDataArea.map((emp) {
          kategoriSum['sumQTY1'] += emp.Qty1;
          kategoriSum['sumQTY2'] += emp.Qty2;
          kategoriSum['sumQTY3'] += emp.Qty3;

          if (emp.leasingmkt == "TUNAI" || emp.leasingmkt == "KREDIT") {
            kategoriSum['sumTotalTunaiKredit1'] += emp.Qty1;
            kategoriSum['sumTotalTunaiKredit2'] += emp.Qty2;
            kategoriSum['sumTotalTunaiKredit3'] += emp.Qty3;
            kategoriSum['sumVSLM'] += emp.VSLM;
            kategoriSum['sumVSLY'] += emp.VSLY;

            kategoriSum['sumLY'] += emp.LY;
          }

          var g = intl.NumberFormat("#.##", "en_US");

          return Row(
            children: [
              Expanded(
                flex: 1,
                child: CellDashboard1(textTitle: '${emp.leasingmkt}'),
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
                  textTitle:
                      '${g.format((emp.Qty1 / (kategoriSum['sumTotalTunaiKredit1'])) * 100)} %',
                ),
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
                  textTitle:
                      '${g.format(((emp.Qty2 / (kategoriSum['sumQTY2'] ?? 1)) * 100).isNaN ? 0 : (emp.Qty2 / (kategoriSum['sumQTY2'] ?? 1)) * 100)} %',
                ),
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
                child: CellDashboard1(
                  textTitle:
                      '${g.format(((emp.Qty3 / (kategoriSum['sumQTY3'] ?? 1)) * 100).isNaN ? 0 : (emp.Qty3 / (kategoriSum['sumQTY3'] ?? 1)) * 100)} %',
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 182, 255, 250),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 8,
                            backgroundImage: AssetImage(emp.UrlGambarVZLM!),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CellDashboard1(
                          textTitle:
                              '${emp.VSLM.toString().replaceAll(".", ",")}%'),
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
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 182, 255, 250),
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 8,
                            backgroundImage: AssetImage(emp.UrlGambarVZLY!),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CellDashboard1(
                          textTitle:
                              emp.VSLY.toString().replaceAll(".", ",") + '%'),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CellDashboard6(textTitle: 'GRAND TOTAL'),
            ),
            Expanded(
              flex: 1,
              child: CellDashboard6(
                  textTitle: (kategoriSum['sumTotalTunaiKredit1']).toString()),
            ),
            Expanded(flex: 1, child: CellDashboard6(textTitle: "")),
            Expanded(
              flex: 1,
              child: CellDashboard6(
                  textTitle: (kategoriSum['sumTotalTunaiKredit2']).toString()),
            ),
            Expanded(flex: 1, child: CellDashboard6(textTitle: "")),
            Expanded(
              flex: 1,
              child: CellDashboard6(
                  textTitle: (kategoriSum['sumTotalTunaiKredit3']).toString()),
            ),
            Expanded(flex: 1, child: CellDashboard6(textTitle: "")),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: CellDashboard6(textTitle: "")),
                  Expanded(
                      flex: 1,
                      child: CellDashboard6(
                          textTitle:
                              '${ServiceReusable.parseAndHandleNaNPercent(kategoriSum['sumTotalTunaiKredit3'] / kategoriSum['sumTotalTunaiKredit2'] * 100)}%')),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: CellDashboard6(
                    textTitle: (kategoriSum['sumLY']).toString())),
            Expanded(
                child: Row(
              children: [
                Expanded(flex: 1, child: CellDashboard6(textTitle: "")),
                Expanded(
                    flex: 1,
                    child: CellDashboard6(
                        textTitle:
                            '${ServiceReusable.parseAndHandleNaNPercent(kategoriSum['sumTotalTunaiKredit3'] / kategoriSum['sumVSLY'] * 100)}%')),
              ],
            )),
          ],
        ),
      ],
    );
  }
}

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
