import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:stsj/core/controller/MotorcyleHistoryService_controller.dart';
import 'package:stsj/core/views/Services/MotorcyleHistory/component/WMotorHistoryInput.dart';

//import 'package:google_ml_kit/google_ml_kit.dart';

class MotorCycleHistoryPages extends StatefulWidget {
  bool loadawal = false;
  static String chasistext = "";
  static String enginetext = "";
  static String NamaBarang = "";
  static String NamaWarna = "";
  static String Tahun = "";
  MotorCycleHistoryPages();
  @override
  State<MotorCycleHistoryPages> createState() => _MotorCycleHistoryState();
}

class _MotorCycleHistoryState extends State<MotorCycleHistoryPages> {
  String NamaUser = "";
  String Password = "";
  String NamaVersi = "";
  String NoRangka = "";
  String NoMesin = "";
  bool isloading = false;
  bool loadawal = false;
  _MotorCycleHistoryState();

  void setnorangka(value) {
    NoRangka = value;
  }

  void setnomesin(value) {
    NoMesin = value;
  }

  void loadhistory(String NOKA) async {
    if (NOKA != "") {
      print("substring : ${NOKA.substring(0, 2)}");
      if (NOKA.substring(0, 2) == "MH") {
        NoRangka = NOKA;
        NoMesin = "";
      } else {
        NoRangka = "";
        NoMesin = NOKA;
      }
      //NoRangka = NOKA;
    }
    setState(() {
      isloading = true;
    });
    print("masuk b : ${NoRangka}");
    await MotorCyleService.fetchdatamotorcyclehistory(NoRangka, NoMesin)
        .then((value) {
      setState(() {
        isloading = false;
      });
    });
    print("masuk load tipe");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // await filterapiarea.filterarea(
            //     context, NamaUser, PasswordUser, NamaVersi);
            // setState(() {
            //   updateData();
            // });
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.camera,
            color: Colors.black,
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,

              // // Status bar brightness (optional)
              //statusBarIconBrightness:
              //Brightness.dark, // For Android (dark icons)
              //statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text(
              "MOTORCYCLE HISTORY",
              style: TextStyle(fontFamily: "fontdashboard"),
            ),
            backgroundColor: Colors.blueAccent),
        //drawer: DrawerWidget(NamaUser, Password, NamaVersi),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.amberAccent,
                  strokeWidth: 10,
                ),
              )
            : Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01,
                  // left: MediaQuery.of(context).size.height * 0.01,
                  // bottom: MediaQuery.of(context).size.height * 0.02,
                ),
                child: ListView(children: [
                  WMotorHistoryIbput(
                      inputan: NoRangka,
                      label: 'No Rangka',
                      icon: Icons.search,
                      handle: setnorangka),
                  //INPUT PASS
                  WMotorHistoryIbput(
                      inputan: NoMesin,
                      label: 'No Mesin',
                      icon: Icons.engineering,
                      handle: setnomesin),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      child: ElevatedButton(
                          child: const Text(
                            'CARI',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(),
                          onPressed: () async {
                            loadawal = false;
                            loadhistory('');
                          })),

                  loadawal == false
                      ? MotorCyleService.tidakadadata == false
                          ? Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 10.0),
                              child: Card(
                                elevation: 0,
                                //color: const Color(0xFFc7e4ff).withOpacity(1),
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(15),
                                //     side: BorderSide(
                                //         color: Colors.black,
                                //         width: 0.2,
                                //         style: BorderStyle.solid)),
                                //clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              "No Rangka",
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              MotorCycleHistoryPages.chasistext,
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              "No Mesin",
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              MotorCycleHistoryPages.enginetext,
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              "Nama Motor",
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              MotorCycleHistoryPages.NamaBarang,
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              "Nama Warna",
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              MotorCycleHistoryPages.NamaWarna,
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              "Tahun",
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                            padding: EdgeInsets.fromLTRB(
                                                5, 10, 0, 0),
                                            child: Text(
                                              MotorCycleHistoryPages.Tahun,
                                              style: TextStyle(
                                                  fontFamily: "fontdashboard",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.left,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Center(
                              child: new Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      MediaQuery.of(context).size.height * 0.1,
                                      0,
                                      0),
                                  child: Text(
                                    "DATA TIDAK DITEMUKAN",
                                    style: TextStyle(
                                        fontFamily: "fontdashboard",
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                  )),
                            )
                      : new Container(),
                  ...(MotorCyleService.listdatamotorhistorydetail.map((e) {
                    if (loadawal == true) {
                      return Container();
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10.0),
                        child: Card(
                          color: const Color(0xFFc7e4ff).withOpacity(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(
                                  color: Colors.black,
                                  width: 0.2,
                                  style: BorderStyle.solid)),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    e.bsname,
                                    style: TextStyle(
                                        fontFamily: "fontdashboard",
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                      child: Text(
                                        e.transdate,
                                        style: TextStyle(
                                            fontFamily: "fontdashboard",
                                            fontSize: 14,
                                            color: Colors.black),
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                      child: Text(
                                        e.transno,
                                        style: TextStyle(
                                            fontFamily: "fontdashboard",
                                            fontSize: 13,
                                            color: Colors.black),
                                        textAlign: TextAlign.right,
                                      )),
                                ],
                              ),
                              Divider(
                                thickness: 0.3,
                                color: Colors.black,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: Text(
                                    e.trans.toUpperCase(),
                                    style: TextStyle(
                                        fontFamily: "fontdashboard",
                                        fontSize: 20,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }
                  }).toList())
                ]),
              ));
  }
}
