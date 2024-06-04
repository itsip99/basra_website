// ignore_for_file: file_names

import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelCategoryTotal.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbypage1.dart';

import 'package:stsj/core/views/Sales_Dashboard/subpages/STUpages1_pages/listSTU_mainpages.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

class Dates {
  static var prevMonth = DateTime.now().month - 1;
  static var secondprevMonth = DateTime.now().month - 2;
  static var MonthNow = DateTime.now().month;
  static var DayNow = DateTime.now().day;
  static var YearNow = DateTime.now().year;
  static var yearbelow = DateTime.now().year - 5;
  static var yearmotor = DateTime.now().year - 6;
  static var nextyear = DateTime.now().year + 1;
  static var Yeartahunlalu = DateTime.now().year - 1;
  static var Yearduatahunlalu = DateTime.now().year - 2;
  static var Yeartigatahunlalu = DateTime.now().year - 3;
  static var Yearempattahunlalu = DateTime.now().year - 4;
}

class STUbyPages1 {
  static var dayNow = DateTime.now().day;
  static String kodeBarangPart = "";
  static var monthNow = DateTime.now().month;
  static String namaBarangPart = "";

  static double sUMVSLY = 0.0;
  static double sumQty1 = 0;
  static double sumQty1Area = 0;
  static double sumQty1Kredit = 0;
  static double sumQty1Leasing = 0;
  static double sumQty2 = 0;
  static double sumQty2Area = 0;
  static double sumQty2Kredit = 0;
  static double sumQty2Leasing = 0;
  static double sumQty3 = 0;
  static double sumQty3Area = 0;
  static double sumQty3Kredit = 0;
  static double sumQty3Leasing = 0;
  static double sumQtyLY = 0;
  static double sumQtyLYArea = 0;
  static double sumQtyLYKredit = 0;
  static double sumQtyLYLeasing = 0;
  static double sumTarget = 0;
  static double sumVSLM = 0.00;

  static String urlGambarVZLM = "";
  static String urlGambarVZLMPersentase = "";
  static String urlGambarVZLMPersentaseKredit = "";
  static String urlGambarVZLY = "";
  static String urlGambarVZLYPersentase = "";
  static String urlGambarVZLYPersentaseKredit = "";

  static var yearNow = DateTime.now().year;
  static var yeartahunlalu = DateTime.now().year - 1;

  static String bulan = "";

  static List<int> listTotalQty1 = [];
  static List<int> listTotalQty2 = [];
  static List<int> listTotalQty3 = [];
  static List<DataDashboardTipe> listdataCategory = [];

  static var nextyear = DateTime.now().year + 1;
  static var prevMonth = DateTime.now().month - 1;
  static var secondprevMonth = DateTime.now().month - 2;
  static var yearbelow = DateTime.now().year - 5;
  static var yearmotor = DateTime.now().year - 6;

  // Controller area

  // static Future<List<DataDashBoard>> fetchData(
  //     String kode,
  //     List<int> tanggalFilter,
  //     List<String> areaFilter,
  //     String bulanFilter,
  //     String tahunFilter) async {
  //   String tanggal = "";
  //   String branch = "";

  //   List<DataDashBoard> listdata = [];

  //   var tahunmotorheaderapi = "";
  //   var tanggalapi = "";

  //   sumQty1 = 0;
  //   sumQty2 = 0;
  //   sumQty3 = 0;
  //   sumVSLM = 0;
  //   sumQtyLY = 0;
  //   sUMVSLY = 0;
  //   sumQty1Kredit = 0;
  //   sumQty2Kredit = 0;
  //   sumQty3Kredit = 0;
  //   sumTarget = 0;

  //   for (var i = 1; i <= Dates.DayNow; i++) {
  //     tanggalapi += '$i,';
  //   }

  //   // print(tanggalapi);

