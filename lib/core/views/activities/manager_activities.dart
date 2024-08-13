import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/function.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/global/widget/area_dropdown.dart';
import 'package:stsj/global/widget/four_container.dart';
import 'package:stsj/global/widget/province_dropdown.dart';
import 'package:stsj/router/router_const.dart';

class ManagerActivitiesPage extends StatefulWidget {
  const ManagerActivitiesPage({super.key});

  @override
  State<ManagerActivitiesPage> createState() => _ManagerActivitiesPageState();
}

class _ManagerActivitiesPageState extends State<ManagerActivitiesPage> {
  String province = '';
  String area = '';
  String date = '';
  ValueNotifier<String> dateNotifier = ValueNotifier('');
  ValueNotifier<List<String>> filterDataNotifier = ValueNotifier([]);

  String get getProvince => province;

  String get getArea => area;

  String get getDate => date;

  void setProvince(String value) {
    province = value;
  }

  void setArea(String value) {
    area = value;
  }

  void setDate(String value) {
    setState(() {
      date = value;
    });
  }

  void setDateByGoogle(
    BuildContext context,
    String tgl,
  ) async {
    tgl = tgl == ''
        ? DateTime.now().subtract(Duration(days: 7)).toString().substring(0, 10)
        : tgl;

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: tgl == ''
          ? DateTime.now().subtract(Duration(days: 7))
          : DateTime.parse(tgl),
      firstDate: DateTime(2000),
      lastDate: DateTime(DateTime.now().year + 1, 1, 0),
    );

