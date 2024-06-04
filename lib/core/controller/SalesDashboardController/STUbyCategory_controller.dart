import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart' as intl;

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stsj/core/models/SalesDashboardModel/STUModelCategoryTotal.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbyDaily.dart';
import 'package:stsj/core/service/ReusableService.dart';

import 'package:stsj/core/views/Sales_Dashboard/components/pickerdatarange.dart';

class STUbyCategoryController {
  static List<DataDashboardTipe> listdatatipe = [];
  static List<String> listtipemotor = [];
  static List<String> listnamamotor = [];
  static List jumlahtipemotorqty1 = [];
  static List jumlahtipemotorqty2 = [];
  static List jumlahtipemotorqty3 = [];
  static List jumlahtipemotorqtyly = [];
  static List namatipemotor = [];

  static List<DataCategorytotal> dataCategorytotal = [];
  static Map<String?, List<DataCategorytotal>?> groupbyBigCategory = {};
  static Map<String?, List<DataCategorytotal>?> groupbyCategory = {};

  static int sumQty1 = 0;
  static int sumQty2 = 0;
  static int sumQty3 = 0;
  static double sumLy = 0.00;
  static double vSLM = 0.00;
  static double vSLy = 0.00;

  static double sumQTY1totalCategory = 0;
  static double sumQTY2totalCategory = 0;
  static double sumQTY3totalCategory = 0;
  static double sumVSLMtotalCategory = 0;
  static double sumLYtotalCategory = 0;
  static double sumVSLYtotalCategory = 0;

  static var dayNow = DateTime.now().day;
  static var monthNow = DateTime.now().month;
  static var yearNow = DateTime.now().year;

  static String bulan = "";

  static Map<String, List<DataCategorytotal>> groupedCategoryTotal = {};

  static Future<List<DataDashboardTipe>> fetchDataCategoryTotal(
    List<String> areaFilter,
    List<String> kabupatenFilter,
    List<String> groupNameFilter,
    List<String> mktKategoriFilter,
    List<String> tahunMotor,
    dynamic selectedDates,
  ) async {
    var tanggalapi = "";

    String tanggal = "";
    String tahun = "";

    String kabupaten = "";
    String branch = "";
    String mktCategory = "";
    String groupName = "";

    var g = intl.NumberFormat("#.##", "en_US");

    if (selectedDates is List<PickerDateRange>) {
      List<PickerDateRange> dateRanges = selectedDates;

      for (PickerDateRange dateRange in dateRanges) {
        DateTime? startDate = dateRange.startDate;
        DateTime? endDate = dateRange.endDate;

        int startDay =
            startDate?.day ?? dayNow; // Mengambil tanggal awal atau 0 jika null
        int endDay = endDate?.day ?? dayNow;

        for (int day = startDay; day <= endDay; day++) {
          tanggalapi += "$day,";
        }
        bulan = "${startDate?.month}" ?? "${monthNow}";
        tahun = "${startDate?.year}" ?? "${yearNow}";
      }
    } else {
      List<int> hariList = selectedDates['hari'];

      bulan = "${selectedDates['bulan']}";
      tahun = "${selectedDates['tahun']}";

      for (var tanggal in hariList) {
        tanggalapi += "$tanggal,";
      }
    }

    if (selectedDates == null) {
      for (int day = dayNow; dayNow <= dayNow; day++) {
        tanggalapi += "$day,";
      }
      bulan = "${monthNow}";
      tahun = "${yearNow}";
    }

    for (var i = 0; i <= kabupatenFilter.length - 1; i++) {
      kabupaten += "''${kabupatenFilter[i]}'',";
    }

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= mktKategoriFilter.length - 1; i++) {
      mktCategory += "''${mktKategoriFilter[i]}'',";
    }

