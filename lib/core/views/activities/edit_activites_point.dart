// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/widget/activities_point_table.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/global/widget/area_dropdown.dart';
import 'package:stsj/global/widget/province_dropdown.dart';
import 'package:stsj/router/router_const.dart';

class EditActivitiesPoint extends StatefulWidget {
  const EditActivitiesPoint({super.key});

  @override
  State<EditActivitiesPoint> createState() => _EditActivitiesPointState();
}

class _EditActivitiesPointState extends State<EditActivitiesPoint> {
  bool isOpen = false;

  String province = '';
  String area = '';
  String date = '';

  // Value Listener
  ValueNotifier<String> dateNotifier = ValueNotifier('');
  ValueNotifier<List<String>> filterDataNotifier = ValueNotifier([]);

  // Set Province (same as Area as the placeholder of the UI)
  void setProvince(String value) {
    setState(() {
      province = value;
    });
  }

  // Set Area (same as Wilayah as the placeholder of the UI)
  void setArea(String value) {
    area = value;
  }

  // Set Date
  void setDate(String value) {
    setState(() {
      date = value;
    });
  }

  // Date Function
  void setDateByGoogle(
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
      lastDate: DateTime(DateTime.now().year + 1, 1, 0),
      selectableDayPredicate: (DateTime day) {
        if (day.weekday == DateTime.sunday) {
          return false;
        }

        return true;
      },
    );

