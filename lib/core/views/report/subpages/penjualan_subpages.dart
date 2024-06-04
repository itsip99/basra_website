// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:stsj/core/controller/ReportDashboardController/ListReport_controller.dart';
import 'package:stsj/core/models/Report/ReportModel.dart';

import 'package:stsj/core/models/Report/ListReport.dart';
import 'package:stsj/core/views/report/report_Mainpages.dart';
import 'package:stsj/core/views/report/subpages/component/customButton.dart';
import 'package:stsj/core/views/report/subpages/component/wDatePicker.dart';

class PenjualanSubPages extends StatefulWidget {
  String category = "";
  String nama = "";
  String pt = "";

  PenjualanSubPages({
    Key? key,
    required this.category,
    required this.nama,
    required this.pt,
  }) : super(key: key);

  @override
  State<PenjualanSubPages> createState() => _PenjualanSubPagesState();
}

class _PenjualanSubPagesState extends State<PenjualanSubPages> {
  final _formKey = GlobalKey<FormState>();

  bool isloadingBranch = false;
  bool isLoadingShop = false;

  static List<ListReport> filelist = [];

  // List Report pembelian
  List<ListReport> listPenjualanReport = [];
  List<String> tranksasi = [
    "SEPEDA MOTOR",
    "SPAREPART ",
    "AKSESORIS",
    "TOOLS",
    'ITEM PROMOSI',
    'POWER PRODUCT',
    'POWER PRODUCT PART',
    'MULTI PURPOSE ENGINE',
    'LAIN-LAIN'
  ];

  String format = "";

  TextEditingController reportController = TextEditingController();

  TextEditingController beginAcc_controller = TextEditingController();
  TextEditingController endAcc_controller = TextEditingController();

  // TextEditingController periode1_controller = TextEditingController();
  // TextEditingController periode2_controller = TextEditingController();
  // TextEditingController periode3_controller = TextEditingController();
  // TextEditingController periode4_controller = TextEditingController();
  // TextEditingController periode5_controller = TextEditingController();
  TextEditingController Filter1_controller = TextEditingController();
  TextEditingController Filter2_controller = TextEditingController();
  TextEditingController Filter3_controller = TextEditingController();
  TextEditingController Filter4_controller = TextEditingController();
  TextEditingController Filter5_controller = TextEditingController();
  TextEditingController Filter6_controller = TextEditingController();

  String reportname = "";
  static String selectedReport = "";

  String selectedBranch = "";
  String selectedShop = "";

  bool selectedPeriode1 = true;

  bool selectedPeriode2 = true;

  bool selectedPeriode3 = true;

  bool selectedPeriode4 = true;

  bool selectedPeriode5 = true;

  bool selectedPeriode6 = true;

  static List<ListShop> listShop = [];
  static List<ListBranch> listBranch = [];

  String tanggalTransaksibegin = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void setTanggaltransaksiBegin(String value) => tanggalTransaksibegin = value;

  String tanggalTransaksiendDate = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);

  void setTanggaltransaksiEnd(String value) => tanggalTransaksiendDate = value;

