// import 'package:basra_mobile/DataDashboardClass.dart';
// import 'package:basra_mobile/FilterArea.dart';
// import 'package:basra_mobile/FilterHome.dart';
// import 'package:basra_mobile/NavigatorArea.dart';
// import 'package:basra_mobile/Style.dart';
// import 'package:flutter/material.dart';
// import 'DatabaseService.dart';
// import 'Nav-Drawer.dart';
// import 'package:intl/intl.dart' as intl;
// import 'WidgetBulan.dart';
// import 'WidgetTahun.dart';

// class ApiDashBoardByArea extends StatefulWidget {
//   String NamaUser = "";
//   String PasswordUser = "";

//   ApiDashBoardByArea(this.NamaUser, this.PasswordUser);

//   @override
//   State<ApiDashBoardByArea> createState() =>
//       _ApiDashBoardByAreaState(NamaUser, PasswordUser);
// }

// class _ApiDashBoardByAreaState extends State<ApiDashBoardByArea> {
//   String NamaUser = "";
//   String PasswordUser = "";
//   String NamaVersi = "";
//   static var f = intl.NumberFormat("###.0#", "en_US");
//   static var g = intl.NumberFormat("#.##", "en_US");

//   _ApiDashBoardByAreaState(this.NamaUser, this.PasswordUser);

//   var prevMonth = DateTime.now().month - 1;
//   var secondprevMonth = DateTime.now().month - 2;
//   var MonthNow = DateTime.now().month;

//   String? cekbulan(String NamaBulan) {
//     if (NamaBulan.toString() == "01") {
//       return "JANUARI";
//     } else if (NamaBulan.toString() == "2") {
//       return "FEBRUARI";
//     } else if (NamaBulan.toString() == "3") {
//       return "MARET";
//     } else if (NamaBulan.toString() == "4") {
//       return "APRIL";
//     } else if (NamaBulan.toString() == "5") {
//       return "MEI";
//     } else if (NamaBulan.toString() == "6") {
//       return "JUNI";
//     } else if (NamaBulan.toString() == "7") {
//       return "JULI";
//     } else if (NamaBulan.toString() == "8") {
//       return "AGUSTUS";
//     } else if (NamaBulan.toString() == "9") {
//       return "SEPTEMBER";
//     } else if (NamaBulan.toString() == "10") {
//       return "OKTOBER";
//     } else if (NamaBulan.toString() == "11") {
//       return "NOVEMBER";
//     } else if (NamaBulan.toString() == "12") {
//       return "DESEMBER";
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     updateData();
//   }

