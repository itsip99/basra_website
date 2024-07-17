// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/models/Activities/weekly_activities_report.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/global/widget/area_dropdown.dart';
import 'package:stsj/global/widget/custom_table.dart';
import 'package:stsj/global/widget/label_table.dart';
import 'package:stsj/global/widget/province_dropdown.dart';
import 'package:stsj/router/router_const.dart';

class WeeklyActivitiesReport extends StatefulWidget {
  const WeeklyActivitiesReport({super.key});

  @override
  State<WeeklyActivitiesReport> createState() => _WeeklyActivitiesReportState();
}

class _WeeklyActivitiesReportState extends State<WeeklyActivitiesReport> {
  String province = '';
  String area = '';
  String beginDate = '';
  String endDate = '';

  // Value Listener
  ValueNotifier<String> beginDateNotifier = ValueNotifier('');
  ValueNotifier<String> endDateNotifier = ValueNotifier('');
  ValueNotifier<List<String>> filterDataNotifier = ValueNotifier([]);

  void setProvince(String value) {
    province = value;
  }

  void setArea(String value) {
    area = value;
  }

  void setBeginDate(String value) {
    setState(() {
      beginDate = value;
    });
  }

  void setEndDate(String value) {
    setState(() {
      endDate = value;
    });
  }