    if (picked != null && picked != DateTime.parse(tgl)) {
      tgl = picked.toString().substring(0, 10);
      setDate(tgl);
    } else {
      // Nothing happened
    }
  }

  void previewImage(String value) {
    GlobalFunction.tampilkanDialog(
      context,
      true,
      Container(
        height: MediaQuery.of(context).size.height * 0.65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.55,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
              ),
              child: PhotoView(
                maxScale: PhotoViewComputedScale.covered * 2,
                minScale: PhotoViewComputedScale.contained,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                imageProvider: MemoryImage(
                  base64Decode(value),
                ),
              ),
            ),
            Text('Press anywhere to dismiss'),
          ],
        ),
      ),
    );
  }

  void getFilterData(
    BuildContext context,
    MapState managerActivitiesState,
  ) {
    setState(() {
      managerActivitiesState.provinceNotifier.value = province;
      managerActivitiesState.areaNotifier.value = area;

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
    MapState managerActivitiesState,
  ) {
    print('Reset Data');
    setState(() {
      setProvince('');
      area = '';
      date = '';
      managerActivitiesState.provinceNotifier.value = '';
      managerActivitiesState.areaNotifier.value = '';
      dateNotifier.value = '';
      filterDataNotifier.value.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final managerActivityState = Provider.of<MapState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.065,
        ),
        child: CustomAppBar(
          goBack: RoutesConstant.menu,
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
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
            // =================================================================
            // =========================== Filter ==============================
            // =================================================================
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
                  curve: managerActivityState.isFilterOpen
                      ? Curves.easeInOut
                      : Curves.easeIn,
                  child: SizedBox(
                    width: managerActivityState.isFilterOpen
                        ? MediaQuery.of(context).size.width * 0.5
                        : 0.0,
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
                            listData: managerActivityState.provinceList,
                            inputan: province,
                            hint: 'Area',
                            handle: setProvince,
                          ),
                        ),
                        SizedBox(width: 10.0),

                        // Note -> responsive UI without refreshing is not working yet
                        // which will be used for Area Dropdown if it's working
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.125,
                        //   child: ValueListenableBuilder(
                        //     valueListenable:
                        //         managerActivityState.provinceNotifier,
                        //     builder: (context, value, child) {
                        //       print('Province Notifier: $value');
                        //       List<ModelAreas> areaModel =
                        //           managerActivityState.getAreaMap[value]!;
                        //
                        //       for (int i = 0; i < areaModel.length; i++) {
                        //         print(areaModel[i].areaName);
                        //       }
                        //
                        //       if (value == '') {
                        //         return AnimatedContainer(
                        //           duration: const Duration(seconds: 1),
                        //           alignment: Alignment.center,
                        //           decoration: BoxDecoration(
                        //             color: (managerActivityState
                        //                         .provinceList.isNotEmpty &&
                        //                     managerActivityState
                        //                             .provinceList.length >
                        //                         2)
                        //                 ? Colors.grey[400]
                        //                 : Colors.grey,
                        //             borderRadius: BorderRadius.circular(15.0),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal:
                        //                 MediaQuery.of(context).size.width *
                        //                     0.01,
                        //             vertical:
                        //                 MediaQuery.of(context).size.height *
                        //                     0.01,
                        //           ),
                        //           child: AreaDropdown(
                        //             listData: const [],
                        //             inputan: area,
                        //             hint: 'Area',
                        //             handle: setArea,
                        //             disable: true,
                        //           ),
                        //         );
                        //       } else {
                        //         return AnimatedContainer(
                        //           duration: const Duration(seconds: 1),
                        //           alignment: Alignment.center,
                        //           decoration: BoxDecoration(
                        //             color: (managerActivityState
                        //                         .provinceList.isNotEmpty &&
                        //                     managerActivityState
                        //                             .provinceList.length >
                        //                         2)
                        //                 ? Colors.grey[400]
                        //                 : Colors.grey,
                        //             borderRadius: BorderRadius.circular(15.0),
                        //           ),
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal:
                        //                 MediaQuery.of(context).size.width *
                        //                     0.01,
                        //             vertical:
                        //                 MediaQuery.of(context).size.height *
                        //                     0.01,
                        //           ),
                        //           child: AreaDropdown(
                        //             listData: managerActivityState
                        //                     .getAreaMap[value]!.isEmpty
                        //                 ? []
                        //                 : managerActivityState
                        //                     .getAreaMap[value]!,
                        //             inputan: area,
                        //             hint: 'Area',
                        //             handle: setArea,
                        //             disable: (value == province &&
                        //                     managerActivityState
                        //                             .getAreaMap[value]!.length >
                        //                         2)
                        //                 ? false
                        //                 : true,
                        //           ),
                        //         );
                        //       }
                        //     },
                        //   ),
                        // ),

                        ValueListenableBuilder(
                          valueListenable:
                              managerActivityState.provinceNotifier,
                          builder: (context, value, child) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.125,
                              child: FutureBuilder(
                                future: managerActivityState.fetchAreas(value),
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
                        SizedBox(width: 10.0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.date_range_rounded),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.003,
                                ),
                                Text(
                                  date == ''
                                      ? Format.tanggalFormat(
                                          DateTime.now()
                                              .subtract(Duration(days: 7))
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
                        SizedBox(width: 10.0),
                        InkWell(
                          onTap: () {
                            getFilterData(
                              context,
                              managerActivityState,
                            );

                            filterDataNotifier.value.clear();
                            filterDataNotifier.value.add(
                                managerActivityState.provinceNotifier.value);
                            filterDataNotifier.value
                                .add(managerActivityState.areaNotifier.value);
                            filterDataNotifier.value.add(dateNotifier.value);

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
                            resetData(managerActivityState);
                            managerActivityState.setIsReset();
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
                              'Reset',
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
            // ====================== Routes List View =========================
            // =================================================================
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.82,
              child: ValueListenableBuilder(
                valueListenable: filterDataNotifier,
                builder: (context, value, child) {
                  if (value.isNotEmpty) {
                    String filterProvince = value[0];
                    String filterArea = value[1];
                    String filterDate = value[2];

                    return FutureBuilder(
                      future: managerActivityState.fetchManagerActivities(
                        filterProvince,
                        filterArea,
                        filterDate,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.82,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Loading...',
                                  style: GlobalFont.mediumgiantfontR,
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.01,
                            ),
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                          return Center(
                            child: Text('Data not available'),
                          );
                        } else {
                          return FourContainer(
                            snapshot.data![0],
                            snapshot.data![1],
                            snapshot.data![2],
                            snapshot.data![3],
                          );
                        }
                      },
                    );
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.82,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text('Data are not available'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