//   void updateData() {
//     print("masuk refresh");
//     setState(() {
//       databaseservice.fetchDataarea(
//           NamaUser,
//           PasswordUser,
//           NavigatorArea.listareaarea,
//           NavigatorArea.listkategoriarea,
//           NavigatorArea.lisstkabupatenarea,
//           WidgetBulan.bulanfilter == 0
//               ? NavigatorArea.bulansekarang.toString()
//               : WidgetBulan.bulanfilter.toString(),
//           WidgetTahun.tahunfilter == ""
//               ? NavigatorArea.tahunsekarang.toString()
//               : WidgetTahun.tahunfilter.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             // await filterapiarea.filterarea(
//             //     context, NamaUser, PasswordUser, NamaVersi);
//             // setState(() {
//             //   updateData();
//             // });
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => FilterArea(updateData)));
//           },
//           backgroundColor: Colors.white,
//           child: Icon(
//             Icons.filter_list,
//             color: Colors.black,
//           ),
//         ),
//         drawer: DrawerWidget(NamaUser, PasswordUser, this.NamaVersi),
//         body: RefreshIndicator(
//           onRefresh: () async {
//             setState(() {
//               updateData();
//             });
//           },
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 50,
//                 child: Card(
//                   shape: BeveledRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     side: BorderSide(
//                         color: Colors.black,
//                         style: BorderStyle.solid,
//                         width: 1),
//                   ),
//                   child: Center(
//                       child: Text(
//                     "STU SEPEDA MOTOR BY AREA",
//                     style: TextStyle(
//                         fontFamily: "fontdashboard",
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold),
//                   )),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
//                   child: FutureBuilder(
//                       initialData: <DataDashboardArea>[],
//                       future: databaseservice.fetchDataarea(
//                           NamaUser,
//                           PasswordUser,
//                           NavigatorArea.listareaarea,
//                           NavigatorArea.listkategoriarea,
//                           NavigatorArea.lisstkabupatenarea,
//                           WidgetBulan.bulanfilter == 0
//                               ? NavigatorArea.bulansekarang.toString()
//                               : WidgetBulan.bulanfilter.toString(),
//                           WidgetTahun.tahunfilter == ""
//                               ? NavigatorArea.tahunsekarang.toString()
//                               : WidgetTahun.tahunfilter.toString()),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError ||
//                             snapshot.data == null ||
//                             snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                           return SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height,
//                             child: Center(
//                               child: CircularProgressIndicator(
//                                 backgroundColor: Colors.amberAccent,
//                                 strokeWidth: 10,
//                               ),
//                             ),
//                           );
//                         }
//                         if (snapshot.hasData) {
//                           return SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   DataTable(
//                                     dividerThickness: 5,
//                                     showBottomBorder: true,
//                                     columnSpacing: 10.0,
//                                     headingRowColor:
//                                         MaterialStateProperty.all(Colors.white),
//                                     columns: [
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         'JENIS PEMBAYARAN',
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         cekbulan((WidgetBulan.bulanfilter == 0
//                                                     ? (NavigatorArea
//                                                         .duabulansebelumnya)
//                                                     : (FilterArea
//                                                         .bulansecondprev))
//                                                 .toString())
//                                             .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         '% ' +
//                                             cekbulan((WidgetBulan.bulanfilter ==
//                                                             0
//                                                         ? (NavigatorArea
//                                                             .duabulansebelumnya)
//                                                         : (FilterArea
//                                                             .bulansecondprev))
//                                                     .toString())
//                                                 .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         cekbulan((WidgetBulan.bulanfilter == 0
//                                                     ? (NavigatorArea
//                                                         .bulansebelumnya)
//                                                     : (FilterArea.bulanprev))
//                                                 .toString())
//                                             .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         '% ' +
//                                             cekbulan((WidgetBulan.bulanfilter ==
//                                                             0
//                                                         ? (NavigatorArea
//                                                             .bulansebelumnya)
//                                                         : (FilterArea
//                                                             .bulanprev))
//                                                     .toString())
//                                                 .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         cekbulan((WidgetBulan.bulanfilter == 0
//                                                     ? (NavigatorArea
//                                                         .bulansekarang)
//                                                     : (FilterArea.bulannow))
//                                                 .toString())
//                                             .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         '% ' +
//                                             cekbulan((WidgetBulan.bulanfilter ==
//                                                             0
//                                                         ? (NavigatorArea
//                                                             .bulansekarang)
//                                                         : (FilterArea.bulannow))
//                                                     .toString())
//                                                 .toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "VS LM",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "% VS LM",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "LAST YEAR",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "% LAST YEAR",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "VS LY",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                       DataColumn(
//                                           label: Center(
//                                               child: Text(
//                                         "% VS LY",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "fontdashboard",
//                                             color: Colors.blueGrey,
//                                             fontSize: 16),
//                                       ))),
//                                     ],
//                                     rows: <DataRow>[
//                                       ...(snapshot.data as List).map((emp) {
//                                         return DataRow(cells: [
//                                           DataCell(
//                                             Text(
//                                               emp.leasingmkt.toString(),
//                                               style: TextStyle(
//                                                   fontFamily: "fontdashboard",
//                                                   fontWeight:
//                                                       FontWeight.normal),
//                                             ),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.Qty1.toString().length >
//                                                             3
//                                                         ? CurrencyFormat
//                                                                 .convertToIdr(
//                                                                     emp.Qty1, 0)
//                                                             .toString()
//                                                         : emp.Qty1.toString(),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.leasingmkt == "TUNAI" ||
//                                                             emp.leasingmkt ==
//                                                                 "KREDIT"
//                                                         ? g
//                                                                 .format(((emp.Qty1 / databaseservice.SumQty1Area) *
//                                                                     100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %'
//                                                         : g
//                                                                 .format(
//                                                                     ((emp.Qty1 / databaseservice.SumQty1Leasing) *
//                                                                         100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %',
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.Qty2.toString().length >
//                                                             3
//                                                         ? CurrencyFormat
//                                                                 .convertToIdr(
//                                                                     emp.Qty2, 0)
//                                                             .toString()
//                                                         : emp.Qty2.toString(),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.leasingmkt == "TUNAI" ||
//                                                             emp.leasingmkt ==
//                                                                 "KREDIT"
//                                                         ? g
//                                                                 .format(((emp.Qty2 / databaseservice.SumQty2Area) *
//                                                                     100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %'
//                                                         : g
//                                                                 .format(
//                                                                     ((emp.Qty2 / databaseservice.SumQty2Leasing) *
//                                                                         100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %',
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.Qty3.toString().length >
//                                                             3
//                                                         ? CurrencyFormat
//                                                                 .convertToIdr(
//                                                                     emp.Qty3, 0)
//                                                             .toString()
//                                                         : emp.Qty3.toString(),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     databaseservice.SumQty3Leasing == 0 ||
//                                                             databaseservice
//                                                                     .SumQty3Area ==
//                                                                 0
//                                                         ? "0 %"
//                                                         : emp.leasingmkt == "TUNAI" ||
//                                                                 emp.leasingmkt ==
//                                                                     "KREDIT"
//                                                             ? g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Area) *
//                                                                         100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %'
//                                                             : g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Leasing) *
//                                                                         100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %',
//                                                     style: TextStyle(
//                                                         fontFamily: "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                           DataCell(Container(
//                                             child: CircleAvatar(
//                                               backgroundColor:
//                                                   Color.fromARGB(0, 90, 70, 70),
//                                               radius: 10,
//                                               backgroundImage:
//                                                   AssetImage(emp.UrlGambarVZLM),
//                                             ),
//                                           )),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.VSLM
//                                                         .toString()
//                                                         .replaceAll(".", ","),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     databaseservice.SumVSLM == 0
//                                                         ? "0 %"
//                                                         : emp.leasingmkt ==
//                                                                     "TUNAI" ||
//                                                                 emp.leasingmkt ==
//                                                                     "KREDIT"
//                                                             ? g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Area) * 100) -
//                                                                         ((emp.Qty2 / databaseservice.SumQty2Area) *
//                                                                             100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %'
//                                                             : g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Leasing) * 100) -
//                                                                         ((emp.Qty2 / databaseservice.SumQty2Leasing) *
//                                                                             100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %',
//                                                     style: TextStyle(
//                                                         fontFamily: "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.LY.toString().length > 3
//                                                         ? CurrencyFormat
//                                                                 .convertToIdr(
//                                                                     emp.LY, 0)
//                                                             .toString()
//                                                         : emp.LY.toString(),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.leasingmkt == "TUNAI" ||
//                                                             emp.leasingmkt ==
//                                                                 "KREDIT"
//                                                         ? g
//                                                                 .format(((emp.LY / databaseservice.SumQtyLYArea) *
//                                                                     100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %'
//                                                         : g
//                                                                 .format(
//                                                                     ((emp.LY / databaseservice.SumQtyLYLeasing) *
//                                                                         100))
//                                                                 .toString()
//                                                                 .replaceAll(
//                                                                     ".", ",") +
//                                                             ' %',
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                           DataCell(Container(
//                                             child: CircleAvatar(
//                                               backgroundColor:
//                                                   Colors.transparent,
//                                               radius: 10,
//                                               backgroundImage:
//                                                   AssetImage(emp.UrlGambarVZLY),
//                                             ),
//                                           )),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     emp.VSLY
//                                                         .toString()
//                                                         .replaceAll(".", ","),
//                                                     style: TextStyle(
//                                                         fontFamily:
//                                                             "fontdashboard",
//                                                         fontWeight: FontWeight
//                                                             .normal))),
//                                           ),
//                                           DataCell(
//                                             Center(
//                                                 child: Text(
//                                                     databaseservice.SUMVSLY == 0
//                                                         ? "0 %"
//                                                         : emp.leasingmkt ==
//                                                                     "TUNAI" ||
//                                                                 emp.leasingmkt ==
//                                                                     "KREDIT"
//                                                             ? g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Area) * 100) -
//                                                                         ((emp.LY / databaseservice.SumQtyLYArea) *
//                                                                             100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %'
//                                                             : g
//                                                                     .format(((emp.Qty3 / databaseservice.SumQty3Leasing) * 100) -
//                                                                         ((emp.LY / databaseservice.SumQtyLYLeasing) *
//                                                                             100))
//                                                                     .toString()
//                                                                     .replaceAll(
//                                                                         ".", ",") +
//                                                                 ' %',
//                                                     style: TextStyle(
//                                                         fontFamily: "fontdashboard",
//                                                         fontWeight: FontWeight.normal))),
//                                           ),
//                                         ]);
//                                       }).toList(),
//                                       DataRow(
//                                           color: MaterialStateProperty.all(
//                                               Colors.white),
//                                           cells: [
//                                             DataCell(
//                                               Text(
//                                                 "GRAND TOTAL",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               ),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 databaseservice.SumQty1Area
//                                                                 .toString()
//                                                             .length >
//                                                         3
//                                                     ? CurrencyFormat
//                                                             .convertToIdr(
//                                                                 databaseservice
//                                                                     .SumQty1Area,
//                                                                 0)
//                                                         .toString()
//                                                     : databaseservice
//                                                         .SumQty1Area.toString(),
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 databaseservice.SumQty2Area
//                                                                 .toString()
//                                                             .length >
//                                                         3
//                                                     ? CurrencyFormat
//                                                             .convertToIdr(
//                                                                 databaseservice
//                                                                     .SumQty2Area,
//                                                                 0)
//                                                         .toString()
//                                                     : databaseservice
//                                                         .SumQty2Area.toString(),
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 databaseservice.SumQty3Area
//                                                                 .toString()
//                                                             .length >
//                                                         3
//                                                     ? CurrencyFormat
//                                                             .convertToIdr(
//                                                                 databaseservice
//                                                                     .SumQty3Area,
//                                                                 0)
//                                                         .toString()
//                                                     : databaseservice
//                                                         .SumQty3Area.toString(),
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 g
//                                                         .format((databaseservice
//                                                                     .SumQty3Area /
//                                                                 databaseservice
//                                                                     .SumQty2Area) *
//                                                             100)
//                                                         .toString()
//                                                         .replaceAll(".", ",") +
//                                                     ' %',
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 databaseservice.SumQtyLYArea
//                                                                 .toString()
//                                                             .length >
//                                                         3
//                                                     ? CurrencyFormat.convertToIdr(
//                                                             databaseservice
//                                                                 .SumQtyLYArea,
//                                                             0)
//                                                         .toString()
//                                                     : databaseservice
//                                                             .SumQtyLYArea
//                                                         .toString(),
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 g
//                                                         .format(((databaseservice
//                                                                     .SumQty3Area /
//                                                                 databaseservice
//                                                                     .SumQtyLYArea) *
//                                                             100))
//                                                         .toString()
//                                                         .replaceAll(".", ",") +
//                                                     ' %',
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                             DataCell(
//                                               Center(
//                                                   child: Text(
//                                                 "",
//                                                 style: TextStyle(
//                                                     fontFamily: "fontdashboard",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.blueGrey,
//                                                     fontSize: 16),
//                                               )),
//                                             ),
//                                           ]),
//                                     ],
//                                   ),
//                                 ]),
//                           );
//                         }
//                         return SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height,
//                           child: Center(
//                             child: CircularProgressIndicator(
//                               backgroundColor: Colors.amberAccent,
//                               strokeWidth: 10,
//                             ),
//                           ),
//                         );
//                       }),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// class CurrencyFormat {
//   static String convertToIdr(dynamic number, int decimalDigit) {
//     intl.NumberFormat currencyFormatter = intl.NumberFormat.currency(
//       locale: 'id',
//       symbol: '',
//       decimalDigits: decimalDigit,
//     );
//     return currencyFormatter.format(number);
//   }
// }