  //   for (var i = 0; i <= 6; i++) {
  //     if (i == 0) {
  //       tahunmotorheaderapi += "''BELOW ${Dates.yearbelow}'',";
  //     } else if (i == 1) {
  //       tahunmotorheaderapi += "''${Dates.nextyear}'',";
  //     } else if (i == 2) {
  //       tahunmotorheaderapi += "''${Dates.YearNow}'',";
  //     } else if (i == 3) {
  //       tahunmotorheaderapi += "''${Dates.Yeartahunlalu}'',";
  //     } else if (i == 4) {
  //       tahunmotorheaderapi += "''${Dates.Yearduatahunlalu}'',";
  //     } else if (i == 5) {
  //       tahunmotorheaderapi += "''${Dates.Yeartigatahunlalu}'',";
  //     } else if (i == 6) {
  //       tahunmotorheaderapi += "''${Dates.Yearempattahunlalu}'',";
  //     }
  //   }

  //   for (var i = 0; i <= areaFilter.length - 1; i++) {
  //     branch += "''${areaFilter[i]}'',";
  //   }

  //   bulan = bulanFilter;
  //   String tahun = tahunFilter;

  //   String mktCategory =
  //       "''LPM'',''PP<125CC'',''PP>125CC'',''AT LPM'',''AT STD'',''AT STYLISH'',''AT PREM 125'',''AT PREM 150'',''SPORT STD'',''SPORT PREM''";

  //   String tahunMotor =
  //       "${tahunmotorheaderapi.substring(0, tahunmotorheaderapi.length - 1)}";

  //   String tahunBelow = Dates.yearbelow.toString();

  //   Map<String, String> bodyPost = {
  //     "Jenis": "DBSTUPage1",
  //     'branch': branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
  //     'bulan': bulan,
  //     'tahun': tahun,
  //     'tanggal': tanggalapi.isNotEmpty
  //         ? tanggalapi.substring(0, tanggalapi.length - 1)
  //         : "0",
  //     'mktcategory': mktCategory,
  //     'tahunmotor': tahunMotor,
  //     'tahunbelow': tahunBelow
  //   };

  //   // Convert the map to a JSON string
  //   final String jsonBody = json.encode(bodyPost);

  //   print(jsonBody);

  //   // Set the 'Content-Type' header to 'application/json'
  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //   };

  //   final response = await http
  //       .post(Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
  //           headers: headers, body: jsonBody)
  //       .timeout(const Duration(seconds: 60));

  //   // print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     var jsonDecode = json.decode(response.body);

  //     List<DataDashBoard> list =
  //         await (jsonDecode as Map<String, dynamic>)['Data']
  //             .map<DataDashBoard>((data) => DataDashBoard.fromJson(data))
  //             .toList();

  //     sumQty1 = 0;
  //     sumQty2 = 0;
  //     sumQty3 = 0;
  //     sumVSLM = 0;
  //     sumQtyLY = 0;
  //     sUMVSLY = 0;
  //     sumQty1Kredit = 0;
  //     sumQty2Kredit = 0;
  //     sumQty3Kredit = 0;
  //     sumTarget = 0;

  //     listdata.clear();

  //     for (var i = 0; i < list.length; i++) {
  //       if (list[i].kode != "3") {
  //         if (list[i].kode == kode) {
  //           // print(list[i].kode);

  //           listdata.add(list[i]);

  //           sumQty1 += list[i].Qty1;
  //           sumQty2 += list[i].Qty2;
  //           sumQty3 += list[i].Qty3;
  //           sumQtyLY += list[i].LY;
  //           sumTarget += list[i].Target;
  //         }
  //       } else if (list[i].kode == "3") {
  //         if (list[i].kode == kode) {
  //           // print(list[i].kode);
  //           listdata.add(list[i]);
  //           if (list[i].Kategori == "TUNAI" || list[i].Kategori == "KREDIT") {
  //             sumQty1 += list[i].Qty1;
  //             sumQty2 += list[i].Qty2;
  //             sumQty3 += list[i].Qty3;
  //             sumQtyLY += list[i].LY;
  //             sumTarget += list[i].Target;
  //           }
  //           if (list[i].Kategori == "KREDIT") {
  //             sumQtyLYKredit = 0;
  //             sumQty1Kredit += list[i].Qty1;
  //             sumQty2Kredit += list[i].Qty2;
  //             sumQty3Kredit += list[i].Qty3;
  //             sumQtyLYKredit += list[i].LY;
  //           }
  //         }
  //       }
  //     }