    for (var i = 0; i <= groupNameFilter.length - 1; i++) {
      groupName += "''${groupNameFilter[i]}'',";
    }

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUByCategoryTotal",
      "Branch": branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.isNotEmpty
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : "",
      "Kabupaten": kabupaten.isNotEmpty
          ? kabupaten.substring(0, kabupaten.length - 1)
          : "",
      "GroupName": groupName.isNotEmpty
          ? groupName.substring(0, groupName.length - 1)
          : "",
      "TahunMotor":
          "''BELOW 2018'',''2024'',''2023'',''2022'',''2021'',''2020'',''2019''",
      'TahunBelow': "2018",
    };

    print(bodyPost);

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    // print(jsonBody);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    List<DataCategorytotal> uniqueList = [];

    final response = await http
        .post(Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
            body: jsonBody, headers: headers)
        .timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // print(response.body);
      var jsonDecode = json.decode(response.body);

      List<DataCategorytotal> listCategory = (jsonDecode
              as Map<String, dynamic>)['Data']
          .map<DataCategorytotal>((data) => DataCategorytotal.fromJson(data))
          .toList();

      print(listCategory);

      //clear list agar tidak terjadi duplikat saat fetching lagi
      uniqueList.clear();
      STUbyCategoryController.listtipemotor.clear();

      listdatatipe.clear();
      namatipemotor.clear();
      jumlahtipemotorqty1.clear();
      jumlahtipemotorqty2.clear();
      jumlahtipemotorqty3.clear();
      jumlahtipemotorqtyly.clear();

      STUbyCategoryController.sumQTY1totalCategory = 0;
      STUbyCategoryController.sumQTY2totalCategory = 0;
      STUbyCategoryController.sumQTY3totalCategory = 0;
      STUbyCategoryController.sumLYtotalCategory = 0;
      STUbyCategoryController.sumVSLYtotalCategory = 0;

      // grand Total
      for (int i = 0; i < listCategory.length; i++) {
        for (int j = i + 1; j < listCategory.length; j++) {
          if (listCategory[i].itemName == listCategory[j].itemName) {
            uniqueList.add(listCategory[i]);

            STUbyCategoryController.sumQTY1totalCategory +=
                listCategory[i].qty1 ?? 0;
            STUbyCategoryController.sumQTY2totalCategory +=
                listCategory[i].qty2 ?? 0;
            STUbyCategoryController.sumQTY3totalCategory +=
                listCategory[i].qty3 ?? 0;
            STUbyCategoryController.sumLYtotalCategory +=
                listCategory[i].lY ?? 0;
            STUbyCategoryController.sumVSLMtotalCategory +=
                listCategory[i].vSLM ?? 0;
            STUbyCategoryController.sumVSLYtotalCategory +=
                listCategory[i].vSLY ?? 0;
          }
        }
      }

      print(uniqueList);

      // buat array baru

      for (var i = 0; i < uniqueList.length; i++) {
        if (i == 0) {
          STUbyCategoryController.listtipemotor
              .add(uniqueList[i].category.toString());
          jumlahtipemotorqty1.add(0);
          jumlahtipemotorqty2.add(0);
          jumlahtipemotorqty3.add(0);
          jumlahtipemotorqtyly.add(0);
        } else {
          if (uniqueList[i].category != uniqueList[i - 1].category) {
            STUbyCategoryController.listtipemotor
                .add(uniqueList[i].category.toString());
            jumlahtipemotorqty1.add(0);
            jumlahtipemotorqty2.add(0);
            jumlahtipemotorqty3.add(0);
            jumlahtipemotorqtyly.add(0);
          }
        }
      }

      for (var i = 0; i < uniqueList.length; i++) {
        for (var j = 0; j < STUbyCategoryController.listtipemotor.length; j++) {
          if (uniqueList[i].category ==
              STUbyCategoryController.listtipemotor[j]) {
            namatipemotor.add({
              "territori": STUbyCategoryController.listtipemotor[j],
              "Qty1": uniqueList[i].qty1,
              "Qty2": uniqueList[i].qty2,
              "Qty3": uniqueList[i].qty3,
              "QtyLY": uniqueList[i].lY,
            });

            //hitung per sub total
            jumlahtipemotorqty1[j] += namatipemotor[i]["Qty1"];
            jumlahtipemotorqty2[j] += namatipemotor[i]["Qty2"];
            jumlahtipemotorqty3[j] += namatipemotor[i]["Qty3"];
            jumlahtipemotorqtyly[j] += namatipemotor[i]["QtyLY"];
          }
        }
      }

      print(namatipemotor);

      List<DataCategorytotal> DetailMotorGroup = [];

      for (var i = 0; i < STUbyCategoryController.listtipemotor.length; i++) {
        print(DetailMotorGroup);

        // String category = STUbyCategoryController.listtipemotor[i].toString();

        // for (var unique in uniqueList) {
        //   if (unique.category!.contains(category)) {
        //     DetailMotorGroup.add(unique);
        //   }
        // }

        STUbyCategoryController.listdatatipe.add(DataDashboardTipe(
            urutan: "",
            category: STUbyCategoryController.listtipemotor[i],
            bigcategory: "",
            itemname: "",
            Qty1: jumlahtipemotorqty1[i],
            Qty2: jumlahtipemotorqty2[i],
            Qty3: jumlahtipemotorqty3[i],
            VSLM: ServiceReusable.parseAndHandleNaNPercent(
                (jumlahtipemotorqty3[i] / jumlahtipemotorqty2[i]) * 100),
            LY: jumlahtipemotorqtyly[i],
            VSLY: ServiceReusable.parseAndHandleNaNPercent(
                (jumlahtipemotorqty3[i] / jumlahtipemotorqtyly[i]) * 100),
            UrlGambarVZLM: jumlahtipemotorqty3[i] == 0 ||
                    jumlahtipemotorqty2[i] == 0
                ? "assets/images/icon-down.png"
                : ((jumlahtipemotorqty3[i] / jumlahtipemotorqty2[i]) * 100) >=
                        100
                    ? "assets/images/icon-up.png"
                    : "assets/images/icon-down.png",
            UrlGambarVZLY: jumlahtipemotorqty3[i] == 0 ||
                    jumlahtipemotorqtyly[i] == 0
                ? "assets/images/icon-down.png"
                : ((jumlahtipemotorqty3[i] / jumlahtipemotorqtyly[i]) * 100) >=
                        100
                    ? "assets/images/icon-up.png"
                    : "assets/images/icon-down.png",
            detail: uniqueList
                .where((element) =>
                    element.category ==
                    STUbyCategoryController.listtipemotor[i].toString())
                .toList()));

        // sumQty1 += STUbyCategoryController.listdatatipe[i].Qty1!;
        // sumQty2 += STUbyCategoryController.listdatatipe[i].Qty2!;
        // sumQty3 += STUbyCategoryController.listdatatipe[i].Qty3!;
        // sumLy += STUbyCategoryController.listdatatipe[i].LY!;
      }

      print(STUbyCategoryController.listdatatipe);

      // print(uniqueList);

      return listdatatipe;
    } else {
      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  static void fetchGroupbyBigArea(List<DataCategorytotal> listCategory) {
    groupbyCategory = groupBy(listCategory, (m) => m.category);
  }

  static Future<List<STUbyDate>> fetchDataSTUbyDate(
    List<String> areaFilter,
    List<String> kabupatenFilter,
    List<String> groupNameFilter,
    List<String> mktKategoriFilter,
    List<String> tipeFilter,
    List<String> tahunMotorFilter,
  ) async {
    String kabupaten = "";
    String branch = "";
    String mktCategory = "";
    String groupName = "";
    String tipe = "";
    String tahunMotor = "";

    for (var i = 0; i <= tahunMotorFilter.length - 1; i++) {
      tahunMotor += "''${tahunMotorFilter[i]}'',";
    }

    for (var i = 0; i <= tipeFilter.length - 1; i++) {
      tipe += "''${tipeFilter[i]}'',";
    }

    for (var i = 0; i <= kabupatenFilter.length - 1; i++) {
      kabupaten += "''${kabupatenFilter[i]}'',";
    }

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= mktKategoriFilter.length - 1; i++) {
      mktCategory += "''${mktKategoriFilter[i]}'',";
    }

    for (var i = 0; i <= groupNameFilter.length - 1; i++) {
      groupName += "''${groupNameFilter[i]}'',";
    }

    String bulan = "${DateTime.now().month}";
    String tahun = "${DateTime.now().year}";

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUByDate",
      "Branch": branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
      'Bulan': bulan,
      'Tahun': tahun,
      'MktCategory': mktCategory.isNotEmpty
          ? mktCategory.substring(0, mktCategory.length - 1)
          : "",
      "TahunMotor": tahunMotor.isNotEmpty
          ? tahunMotor.substring(0, tahunMotor.length - 1)
          : "",
      'TahunBelow': "2018",
      "Kabupaten": kabupaten.isNotEmpty
          ? kabupaten.substring(0, kabupaten.length - 1)
          : "",
      "GroupName": groupName.isNotEmpty
          ? groupName.substring(0, groupName.length - 1)
          : "",
      "Tipe": tipe.isNotEmpty ? tipe.substring(0, tipe.length - 1) : "",
    };

    print(bodyPost);

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    // print(jsonBody);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http
        .post(Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
            body: jsonBody, headers: headers)
        .timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      // print(response.body);
      var jsonDecode = json.decode(response.body);

      List<STUbyDate> listAPIbydate =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<STUbyDate>((data) => STUbyDate.fromJson(data))
              .toList();

      List<STUbyDate> listCategory = [];

      listCategory.clear();

      for (int i = 0; i < listAPIbydate.length; i++) {
        for (int j = i + 1; j < listAPIbydate.length; j++) {
          if (listAPIbydate[i].hari == listAPIbydate[j].hari) {
            listCategory.add(listAPIbydate[i]);
          }
        }
      }

      return listCategory;
    } else {
      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }
}