  void setBeginDateByGoogle(
    BuildContext context,
    String tgl,
  ) async {
    tgl = tgl == ''
        ? DateTime.now().subtract(Duration(days: 6)).toString().substring(0, 10)
        : tgl;

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tgl == ''
          ? DateTime.now().subtract(Duration(days: 6))
          : DateTime.parse(tgl),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime day) {
        if (day.weekday == DateTime.sunday) {
          return false;
        }

        return true;
      },
    );

    if (picked != null && picked != DateTime.parse(tgl)) {
      // tgl = picked.toString().substring(0, 10);
      // setBeginDate(tgl);
      if (picked.weekday == DateTime.monday) {
        tgl = picked.toString().substring(0, 10);
        setBeginDate(tgl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Day should be set to Monday'),
          ),
        );
      }
    } else {
      // Nothing happened
    }
  }

  void setEndDateByGoogle(
    BuildContext context,
    String tgl,
  ) async {
    tgl = tgl == '' ? DateTime.now().toString().substring(0, 10) : tgl;

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tgl == '' ? DateTime.now() : DateTime.parse(tgl),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      selectableDayPredicate: (DateTime day) {
        if (day.weekday == DateTime.sunday) {
          return false;
        }

        return true;
      },
    );

    if (picked != null && picked != DateTime.parse(tgl)) {
      tgl = picked.toString().substring(0, 10);
      setEndDate(tgl);
    } else {
      // Nothing happened
    }
  }

  void getFilterData(
    BuildContext context,
    MapState state,
  ) {
    setState(() {
      state.provinceNotifier.value = province;
      state.areaNotifier.value = area;

      if (beginDate == '') {
        setBeginDate(
          DateTime.now()
              .subtract(Duration(days: 7))
              .toString()
              .substring(0, 10),
        );
        beginDateNotifier.value = beginDate;
      } else {
        beginDateNotifier.value = beginDate;
      }

      if (endDate == '') {
        setEndDate(
          DateTime.now()
              .subtract(Duration(days: 7))
              .toString()
              .substring(0, 10),
        );
        endDateNotifier.value = endDate;
      } else {
        endDateNotifier.value = endDate;
      }
    });
  }

  void resetData(
    MapState state,
  ) {
    print('Reset Data');
    setState(() {
      setProvince('');
      area = '';
      beginDate = '';
      endDate = '';
      state.provinceNotifier.value = '';
      state.areaNotifier.value = '';
      beginDateNotifier.value = '';
      endDateNotifier.value = '';
      filterDataNotifier.value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weeklyReportState = Provider.of<MapState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          goBack: RoutesConstant.menu,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
          vertical: MediaQuery.of(context).size.height * 0.01,
        ),
        child: Column(
          children: [
            // ==================================================================
            // =========================== Filter ===============================
            // ==================================================================
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: null,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.filter_alt_rounded,
                          size: 25.0,
                          color: Colors.black,
                        ),
                        Text(
                          'Filter',
                          style: GlobalFont.mediumgiantfontR,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 10.0),

                // Filter's Expand and Collapse Animation
                AnimatedSize(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                  curve: weeklyReportState.isFilterOpen
                      ? Curves.easeInOut
                      : Curves.easeIn,
                  child: SizedBox(
                    // width: weeklyReportState.isFilterOpen
                    //     ? MediaQuery.of(context).size.width * 0.5
                    //     : 0.0,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.125,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            // border: Border.all(color: Colors.black, width: 1.5),
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical: MediaQuery.of(context).size.height * 0.01,
                          ),
                          child: ProvinceDropdown(
                            listData: weeklyReportState.provinceList,
                            inputan: province,
                            hint: 'Provinsi',
                            handle: setProvince,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        ValueListenableBuilder(
                          valueListenable: weeklyReportState.provinceNotifier,
                          builder: (context, value, child) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.125,
                              child: FutureBuilder(
                                future: weeklyReportState.fetchAreas(value),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text('Error: ${snapshot.error}'),
                                    );
                                  } else {
                                    return AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: (snapshot.data!.isNotEmpty &&
                                                snapshot.data!.length > 2)
                                            ? Colors.grey[400]
                                            : Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        vertical:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      child: AreaDropdown(
                                        listData: snapshot.data!,
                                        inputan: area,
                                        hint: 'Area',
                                        handle: setArea,
                                        disable: (value == province &&
                                                snapshot.data!.length > 2)
                                            ? false
                                            : true,
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () => setBeginDateByGoogle(
                            context,
                            beginDate,
                          ),
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.date_range_rounded),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.003,
                                ),
                                Text(
                                  beginDate == ''
                                      ? Format.tanggalFormat(
                                          DateTime.now()
                                              .subtract(Duration(days: 6))
                                              .toString()
                                              .substring(0, 10),
                                        )
                                      : Format.tanggalFormat(beginDate),
                                  style: GlobalFont.mediumgiantfontR,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          ' - ',
                          style: GlobalFont.giantfontRBold,
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () => setEndDateByGoogle(
                            context,
                            endDate,
                          ),
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.date_range_rounded),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.003,
                                ),
                                Text(
                                  endDate == ''
                                      ? Format.tanggalFormat(
                                          DateTime.now()
                                              .toString()
                                              .substring(0, 10),
                                        )
                                      : Format.tanggalFormat(endDate),
                                  style: GlobalFont.mediumgiantfontR,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {
                            // getFilterData(
                            //   context,
                            //   weeklyReportState,
                            // );
                            //
                            // filterDataNotifier.value
                            //     .add(weeklyReportState.provinceNotifier.value);
                            // filterDataNotifier.value
                            //     .add(weeklyReportState.areaNotifier.value);
                            // filterDataNotifier.value
                            //     .add(beginDateNotifier.value);
                            // filterDataNotifier.value.add(endDateNotifier.value);
                            //
                            // print(
                            //   'Filter Data length: ${filterDataNotifier.value.length}',
                            // );
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.03,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: const Icon(
                              Icons.search_rounded,
                              size: 25.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {
                            resetData(weeklyReportState);
                            weeklyReportState.setIsReset();
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.05,
                            height: MediaQuery.of(context).size.height * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'reset',
                              style: GlobalFont.mediumgiantfontR,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // =================================================================
            // ========================== Devider ==============================
            // =================================================================
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            // =================================================================
            // ====================== Report in Table ==========================
            // =================================================================
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.82,
              child: FutureBuilder(
                future: weeklyReportState.fetchWeeklyReport(
                  province,
                  area,
                  beginDate,
                  endDate,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Loading...',
                          style: GlobalFont.mediumgiantfontR,
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text('Data not available'),
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // child: Column(
                      //   children: [
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Expanded(
                      //           child: Table(
                      //             columnWidths: {
                      //               0: FlexColumnWidth(
                      //                 MediaQuery.of(context).size.width *
                      //                     0.1,
                      //               ),
                      //             },
                      //             children: [
                      //               TableRow(
                      //                 children: [
                      //                   TableCell(
                      //                     child: Container(
                      //                       height: MediaQuery.of(context)
                      //                               .size
                      //                               .height *
                      //                           0.076,
                      //                       alignment: Alignment.center,
                      //                       decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                             color: Colors.black),
                      //                       ),
                      //                       child: Text('Nama Dealer'),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         Expanded(
                      //           flex: 8,
                      //           child: CustomTable(),
                      //         ),
                      //       ],
                      //     ),
                      //     ListView(
                      //       children: snapshot,
                      //     ),
                      //   ],
                      // ),
                      // child: ListView(
                      //   children: snapshot.data!.asMap().entries.map((entry) {
                      //     final ModelWeeklyReport report = entry.value;
                      //
                      //     return Text(report.actName);
                      //   }).toList(),
                      // ),
                      child: Table(
                        columnWidths: const {
                          0: FixedColumnWidth(50),
                          1: FixedColumnWidth(150),
                          2: FixedColumnWidth(100),
                          3: FixedColumnWidth(100),
                          4: FixedColumnWidth(100),
                          5: FixedColumnWidth(150),
                          6: FixedColumnWidth(150),
                          7: FixedColumnWidth(200),
                          8: FixedColumnWidth(50),
                          9: FixedColumnWidth(50),
                          10: FixedColumnWidth(50),
                        },
                        border: TableBorder.all(),
                        children: const [
                          TableRow(children: [
                            LabelTable(
                                '', Alignment.center, Colors.red, false, false),
                            LabelTable('NO TELP', Alignment.center, Colors.red,
                                true, true),
                            LabelTable('NAMA', Alignment.center, Colors.red,
                                true, true),
                            LabelTable('TANGGAL', Alignment.center, Colors.red,
                                true, true),
                            LabelTable('PUKUL', Alignment.center, Colors.red,
                                true, true),
                          ]),
                          // for (var i = 0;
                          //     i < GlobalVar.listBrowseBooking.length;
                          //     i++)
                          //   TableRow(
                          //     children: [
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           '${i + 1}',
                          //           Alignment.center,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           '0${GlobalVar.listBrowseBooking[i].uPhoneNo}',
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar.listBrowseBooking[i].uName,
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar.tglFormat.format(
                          //             DateTime.parse(
                          //               GlobalVar.listBrowseBooking[i]
                          //                   .bookDate,
                          //             ),
                          //           ),
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar
                          //               .listBrowseBooking[i].bookTime,
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar.listBrowseBooking[i].unitID,
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar.listBrowseBooking[i].notes,
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: LabelTable(
                          //           GlobalVar.listBrowseBooking[i].status,
                          //           Alignment.topLeft,
                          //           1,
                          //         ),
                          //       ),
                          //       (GlobalVar.listBrowseBooking[i].status ==
                          //               'MENUNGGU KONFIRMASI')
                          //           ? TableCell(
                          //               verticalAlignment:
                          //                   TableCellVerticalAlignment
                          //                       .middle,
                          //               child: IconButton(
                          //                 onPressed: () {
                          //                   notifyService(
                          //                     GlobalVar
                          //                         .listBrowseBooking[i],
                          //                     true,
                          //                   );
                          //                 },
                          //                 icon: const Icon(
                          //                   Icons.check_rounded,
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //             )
                          //           : TableCell(
                          //               verticalAlignment:
                          //                   TableCellVerticalAlignment
                          //                       .middle,
                          //               child: IconButton(
                          //                 onPressed: null,
                          //                 disabledColor: Colors.red,
                          //                 icon: Icon(
                          //                   Icons.check_rounded,
                          //                   color: (GlobalVar
                          //                               .listBrowseBooking[
                          //                                   i]
                          //                               .status ==
                          //                           'TERKONFIRMASI')
                          //                       ? Colors.red
                          //                       : Colors.grey,
                          //                 ),
                          //               ),
                          //             ),
                          //       (GlobalVar.listBrowseBooking[i].status ==
                          //               'MENUNGGU KONFIRMASI')
                          //           ? TableCell(
                          //               verticalAlignment:
                          //                   TableCellVerticalAlignment
                          //                       .middle,
                          //               child: IconButton(
                          //                 onPressed: () {
                          //                   notifyService(
                          //                     GlobalVar
                          //                         .listBrowseBooking[i],
                          //                     false,
                          //                   );
                          //                 },
                          //                 icon: const Icon(
                          //                   Icons.close_rounded,
                          //                   color: Colors.black,
                          //                 ),
                          //               ),
                          //             )
                          //           : TableCell(
                          //               verticalAlignment:
                          //                   TableCellVerticalAlignment
                          //                       .middle,
                          //               child: IconButton(
                          //                 onPressed: null,
                          //                 disabledColor: Colors.red,
                          //                 icon: Icon(
                          //                   Icons.close_rounded,
                          //                   color: (GlobalVar
                          //                               .listBrowseBooking[
                          //                                   i]
                          //                               .status ==
                          //                           'DITOLAK')
                          //                       ? Colors.red
                          //                       : Colors.grey,
                          //                 ),
                          //               ),
                          //             ),
                          //       TableCell(
                          //         verticalAlignment:
                          //             TableCellVerticalAlignment.middle,
                          //         child: IconButton(
                          //           onPressed: () {
                          //             redirectToWhatsAppWeb(
                          //               GlobalVar.listBrowseBooking[i],
                          //             );
                          //           },
                          //           icon: Image(
                          //             width: MediaQuery.of(context)
                          //                     .size
                          //                     .width /
                          //                 12,
                          //             height: MediaQuery.of(context)
                          //                     .size
                          //                     .height /
                          //                 12,
                          //             image: const AssetImage(
                          //               'assets/images/whatsapp-icons.png',
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                        ],
                      ),
                    );
                  }
                },
              ),
              // child: ValueListenableBuilder(
              //   valueListenable: filterDataNotifier,
              //   builder: (context, value, child) {
              //     if (value.isNotEmpty) {
              //       return FutureBuilder(
              //         future: weeklyReportState.fetchWeeklyReport(
              //           province,
              //           area,
              //           beginDate,
              //           endDate,
              //         ),
              //         builder: (context, snapshot) {
              //           if (snapshot.connectionState ==
              //               ConnectionState.waiting) {
              //             return Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 CircularProgressIndicator(),
              //                 SizedBox(
              //                   height:
              //                       MediaQuery.of(context).size.height * 0.01,
              //                 ),
              //                 Text(
              //                   'Loading...',
              //                   style: GlobalFont.mediumgiantfontR,
              //                 ),
              //               ],
              //             );
              //           } else if (snapshot.hasError) {
              //             return Center(
              //               child: Text('Error: ${snapshot.error}'),
              //             );
              //           } else if (snapshot.hasData && snapshot.data!.isEmpty) {
              //             return Center(
              //               child: Text('Data not available'),
              //             );
              //           } else {
              //             return Container(
              //               width: MediaQuery.of(context).size.width,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(20.0),
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                 horizontal:
              //                     MediaQuery.of(context).size.width * 0.02,
              //                 vertical:
              //                     MediaQuery.of(context).size.height * 0.02,
              //               ),
              //               // child: Column(
              //               //   children: [
              //               //     Row(
              //               //       crossAxisAlignment: CrossAxisAlignment.start,
              //               //       children: [
              //               //         Expanded(
              //               //           child: Table(
              //               //             columnWidths: {
              //               //               0: FlexColumnWidth(
              //               //                 MediaQuery.of(context).size.width *
              //               //                     0.1,
              //               //               ),
              //               //             },
              //               //             children: [
              //               //               TableRow(
              //               //                 children: [
              //               //                   TableCell(
              //               //                     child: Container(
              //               //                       height: MediaQuery.of(context)
              //               //                               .size
              //               //                               .height *
              //               //                           0.076,
              //               //                       alignment: Alignment.center,
              //               //                       decoration: BoxDecoration(
              //               //                         border: Border.all(
              //               //                             color: Colors.black),
              //               //                       ),
              //               //                       child: Text('Nama Dealer'),
              //               //                     ),
              //               //                   ),
              //               //                 ],
              //               //               ),
              //               //             ],
              //               //           ),
              //               //         ),
              //               //         Expanded(
              //               //           flex: 8,
              //               //           child: CustomTable(),
              //               //         ),
              //               //       ],
              //               //     ),
              //               //     ListView(
              //               //       children: snapshot,
              //               //     ),
              //               //   ],
              //               // ),
              //               // child: ListView(
              //               //   children: snapshot.data!.asMap().entries.map((entry) {
              //               //     final ModelWeeklyReport report = entry.value;
              //               //
              //               //     return Text(report.actName);
              //               //   }).toList(),
              //               // ),
              //               child: Table(
              //                 columnWidths: const {
              //                   0: FixedColumnWidth(50),
              //                   1: FixedColumnWidth(150),
              //                   2: FixedColumnWidth(100),
              //                   3: FixedColumnWidth(100),
              //                   4: FixedColumnWidth(100),
              //                   5: FixedColumnWidth(150),
              //                   6: FixedColumnWidth(150),
              //                   7: FixedColumnWidth(200),
              //                   8: FixedColumnWidth(50),
              //                   9: FixedColumnWidth(50),
              //                   10: FixedColumnWidth(50),
              //                 },
              //                 border: TableBorder.all(),
              //                 children: const [
              //                   TableRow(children: [
              //                     LabelTable('', Alignment.center, 0),
              //                     LabelTable('NO TELP', Alignment.center, 0),
              //                     LabelTable('NAMA', Alignment.center, 0),
              //                     LabelTable('TANGGAL', Alignment.center, 0),
              //                     LabelTable('PUKUL', Alignment.center, 0),
              //                     LabelTable(
              //                         'JENIS MOTOR', Alignment.center, 0),
              //                     LabelTable('KELUHAN', Alignment.center, 0),
              //                     LabelTable('STATUS', Alignment.center, 0),
              //                     LabelTable('', Alignment.center, 0),
              //                     LabelTable('', Alignment.center, 0),
              //                     LabelTable('', Alignment.center, 0),
              //                   ]),
              //                   // for (var i = 0;
              //                   //     i < GlobalVar.listBrowseBooking.length;
              //                   //     i++)
              //                   //   TableRow(
              //                   //     children: [
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           '${i + 1}',
              //                   //           Alignment.center,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           '0${GlobalVar.listBrowseBooking[i].uPhoneNo}',
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar.listBrowseBooking[i].uName,
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar.tglFormat.format(
              //                   //             DateTime.parse(
              //                   //               GlobalVar.listBrowseBooking[i]
              //                   //                   .bookDate,
              //                   //             ),
              //                   //           ),
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar
              //                   //               .listBrowseBooking[i].bookTime,
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar.listBrowseBooking[i].unitID,
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar.listBrowseBooking[i].notes,
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: LabelTable(
              //                   //           GlobalVar.listBrowseBooking[i].status,
              //                   //           Alignment.topLeft,
              //                   //           1,
              //                   //         ),
              //                   //       ),
              //                   //       (GlobalVar.listBrowseBooking[i].status ==
              //                   //               'MENUNGGU KONFIRMASI')
              //                   //           ? TableCell(
              //                   //               verticalAlignment:
              //                   //                   TableCellVerticalAlignment
              //                   //                       .middle,
              //                   //               child: IconButton(
              //                   //                 onPressed: () {
              //                   //                   notifyService(
              //                   //                     GlobalVar
              //                   //                         .listBrowseBooking[i],
              //                   //                     true,
              //                   //                   );
              //                   //                 },
              //                   //                 icon: const Icon(
              //                   //                   Icons.check_rounded,
              //                   //                   color: Colors.black,
              //                   //                 ),
              //                   //               ),
              //                   //             )
              //                   //           : TableCell(
              //                   //               verticalAlignment:
              //                   //                   TableCellVerticalAlignment
              //                   //                       .middle,
              //                   //               child: IconButton(
              //                   //                 onPressed: null,
              //                   //                 disabledColor: Colors.red,
              //                   //                 icon: Icon(
              //                   //                   Icons.check_rounded,
              //                   //                   color: (GlobalVar
              //                   //                               .listBrowseBooking[
              //                   //                                   i]
              //                   //                               .status ==
              //                   //                           'TERKONFIRMASI')
              //                   //                       ? Colors.red
              //                   //                       : Colors.grey,
              //                   //                 ),
              //                   //               ),
              //                   //             ),
              //                   //       (GlobalVar.listBrowseBooking[i].status ==
              //                   //               'MENUNGGU KONFIRMASI')
              //                   //           ? TableCell(
              //                   //               verticalAlignment:
              //                   //                   TableCellVerticalAlignment
              //                   //                       .middle,
              //                   //               child: IconButton(
              //                   //                 onPressed: () {
              //                   //                   notifyService(
              //                   //                     GlobalVar
              //                   //                         .listBrowseBooking[i],
              //                   //                     false,
              //                   //                   );
              //                   //                 },
              //                   //                 icon: const Icon(
              //                   //                   Icons.close_rounded,
              //                   //                   color: Colors.black,
              //                   //                 ),
              //                   //               ),
              //                   //             )
              //                   //           : TableCell(
              //                   //               verticalAlignment:
              //                   //                   TableCellVerticalAlignment
              //                   //                       .middle,
              //                   //               child: IconButton(
              //                   //                 onPressed: null,
              //                   //                 disabledColor: Colors.red,
              //                   //                 icon: Icon(
              //                   //                   Icons.close_rounded,
              //                   //                   color: (GlobalVar
              //                   //                               .listBrowseBooking[
              //                   //                                   i]
              //                   //                               .status ==
              //                   //                           'DITOLAK')
              //                   //                       ? Colors.red
              //                   //                       : Colors.grey,
              //                   //                 ),
              //                   //               ),
              //                   //             ),
              //                   //       TableCell(
              //                   //         verticalAlignment:
              //                   //             TableCellVerticalAlignment.middle,
              //                   //         child: IconButton(
              //                   //           onPressed: () {
              //                   //             redirectToWhatsAppWeb(
              //                   //               GlobalVar.listBrowseBooking[i],
              //                   //             );
              //                   //           },
              //                   //           icon: Image(
              //                   //             width: MediaQuery.of(context)
              //                   //                     .size
              //                   //                     .width /
              //                   //                 12,
              //                   //             height: MediaQuery.of(context)
              //                   //                     .size
              //                   //                     .height /
              //                   //                 12,
              //                   //             image: const AssetImage(
              //                   //               'assets/images/whatsapp-icons.png',
              //                   //             ),
              //                   //           ),
              //                   //         ),
              //                   //       ),
              //                   //     ],
              //                   //   ),
              //                 ],
              //               ),
              //             );
              //           }
              //         },
              //       );
              //     } else {
              //       return Center(child: Text('Data are not available'));
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