  //     sumVSLM = ((sumQty3 / sumQty2) * 100);
  //     sUMVSLY = ((sumQty3 / sumQtyLY) * 100);

  //     // print("sumqty 1 :" + SumQty1.toString());
  //     // print("sumqty 2 :" + SumQty2.toString());
  //     // print("sumqty 3 :" + SumQty3.toString());

  //     for (var i = 0; i < listdata.length; i++) {
  //       if (((listdata[i].Qty3 / sumQty3) * 100) >
  //           ((listdata[i].Qty2 / sumQty2) * 100)) {
  //         listdata[i].UrlGambarVZLMPersentase = "asset/image/icon-up.png";
  //       } else {
  //         listdata[i].UrlGambarVZLMPersentase = "asset/image/icon-down.png";
  //       }
  //     }

  //     for (var i = 0; i < listdata.length; i++) {
  //       if (((listdata[i].Qty3 / sumQty3) * 100) >
  //           ((listdata[i].LY / sumQtyLY) * 100)) {
  //         listdata[i].UrlGambarVZLYPersentase = "asset/image/icon-up.png";
  //       } else {
  //         listdata[i].UrlGambarVZLYPersentase = "asset/image/icon-down.png";
  //       }
  //     }

  //     if (sumVSLM < 100) {
  //       urlGambarVZLM = "assets/images/icon-down.png";
  //     } else {
  //       urlGambarVZLM = "assets/images/icon-up.png";
  //     }

  //     if (sUMVSLY < 100) {
  //       urlGambarVZLY = "assets/images/icon-down.png";
  //     } else {
  //       urlGambarVZLY = "assets/images/icon-up.png";
  //     }

  //     return listdata;
  //   } else {
  //     print("exception");
  //     //throw Exception('Unexpected error occured!');
  //     throw Exception(Fluttertoast.showToast(
  //         msg:
  //             "Terjadi Kesalahan saat melakukan Fetching data | Error code: ${response.statusCode}", // message
  //         toastLength: Toast.LENGTH_LONG, // length
  //         gravity: ToastGravity.CENTER, // location
  //         timeInSecForIosWeb: 5 // duration
  //         ));
  //   }
  // }

  static Future<List<DataSTUBYKategori>> fetchSTUPages1(
      String kode,
      List<String> areaFilter,
      List<String> tahunMotorFilter,
      List<String> kategoriFilter,
      dynamic selectedDates) async {
    // print(areaFilter);

    String Tanggal = "";
    String Branch = "";

    var tanggalapi = "";
    String tahun = "";
    String MktCategory = "";

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

    String tahunmotorheaderapi = "";

    for (var i = 0; i <= tahunMotorFilter.length - 1; i++) {
      tahunmotorheaderapi += "''${tahunMotorFilter[i]}'',";
    }

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      Branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= kategoriFilter.length - 1; i++) {
      MktCategory += "''${kategoriFilter[i]}'',";
    }