    if (picked != null && picked != DateTime.parse(tgl)) {
      tgl = picked.toString().substring(0, 10);
      setDate(tgl);
    } else {
      // Nothing happened
    }
  }

  // Get Data from Filter for further data processing
  void getFilterData(
    BuildContext context,
    MapState state,
  ) {
    setState(() {
      state.provinceNotifier.value = province;
      state.areaNotifier.value = area;

      if (date == '') {
        setDate(
          DateTime.now()
              .subtract(Duration(days: 7))
              .toString()
              .substring(0, 10),
        );
        dateNotifier.value = date;
      } else {
        dateNotifier.value = date;
      }
    });
  }

  void modifyPoint(
    BuildContext context,
    MapState state,
  ) async {
    // for (var values in state.activitiesPointList) {
    //   for (var value in values.morningBriefing) {
    //     print('Morning Briefing');
    //     print('Point 1: ${value.point1}');
    //     print('Point 2: ${value.point2}');
    //     print('Point 3: ${value.point3}');
    //   }
    //
    //   for (var value in values.visitMarket) {
    //     print('Visit Market');
    //     print('Point 1: ${value.point1}');
    //     print('Point 2: ${value.point2}');
    //     print('Point 3: ${value.point3}');
    //   }
    //
    //   for (var value in values.recruitmentInterview) {
    //     print('Recruitment & Interview Salesman');
    //     print('Point 1: ${value.point1}');
    //     print('Point 2: ${value.point2}');
    //     print('Point 3: ${value.point3}');
    //   }
    //
    //   for (var value in values.dailyReport) {
    //     print('Daily Report');
    //     print('Point 1: ${value.point1}');
    //     print('Point 2: ${value.point2}');
    //     print('Point 3: ${value.point3}');
    //   }
    //
    //   break;
    // }

    final prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('UserID')!;

    state.modifyPoint.clear();

    for (var values in state.activitiesPointList) {
      for (var value in values.morningBriefing) {
        state.modifyPoint.add(
          {
            "EmployeeID": value.employeeId,
            "Branch": value.branch,
            "Shop": value.shopId,
            "CurrentDate": value.date,
            "ActivityID": value.actId,
            "Point1": value.point1,
            "Point2": value.point2,
            "Point3": value.point3,
            "UserID": userId,
          },
        );
      }

      for (var value in values.visitMarket) {
        state.modifyPoint.add(
          {
            "EmployeeID": value.employeeId,
            "Branch": value.branch,
            "Shop": value.shopId,
            "CurrentDate": value.date,
            "ActivityID": value.actId,
            "Point1": value.point1,
            "Point2": value.point2,
            "Point3": value.point3,
            "UserID": userId,
          },
        );
      }

      for (var value in values.recruitmentInterview) {
        state.modifyPoint.add(
          {
            "EmployeeID": value.employeeId,
            "Branch": value.branch,
            "Shop": value.shopId,
            "CurrentDate": value.date,
            "ActivityID": value.actId,
            "Point1": value.point1,
            "Point2": value.point2,
            "Point3": value.point3,
            "UserID": userId,
          },
        );
      }

      for (var value in values.dailyReport) {
        state.modifyPoint.add(
          {
            "EmployeeID": value.employeeId,
            "Branch": value.branch,
            "Shop": value.shopId,
            "CurrentDate": value.date,
            "ActivityID": value.actId,
            "Point1": value.point1,
            "Point2": value.point2,
            "Point3": value.point3,
            "UserID": userId,
          },
        );
      }
    }

    if ((await state.fetchModifyPoint(state.modifyPoint))[0].result ==
        'SUKSES') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data has been modified'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data failed to be modified'),
        ),
      );
    }
  }

  void pointCalculation(
    BuildContext context,
    MapState state,
  ) async {
    state.fetchPointCalculation(
      province,
      area,
      date,
    );

    setState(() {
      state.provinceNotifier.value = province;
      state.areaNotifier.value = area;

      if (date == '') {
        setDate(
          DateTime.now()
              .subtract(Duration(days: 7))
              .toString()
              .substring(0, 10),
        );
        dateNotifier.value = date;
      } else {
        dateNotifier.value = date;
      }
    });
  }

  void resetData(
    MapState state,
  ) {
    setState(() {
      province = '';
      area = '';
      date = '';
      dateNotifier.value = '';
      filterDataNotifier.value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final editPointState = Provider.of<MapState>(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          goBack: RoutesConstant.activitiesPoint,
        ),
      ),
      body: Form(
        key: formKey,
        child: Container(
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
                  // Filter text
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

                  // Devider
                  SizedBox(width: 10.0),

                  // Filter's Expand and Collapse Animation
                  AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    curve: editPointState.isFilterOpen
                        ? Curves.easeInOut
                        : Curves.easeIn,
                    child: SizedBox(
                      // Note -> used for slide in and slide out animation
                      // but it didn't work because maybe it's a web based program
                      // width: editPointState.isFilterOpen
                      //     ? MediaQuery.of(context).size.width * 0.5
                      //     : 0.0,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Row(
                        children: [
                          // Area Dropdown
                          Container(
                            width: MediaQuery.of(context).size.width * 0.125,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: ProvinceDropdown(
                              listData: editPointState.provinceList,
                              inputan: province,
                              hint: 'Area',
                              handle: setProvince,
                            ),
                          ),

                          // Devider
                          SizedBox(width: 10.0),

                          // Wilayah Dropdown
                          ValueListenableBuilder(
                            valueListenable: editPointState.provinceNotifier,
                            builder: (context, value, _) {
                              return SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.125,
                                child: FutureBuilder(
                                  future: editPointState.fetchAreas(value),
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
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        child: AreaDropdown(
                                          listData: snapshot.data!,
                                          inputan: area,
                                          hint: 'Wilayah',
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

                          // Devider
                          SizedBox(width: 10.0),

                          // Start Date Picker
                          InkWell(
                            onTap: () {
                              filterDataNotifier.value.clear();

                              setDateByGoogle(
                                context,
                                date,
                              );
                            },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.date_range_rounded),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.003,
                                  ),
                                  Text(
                                    date == ''
                                        ? Format.tanggalFormat(
                                            DateTime.now()
                                                .subtract(Duration(days: 6))
                                                .toString()
                                                .substring(0, 10),
                                          )
                                        : Format.tanggalFormat(date),
                                    style: GlobalFont.mediumgiantfontR,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Devider
                          SizedBox(width: 10.0),

                          // Search Button
                          InkWell(
                            onTap: () {
                              getFilterData(
                                context,
                                editPointState,
                              );

                              filterDataNotifier.value.clear();
                              filterDataNotifier.value
                                  .add(editPointState.provinceNotifier.value);
                              filterDataNotifier.value
                                  .add(editPointState.areaNotifier.value);
                              filterDataNotifier.value.add(dateNotifier.value);
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

                          // Devider
                          SizedBox(width: 10.0),

                          // Modify Button
                          InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                modifyPoint(context, editPointState);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill the form'),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.edit_note_rounded,
                                    size: 25.0,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Save',
                                    style: GlobalFont.mediumgiantfontR,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Devider
                          SizedBox(width: 10.0),

                          // Calculate Button
                          InkWell(
                            onTap: () {
                              pointCalculation(
                                context,
                                editPointState,
                              );

                              filterDataNotifier.value.clear();
                              filterDataNotifier.value
                                  .add(editPointState.provinceNotifier.value);
                              filterDataNotifier.value
                                  .add(editPointState.areaNotifier.value);
                              filterDataNotifier.value.add(dateNotifier.value);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              // child: Text(
                              //   'Calculate',
                              //   style: GlobalFont.mediumgiantfontR,
                              // ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calculate_rounded,
                                    size: 25.0,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    'Calculate',
                                    style: GlobalFont.mediumgiantfontR,
                                  ),
                                ],
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
              // ==================== Edit Points in Table =======================
              // =================================================================
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.82,
                child: ValueListenableBuilder(
                  valueListenable: filterDataNotifier,
                  builder: (context, value, _) {
                    // print('Data notifier: ${filterDataNotifier.value.length}');

                    if (value.isNotEmpty) {
                      // Filter Date are not empty
                      return FutureBuilder(
                        future: editPointState.fetchActivitiesPoint(
                          province,
                          area,
                          date,
                          date,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                      color: Colors.black),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(
                                    'Loading...',
                                    style: GlobalFont.mediumgiantfontR,
                                  ),
                                ],
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (snapshot.hasData &&
                              snapshot.data!.isEmpty) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
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
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              child: ActivitiesPointTable(isModify: true),
                            );
                          }
                        },
                      );
                    } else {
                      // Filter Date are empty
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.02,
                          vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                        // child: Builder(
                        //   builder: (context) {
                        //     WidgetsBinding.instance.addPostFrameCallback((_) {
                        //       ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content: Text(
                        //             'You are in EDIT MODE',
                        //             style: TextStyle(
                        //               fontFamily: 'Rubik',
                        //               fontSize: 15.0,
                        //             ),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //         ),
                        //       );
                        //     });
                        //     return Text('Data not available');
                        //   },
                        // ),
                        child: Text('Data not available'),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