// Periode 1
  String tanggalPeriode = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void setTanggaltanggalPeriode(String value) => tanggalPeriode = value;

  String tanggalPeriodeEnd = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriodeEnd(String value) => tanggalPeriodeEnd = value;

  // Periode 2
  String tanggalPeriode2 = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode2(String value) => tanggalPeriode2 = value;

  String tanggalPeriodeend2End = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode2end(String value) => tanggalPeriodeend2End = value;

  // Periode 3
  String tanggalPeriode3 = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode3(String value) => tanggalPeriode3 = value;

  String tanggalPeriodeend3End = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode3end(String value) => tanggalPeriodeend3End = value;

  // Periode 4
  String tanggalPeriode4 = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode4(String value) => tanggalPeriode4 = value;

  String tanggalPeriodeend4End = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode4end(String value) => tanggalPeriodeend4End = value;

  // Periode 4
  String tanggalPeriode5 = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode5(String value) => tanggalPeriode5 = value;

  String tanggalPeriodeend5End = DateTime(
          DateTime.now().year, DateTime.now().month - 1, DateTime.now().day)
      .toString()
      .substring(0, 10);
  void settanggalPeriode5end(String value) => tanggalPeriodeend5End = value;

  Future<void> fetchReport() async {
    // print(ReportPages.listReport);

    // Use 'await' to wait for the filtering operation to complete
    for (var i = 0; i < ReportPages.listReport.length; i++) {
      if (ReportPages.listReport[i].category == widget.category) {
        listPenjualanReport.add(ReportPages.listReport[i]);
      }
    }
  }

  Future<void> fetchbranch() async {
    listBranch.clear();

    setState(() {
      isloadingBranch = true;
    });

    await ListReportController.fetchBranch(widget.pt, widget.nama)
        .then((value) {
      listBranch.addAll(value);

      print(listBranch);

      setState(() {
        isloadingBranch = false;
      });
    });
  }

  void fetchShop(String selectedShop) async {
    listShop.clear();

    print(selectedShop);
    print(widget.pt);
    print(widget.nama);

    setState(() {
      isLoadingShop = true;
    });

    await ListReportController.fetchShop(widget.pt, widget.nama, selectedShop)
        .then((value) {
      listShop.addAll(value);

      print(value);
      setState(() {
        isLoadingShop = false;
      });
    });
  }

  void setCheckboxFormat() {
    format = "ExportPdf";
  }

  void fetchdataAwal() {
    // transactionFieldController.text = widget.nama;
    // transactionIDFieldController.text = widget.pt;

    filelist.clear();

    if (listShop.isEmpty) {
      listShop.add(ListShop(bSName: "", bShop: ""));
    }

    selectedReport = listPenjualanReport[0].reportName.toString();

    for (var i = 0; i < listPenjualanReport.length; i++) {
      if (listPenjualanReport[i].reportName! == selectedReport) {
        filelist.add(listPenjualanReport[i]);
      }
    }

    print(filelist);
  }

  Map hasilpost = {
    'PT': null,
    "ReportName": null,
    "UserID": null,
    'Branch': null,
    'Shop': null,
    'BeginDate': null,
    'EndDate': null,
    'TransId': null,
    'BeginDate2': null,
    'EndDate2': null,
    'BeginDate3': null,
    'EndDate3': null,
    'BeginDate4': null,
    'EndDate4': null,
    'BeginDate5': null,
    'EndDate5': null,
    'BeginDate6': null,
    'EndDate6': null,
    'BeginAcc': null,
    'EndAcc': null,
    'DeptID': null,
    'CashBank': null,
    'Filter1': null,
    'Filter2': null,
    'Filter3': null,
    'Filter4': null,
    'Filter5': null,
    'Filter6': null,
  };

  @override
  void initState() {
    super.initState();
    setCheckboxFormat();

    //fetch dulu  report
    fetchReport();

    fetchdataAwal();
    fetchbranch();
  }

  @override
  Widget build(BuildContext context) {
    // String selectedTransaction = "Transaction 1";

    for (var i = 0; i < filelist.length; i++) {
      if (filelist[i].beginDate == 0 && filelist[i].endDate == 0) {
        selectedPeriode1 = false;
      }
      if (filelist[i].beginDate2 == 0 && filelist[i].endDate2 == 0) {
        selectedPeriode2 = false;
      }
      if (filelist[i].beginDate3 == 0 && filelist[i].endDate3 == 0) {
        selectedPeriode3 = false;
      }
      if (filelist[i].beginDate4 == 0 && filelist[i].endDate4 == 0) {
        selectedPeriode4 = false;
      }
      if (filelist[i].beginDate5 == 0 && filelist[i].endDate5 == 0) {
        selectedPeriode5 = false;
      }
      if (filelist[i].beginDate6 == 0 && filelist[i].endDate6 == 0) {
        selectedPeriode6 = false;
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;
    bool screen = screenWidth >= 360;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "PENJUALAN",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...filelist.map(
              (filelist) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: isloadingBranch
                              ? LinearProgressIndicator()
                              : filelist.branch == 1
                                  ? DropdownButtonFormField<String>(
                                      decoration:
                                          InputDecoration(labelText: 'Branch'),
                                      value: listBranch.first.bBranch,
                                      items: listBranch.map((branch) {
                                        return DropdownMenuItem<String>(
                                          value: branch.bBranch,
                                          child: Text(branch.bName.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        print(value);
                                        fetchShop(value!);

                                        selectedBranch = value.toString();

                                        // setState(() {});
                                      })
                                  : DropdownButtonFormField(
                                      decoration:
                                          InputDecoration(labelText: 'BRANCH'),
                                      items: const [],
                                      onChanged: (value) {
                                        setState(() {
                                          // selectedBranch = "$selectedBranch";
                                          selectedBranch = value.toString();
                                        });
                                      },
                                    ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: isLoadingShop
                              ? LinearProgressIndicator()
                              : filelist.shop == 1
                                  ? DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                          labelText: 'Selected Shop'),
                                      value: listShop.first.bSName.toString(),
                                      items: listShop.map((branch) {
                                        return DropdownMenuItem<String>(
                                          value: branch.bSName,
                                          child: Text('${branch.bSName}'),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        print(value);

                                        selectedShop = value.toString();

                                        // fetchShop(value!);
                                      },
                                    )
                                  : DropdownButtonFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Shop'),
                                      items: const [],
                                      onChanged: (value) {
                                        setState(() {
                                          // selectedShop = "$selectedBranch";
                                          selectedShop = value.toString();
                                        });
                                      },
                                    ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 1),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Report'),
                        value: listPenjualanReport.first.reportName,
                        items: listPenjualanReport.map((report) {
                          return DropdownMenuItem(
                            value: report.reportName,
                            child: Text(report.reportName.toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedReport = value!;

                            _PenjualanSubPagesState.filelist.clear();

                            for (var i = 0;
                                i < listPenjualanReport.length;
                                i++) {
                              if (listPenjualanReport[i].reportName! ==
                                  selectedReport) {
                                _PenjualanSubPagesState.filelist
                                    .add(listPenjualanReport[i]);
                              }
                            }

                            // filenameControler.text =
                            //     "${_PembelianPagesState.filelist[0].fileName}";

                            // print(filelist);
                          });
                        },
                      ),
                    ),

                    // Transaksi
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(width: 100, child: Text('Transaksi:')),
                          const SizedBox(width: 10.0),
                          Row(
                            children: [
                              (filelist.beginDate == 1 || filelist.endDate == 1)
                                  ? Container(
                                      width: 30,
                                      child: Checkbox(
                                        value: selectedPeriode1,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedPeriode1 = value!;
                                          });
                                        },
                                      ),
                                    )
                                  : SizedBox(
                                      width: 30,
                                    ),
                              CustomDatetimePicker(tanggalTransaksibegin,
                                  setTanggaltransaksiBegin,
                                  readOnly: (filelist.beginDate == 1 &&
                                          selectedPeriode1)
                                      ? false
                                      : true),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                              tanggalTransaksiendDate, setTanggaltransaksiEnd,
                              readOnly:
                                  (filelist.endDate == 1 && selectedPeriode1)
                                      ? false
                                      : true),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),

                    // periode 2
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(filelist.dateLabel2!.isNotEmpty
                                  ? filelist.dateLabel2.toString()
                                  : 'Periode')),
                          const SizedBox(width: 10.0),
                          (filelist.beginDate2 == 1 || filelist.endDate2 == 1)
                              ? Container(
                                  width: 30,
                                  child: Checkbox(
                                    value: selectedPeriode2,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPeriode2 = value!;

                                        print(value);
                                      });
                                    },
                                  ),
                                )
                              : SizedBox(
                                  width: 30,
                                ),
                          CustomDatetimePicker(
                            tanggalPeriode,
                            setTanggaltanggalPeriode,
                            readOnly:
                                (filelist.beginDate2 == 1 && selectedPeriode2)
                                    ? false
                                    : true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                            tanggalPeriode2,
                            settanggalPeriode2end,
                            readOnly:
                                (filelist.endDate2 == 1 && selectedPeriode2)
                                    ? false
                                    : true,
                          ),
                        ],
                      ),
                    ),

                    // periode 3

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(filelist.dateLabel3!.isNotEmpty
                                  ? filelist.dateLabel3.toString()
                                  : 'Periode')),
                          const SizedBox(width: 10.0),
                          (filelist.beginDate3 == 1 || filelist.endDate3 == 1)
                              ? Container(
                                  width: 30,
                                  child: Checkbox(
                                    value: selectedPeriode3,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPeriode3 = value!;

                                        print(value);
                                      });
                                    },
                                  ),
                                )
                              : SizedBox(
                                  width: 30,
                                ),
                          CustomDatetimePicker(
                            tanggalPeriode3,
                            settanggalPeriode3,
                            readOnly:
                                (filelist.beginDate3 == 1 && selectedPeriode3)
                                    ? false
                                    : true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                            tanggalPeriodeend3End,
                            settanggalPeriode3end,
                            readOnly:
                                (filelist.endDate3 == 1 && selectedPeriode3)
                                    ? false
                                    : true,
                          ),
                        ],
                      ),
                    ),

                    // periode 4
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(filelist.dateLabel4!.isNotEmpty
                                  ? filelist.dateLabel4.toString()
                                  : 'Periode')),
                          const SizedBox(width: 10.0),
                          (filelist.beginDate4 == 1)
                              ? Checkbox(
                                  value: selectedPeriode4,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPeriode4 = value!;
                                    });
                                  },
                                )
                              : SizedBox(
                                  width: 30,
                                ),
                          CustomDatetimePicker(
                            tanggalPeriode4,
                            settanggalPeriode4,
                            readOnly:
                                (filelist.beginDate4 == 1 && selectedPeriode4)
                                    ? false
                                    : true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                            tanggalPeriodeend4End,
                            settanggalPeriode4end,
                            readOnly:
                                (filelist.endDate4 == 1 && selectedPeriode4)
                                    ? false
                                    : true,
                          ),
                        ],
                      ),
                    ),

                    // periode 5
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(filelist.dateLabel5!.isNotEmpty
                                  ? filelist.dateLabel5.toString()
                                  : 'Periode')),
                          const SizedBox(width: 10.0),
                          (filelist.beginDate5 == 1 || filelist.endDate5 == 1)
                              ? Checkbox(
                                  value: selectedPeriode5,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPeriode5 = value!;

                                      print(value);
                                    });
                                  },
                                )
                              : SizedBox(
                                  width: 30,
                                ),
                          CustomDatetimePicker(
                            tanggalPeriode5,
                            settanggalPeriode5,
                            readOnly:
                                (filelist.beginDate5 == 1 && selectedPeriode5)
                                    ? false
                                    : true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                            tanggalPeriodeend5End,
                            settanggalPeriode5end,
                            readOnly:
                                (filelist.endDate5 == 1 && selectedPeriode5)
                                    ? false
                                    : true,
                          ),
                        ],
                      ),
                    ),

                    // periode 6
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: Text(filelist.dateLabel6!.isNotEmpty
                                  ? filelist.dateLabel6.toString()
                                  : 'Periode')),
                          const SizedBox(width: 10.0),
                          (filelist.beginDate6 == 1 || filelist.endDate6 == 1)
                              ? Checkbox(
                                  value: selectedPeriode5,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedPeriode5 = value!;

                                      print(value);
                                    });
                                  },
                                )
                              : SizedBox(
                                  width: 30,
                                ),
                          CustomDatetimePicker(
                            tanggalPeriode5,
                            settanggalPeriode5,
                            readOnly:
                                (filelist.beginDate6 == 1 && selectedPeriode6)
                                    ? false
                                    : true,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomDatetimePicker(
                            tanggalPeriodeend5End,
                            settanggalPeriode5end,
                            readOnly:
                                (filelist.endDate6 == 1 && selectedPeriode6)
                                    ? false
                                    : true,
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'No Akun',
                              enabled: filelist.beginAcc == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: beginAcc_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: '',
                              enabled: filelist.endAcc == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: endAcc_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),

                    filelist.transID == 1
                        ? DropdownButtonFormField<String>(
                            decoration: InputDecoration(labelText: 'Transaksi'),
                            value: tranksasi.first.toString(),
                            items: tranksasi.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text('$item'),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print(value);

                              // fetchShop(value!);
                            },
                          )
                        : DropdownButtonFormField(
                            decoration: InputDecoration(labelText: 'Transaksi'),
                            items: const [],
                            onChanged: (value) {},
                          ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel1!.isEmpty
                                  ? 'Filter1'
                                  : filelist.filterLabel1!,
                              enabled: filelist.filter1 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter1_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel2!.isEmpty
                                  ? 'Filter2'
                                  : filelist.filterLabel2!,
                              enabled: filelist.filter2 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter2_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel3!.isEmpty
                                  ? 'Filter3'
                                  : filelist.filterLabel3!,
                              enabled: filelist.filter3 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter3_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel4!.isEmpty
                                  ? 'Filter4'
                                  : filelist.filterLabel4!,
                              enabled: filelist.filter4 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter4_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel5!.isEmpty
                                  ? 'Filter5'
                                  : filelist.filterLabel5!,
                              enabled: filelist.filter5 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter5_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: filelist.filterLabel6!.isEmpty
                                  ? 'Filter6'
                                  : filelist.filterLabel6!,
                              enabled: filelist.filter6 == 1 ? true : false,
                            ),
                            // readOnly: true,
                            controller: Filter6_controller,
                            initialValue: null,
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ).toList(),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      'PDF',
                    ),
                    value: 'ExportPdf',
                    groupValue: format,
                    onChanged: (newValue) {
                      setState(() {
                        format = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      'Excel',
                    ),
                    value: 'ExportXls',
                    groupValue: format,
                    onChanged: (newValue) {
                      setState(() {
                        format = newValue.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            CustomButton(
              text: 'Lihat',
              onPressed: () {
                String beginDate = "";
                String endDate = "";
                String beginDate2 = "";
                String endDate2 = "";
                String beginDate3 = "";
                String endDate3 = "";
                String beginDate4 = "";
                String endDate4 = "";
                String beginDate5 = "";
                String endDate5 = "";
                String beginDate6 = "";
                String endDate6 = "";

                print(format);

                print(selectedPeriode1);
                print(selectedPeriode2);
                print(selectedPeriode3);
                print(selectedPeriode4);
                print(selectedPeriode5);
                print(selectedPeriode6);

                if (selectedPeriode1) {
                  beginDate = tanggalPeriode;
                  endDate = tanggalPeriodeEnd;

                  // hasilpost['BeginDate'] = beginDate;
                  // hasilpost['EndDate'] = endDate;
                }
                if (selectedPeriode2) {
                  print(tanggalPeriode2);
                  print(tanggalPeriodeend2End);

                  beginDate2 = tanggalPeriode2;
                  endDate2 = tanggalPeriodeend2End;

                  // hasilpost['BeginDate2'] = beginDate2;
                  // hasilpost['EndDate2'] = endDate2;
                }
                if (selectedPeriode3) {
                  print(tanggalPeriode3);
                  print(tanggalPeriodeend3End);

                  beginDate3 = tanggalPeriode3;
                  endDate3 = tanggalPeriodeend3End;

                  //   hasilpost['BeginDate3'] = beginDate3;
                  //   hasilpost['EndDate3'] = endDate3;
                }
                if (selectedPeriode4) {
                  print(tanggalPeriode4);
                  print(tanggalPeriodeend4End);

                  beginDate4 = tanggalPeriode4;
                  endDate4 = tanggalPeriodeend4End;

                  // hasilpost['BeginDate4'] = beginDate4;
                  // hasilpost['EndDate4'] = endDate4;
                }
                if (selectedPeriode5) {
                  print(tanggalPeriode5);
                  print(tanggalPeriodeend5End);

                  beginDate5 = tanggalPeriode5;
                  endDate5 = tanggalPeriodeend5End;

                  // hasilpost['BeginDate5'] = beginDate5;
                  // hasilpost['EndDate5'] = endDate5;
                }

                // set

                hasilpost = {
                  'PT': widget.pt,
                  "ReportName": selectedReport,
                  "UserID": widget.nama,
                  'Branch': selectedBranch,
                  'Shop': selectedShop,
                  'BeginDate': beginDate,
                  'EndDate': endDate,
                  'TransId': "M",
                  'BeginDate2': beginDate2,
                  'EndDate2': endDate,
                  'BeginDate3': beginDate3,
                  'EndDate3': endDate3,
                  'BeginDate4': beginDate4,
                  'EndDate4': endDate4,
                  'BeginDate5': beginDate5,
                  'EndDate5': endDate5,
                  'BeginDate6': beginDate6,
                  'EndDate6': endDate6,
                  'BeginAcc': beginAcc_controller.text,
                  'EndAcc': endAcc_controller.text,
                  'DeptID': '0',
                  'CashBank': '0',
                  'Filter1': Filter1_controller.text,
                  'Filter2': Filter2_controller.text,
                  'Filter3': Filter3_controller.text,
                  'Filter4': Filter4_controller.text,
                  'Filter5': Filter5_controller.text,
                  'Filter6': Filter6_controller.text
                };

                print(hasilpost);

                ListReportController.PostLaporan(hasilpost, format);
                // if (_formKey.currentState!.validate()) {

                // }
              },
            ),
          ],
        ),
      ),
    );
  }
}
