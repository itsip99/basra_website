// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Activities/manager_activities.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/function.dart';
import 'package:stsj/router/router_const.dart';

class FourContainer extends StatefulWidget {
  FourContainer(this.morningBriefing, this.visitMarket,
      this.recruitmentInterview, this.dailyReport,
      {super.key});

  List<ModelManagerActivities> morningBriefing;
  List<ModelManagerActivities> visitMarket;
  List<ModelManagerActivities> recruitmentInterview;
  List<ModelManagerActivities> dailyReport;

  @override
  State<FourContainer> createState() => _FourContainerState();
}

class _FourContainerState extends State<FourContainer> {
  void configMapData(
    BuildContext context,
    MapState state,
    double lat,
    double lng,
  ) {
    print('Lat: $lat');
    print('Lng: $lng');

    if (lat != 0 && lng != 0) {
      state.setLat(lat);
      state.setLng(lng);

      context.goNamed(RoutesConstant.managerActivitiesInMap);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Coordinate ($lat, $lng)'),
        ),
      );
    }
  }

  void viewImage(String url, {String time = ''}) {
    GlobalFunction.tampilkanDialog(
      context,
      true,
      Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025,
          vertical: MediaQuery.of(context).size.height * 0.025,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image.memory(base64Decode(url)),
              (time != '')
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 2.5,
                      ),
                      margin: EdgeInsets.all(5.0),
                      child: Text(
                        'Pukul $time',
                        style: GlobalFont.bigfontR,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final managerActivitiesState = Provider.of<MapState>(context);

    // height: MediaQuery.of(context).size.height * 0.78,
    return ListView(
      children: widget.morningBriefing.asMap().entries.map((entry) {
        final int index = entry.key;
        final ModelManagerActivities briefing = entry.value;

        // DateTime Pre-Processing for Morning Briefing
        int briefingHour = 0;
        int briefingMinute = 0;
        if (briefing.currentTime != '') {
          briefingHour = int.parse(briefing.currentTime.split(':')[0]);
          briefingMinute = int.parse(briefing.currentTime.split(':')[1]);
        }

        // DateTime Pre-Processing for Visit Market
        int marketHour = 0;
        int marketMinute = 0;
        if (widget.visitMarket[index].currentTime != '') {
          marketHour =
              int.parse(widget.visitMarket[index].currentTime.split(':')[0]);
          marketMinute =
              int.parse(widget.visitMarket[index].currentTime.split(':')[1]);
        }

        // DateTime Pre-Processing for Recruitment & Interview
        int recruitHour = 0;
        int recruitMinute = 0;
        if (widget.recruitmentInterview[index].currentTime != '') {
          recruitHour = int.parse(
              widget.recruitmentInterview[index].currentTime.split(':')[0]);
          recruitMinute = int.parse(
              widget.recruitmentInterview[index].currentTime.split(':')[1]);
        }

        // DateTime Pre-Processing for Daily Report
        int reportHour = 0;
        int reportMinute = 0;
        if (widget.dailyReport[index].currentTime != '') {
          reportHour =
              int.parse(widget.dailyReport[index].currentTime.split(':')[0]);
          reportMinute =
              int.parse(widget.dailyReport[index].currentTime.split(':')[1]);
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.82,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.01,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Note -> title of the page based on template
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cabang',
                      style: GlobalFont.bigfontR,
                    ),
                    Text(
                      briefing.shopName,
                      style: GlobalFont.gigafontRBold,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // ==============================================================
              // ====================== FILTER RESULT =========================
              // ==============================================================
              Row(
                children: [
                  // ===========================================================
                  // =================== MORNING BRIEFING ======================
                  // ===========================================================
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.625,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 25.0,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 15.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // briefing.image != ''
                                //     ? ClipRRect(
                                //         borderRadius:
                                //             BorderRadius.circular(20.0),
                                //         child: Image.memory(
                                //           base64Decode(briefing.image),
                                //         ),
                                //       )
                                //     : SizedBox(),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.of(context).size.height * 0.01,
                                // ),
                                // (briefing.image != '' &&
                                //         briefing.lat != 0 &&
                                //         briefing.lng != 0)
                                //     ? Column(
                                //         children: [
                                //           ElevatedButton(
                                //             onPressed: () => configMapData(
                                //               context,
                                //               managerActivitiesState,
                                //               briefing.lat,
                                //               briefing.lng,
                                //             ),
                                //             child: Text('Open Maps'),
                                //           ),
                                //           SizedBox(
                                //             height: MediaQuery.of(context)
                                //                     .size
                                //                     .height *
                                //                 0.01,
                                //           ),
                                //         ],
                                //       )
                                //     : SizedBox(),
                                Text(
                                  briefing.actDesc != ''
                                      ? briefing.actDesc
                                      : 'Description not available',
                                  style: GlobalFont.bigfontR,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    (briefing.lat != 0 && briefing.lng != 0)
                                        ? Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      configMapData(
                                                    context,
                                                    managerActivitiesState,
                                                    briefing.lat,
                                                    briefing.lng,
                                                  ),
                                                  child: Text('Buka Map'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    (briefing.image != '')
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => viewImage(
                                                    briefing.image,
                                                    time: briefing
                                                                .currentTime !=
                                                            ''
                                                        ? briefing.currentTime
                                                        : '',
                                                  ),
                                                  child: Text('Lihat Gambar'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                // (briefing.image == '' &&
                                //         briefing.lat != 0 &&
                                //         briefing.lng != 0)
                                //     ? Column(
                                //         children: [
                                //           SizedBox(
                                //             height: MediaQuery.of(context)
                                //                     .size
                                //                     .height *
                                //                 0.01,
                                //           ),
                                //           ElevatedButton(
                                //             onPressed: () => configMapData(
                                //               context,
                                //               managerActivitiesState,
                                //               briefing.lat,
                                //               briefing.lng,
                                //             ),
                                //             child: Text('Open Map'),
                                //           ),
                                //         ],
                                //       )
                                //     : SizedBox(),
                                // briefing.image != ''
                                //     ? Container(
                                //         decoration: BoxDecoration(
                                //           border: Border.all(
                                //             color: Colors.grey,
                                //             width: 1.5,
                                //           ),
                                //           borderRadius:
                                //               BorderRadius.circular(15.0),
                                //         ),
                                //         padding: const EdgeInsets.symmetric(
                                //           horizontal: 15.0,
                                //           vertical: 7.5,
                                //         ),
                                //         child: Row(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.spaceBetween,
                                //           children: [
                                //             Text(
                                //               'Bukti Aktivitas',
                                //               style: GlobalFont.bigfontR,
                                //             ),
                                //             InkWell(
                                //               onTap: () => viewImage(
                                //                 briefing.image,
                                //                 time: briefing.currentTime != ''
                                //                     ? briefing.image
                                //                     : '',
                                //               ),
                                //               child: Text(
                                //                 'Lihat',
                                //                 style: GlobalFont
                                //                     .mediumgiantfontRBoldBlue,
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       )
                                //     : SizedBox(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32.5,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            right: MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Morning Briefing',
                                textAlign: TextAlign.center,
                                style: GlobalFont.giantfontRBold,
                              ),
                              (briefing.currentTime != '')
                                  ? (briefingHour == 08 &&
                                          (briefingMinute >= 00 &&
                                              briefingMinute <= 15))
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                          ],
                                        )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===========================================================
                  // ===================== VISIT MARKET ========================
                  // ===========================================================
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.625,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue[200]!,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 25.0,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 15.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.visitMarket[index].actDesc != ''
                                      ? widget.visitMarket[index].actDesc
                                      : 'Description not available',
                                  style: GlobalFont.bigfontR,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (widget.visitMarket[index].lat != 0 &&
                                            widget.visitMarket[index].lng != 0)
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      configMapData(
                                                    context,
                                                    managerActivitiesState,
                                                    widget
                                                        .visitMarket[index].lat,
                                                    widget
                                                        .visitMarket[index].lng,
                                                  ),
                                                  child: Text('Buka Map'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    (widget.visitMarket[index].image != '')
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => viewImage(
                                                    widget.visitMarket[index]
                                                        .image,
                                                    time: widget
                                                                .visitMarket[
                                                                    index]
                                                                .currentTime !=
                                                            ''
                                                        ? widget
                                                            .visitMarket[index]
                                                            .currentTime
                                                        : '',
                                                  ),
                                                  child: Text('Lihat Gambar'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32.5,
                          decoration: BoxDecoration(
                            color: Colors.blue[200]!,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            right: MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Visit Market',
                                textAlign: TextAlign.center,
                                style: GlobalFont.giantfontRBold,
                              ),
                              (widget.visitMarket[index].currentTime != '')
                                  ? (marketHour == 08 &&
                                          (marketMinute >= 00 &&
                                              marketMinute <= 15))
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                          ],
                                        )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===========================================================
                  // ================ RECRUITMENT & INTERVIEW ==================
                  // ===========================================================
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.625,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green[300]!,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 25.0,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 15.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.recruitmentInterview[index].actDesc !=
                                          ''
                                      ? widget
                                          .recruitmentInterview[index].actDesc
                                      : 'Description not available',
                                  style: GlobalFont.bigfontR,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    (widget.recruitmentInterview[index].lat !=
                                                0 &&
                                            widget.recruitmentInterview[index]
                                                    .lng !=
                                                0)
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      configMapData(
                                                    context,
                                                    managerActivitiesState,
                                                    widget
                                                        .recruitmentInterview[
                                                            index]
                                                        .lat,
                                                    widget
                                                        .recruitmentInterview[
                                                            index]
                                                        .lng,
                                                  ),
                                                  child: Text('Buka Map'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    (widget.recruitmentInterview[index].image !=
                                            '')
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => viewImage(
                                                    widget
                                                        .recruitmentInterview[
                                                            index]
                                                        .image,
                                                    time: widget
                                                                .recruitmentInterview[
                                                                    index]
                                                                .currentTime !=
                                                            ''
                                                        ? widget
                                                            .recruitmentInterview[
                                                                index]
                                                            .currentTime
                                                        : '',
                                                  ),
                                                  child: Text('Lihat Gambar'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32.5,
                          decoration: BoxDecoration(
                            color: Colors.green[300]!,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            right: MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Recruitment & Interview',
                                textAlign: TextAlign.center,
                                style: GlobalFont.giantfontRBold,
                              ),
                              (widget.recruitmentInterview[index].currentTime !=
                                      '')
                                  ? (recruitHour == 08 &&
                                          (recruitMinute >= 00 &&
                                              recruitMinute <= 15))
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                          ],
                                        )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ===========================================================
                  // ====================== DAILY REPORT =======================
                  // ===========================================================
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.625,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple[200]!,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 25.0,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.01,
                            right: MediaQuery.of(context).size.width * 0.01,
                            top: 15.0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  widget.dailyReport[index].actDesc != ''
                                      ? widget.dailyReport[index].actDesc
                                      : 'Description not available',
                                  style: GlobalFont.bigfontR,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    (widget.dailyReport[index].lat != 0 &&
                                            widget.dailyReport[index].lng != 0)
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      configMapData(
                                                    context,
                                                    managerActivitiesState,
                                                    widget
                                                        .dailyReport[index].lat,
                                                    widget
                                                        .dailyReport[index].lng,
                                                  ),
                                                  child: Text('Buka Map'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                    (widget.dailyReport[index].image != '')
                                        ? Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => viewImage(
                                                    widget.dailyReport[index]
                                                        .image,
                                                    time: widget
                                                                .dailyReport[
                                                                    index]
                                                                .currentTime !=
                                                            ''
                                                        ? widget
                                                            .dailyReport[index]
                                                            .currentTime
                                                        : '',
                                                  ),
                                                  child: Text('Lihat Gambar'),
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 32.5,
                          decoration: BoxDecoration(
                            color: Colors.purple[200],
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.025,
                            right: MediaQuery.of(context).size.width * 0.025,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Daily Report',
                                textAlign: TextAlign.center,
                                style: GlobalFont.giantfontRBold,
                              ),
                              (widget.dailyReport[index].currentTime != '')
                                  ? (reportHour == 08 &&
                                          (reportMinute >= 00 &&
                                              reportMinute <= 15))
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Icon(
                                              Icons.warning_rounded,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                          ],
                                        )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