    String TahunBelow = Dates.yearbelow.toString();

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUPage1",
      'branch': Branch.isNotEmpty ? Branch.substring(0, Branch.length - 1) : "",
      'bulan': bulan,
      'tahun': tahun,
      'tanggal': tanggalapi.isNotEmpty
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : "",
      'mktcategory': MktCategory.isNotEmpty
          ? MktCategory.substring(0, MktCategory.length - 1)
          : "",
      'tahunmotor': tahunmotorheaderapi.isNotEmpty
          ? tahunmotorheaderapi.substring(0, tahunmotorheaderapi.length - 1)
          : "",
      'tahunbelow': TahunBelow
    };

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    print(jsonBody);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http
        .post(Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
            headers: headers, body: jsonBody)
        .timeout(const Duration(seconds: 60));

    // print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);

      List<DataSTUBYKategori> listdata = await (jsonDecode
              as Map<String, dynamic>)['Data']
          .map<DataSTUBYKategori>((data) => DataSTUBYKategori.fromJson(data))
          .toList();

      sumQty1 = 0;
      sumQty2 = 0;
      sumQty3 = 0;
      sumVSLM = 0;
      sumQtyLY = 0;
      sUMVSLY = 0;
      sumQty1Kredit = 0;
      sumQty2Kredit = 0;
      sumQty3Kredit = 0;
      sumTarget = 0;

      for (var i = 0; i < listdata.length; i++) {
        if (listdata[i].kode != "3") {
          if (listdata[i].kode == kode) {
            // print(listdata[i].kode);

            // listdatadashboard.add(listdata[i]);

            sumQty1 += listdata[i].Qty1;
            sumQty2 += listdata[i].Qty2;
            sumQty3 += listdata[i].Qty3;
            sumQtyLY += listdata[i].LY;
            sumTarget += listdata[i].Target;
          }
        } else if (listdata[i].kode == "3") {
          if (listdata[i].kode == kode) {
            // print(listdata[i].kode);
            listdata.add(listdata[i]);
            if (listdata[i].Kategori == "TUNAI" ||
                listdata[i].Kategori == "KREDIT") {
              sumQty1 += listdata[i].Qty1;
              sumQty2 += listdata[i].Qty2;
              sumQty3 += listdata[i].Qty3;
              sumQtyLY += listdata[i].LY;
              sumTarget += listdata[i].Target;
            }
            if (listdata[i].Kategori == "KREDIT") {
              sumQtyLYKredit = 0;
              sumQty1Kredit += listdata[i].Qty1;
              sumQty2Kredit += listdata[i].Qty2;
              sumQty3Kredit += listdata[i].Qty3;
              sumQtyLYKredit += listdata[i].LY;
            }
          }
        }
      }

      sumVSLM = ((sumQty3 / sumQty2) * 100);
      sUMVSLY = ((sumQty3 / sumQtyLY) * 100);

      // print("sumqty 1 :" + SumQty1.toString());
      // print("sumqty 2 :" + SumQty2.toString());
      // print("sumqty 3 :" + SumQty3.toString());

      for (var i = 0; i < listdata.length; i++) {
        if (((listdata[i].Qty3 / sumQty3) * 100) >
            ((listdata[i].Qty2 / sumQty2) * 100)) {
          listdata[i].UrlGambarVZLMPersentase = "asset/image/icon-up.png";
        } else {
          listdata[i].UrlGambarVZLMPersentase = "asset/image/icon-down.png";
        }
      }

      for (var i = 0; i < listdata.length; i++) {
        if (((listdata[i].Qty3 / sumQty3) * 100) >
            ((listdata[i].LY / sumQtyLY) * 100)) {
          listdata[i].UrlGambarVZLYPersentase = "asset/image/icon-up.png";
        } else {
          listdata[i].UrlGambarVZLYPersentase = "asset/image/icon-down.png";
        }
      }

      if (sumVSLM < 100) {
        urlGambarVZLM = "assets/images/icon-down.png";
      } else {
        urlGambarVZLM = "assets/images/icon-up.png";
      }

      if (sUMVSLY < 100) {
        urlGambarVZLY = "assets/images/icon-down.png";
      } else {
        urlGambarVZLY = "assets/images/icon-up.png";
      }

      return listdata;
    } else {
      print("exception");
      //throw Exception('Unexpected error occured!');
      throw Exception(Fluttertoast.showToast(
          msg:
              "Terjadi Kesalahan saat melakukan Fetching data | Error code: ${response.statusCode}", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  ///

  // Controler Tipe
}
