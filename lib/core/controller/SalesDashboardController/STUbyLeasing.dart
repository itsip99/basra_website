// ignore: file_names
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stsj/core/models/SalesDashboardModel/STUModelDataLeasingCategoryDP.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelLeasingCategory.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelLeasingDashboardArea.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUbyLeasingGroupCC.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class STUbyLeasingController {
  static int sumQty1 = 0;
  static int sumQty2 = 0;
  static int sumQty3 = 0;
  static double sumLy = 0.00;
  static double vSLM = 0.00;
  static double vSLy = 0.00;

  static int sumQty1RangeUM = 0;
  static int sumQty2RangeUM = 0;
  static int sumQty3RangeUM = 0;
  static double sumLyRangeUM = 0;
  static double vSLMRangeUM = 0.00;
  static double vSLyRangeUM = 0.00;

  static int sumQty1Category = 0;
  static int sumQty2Category = 0;
  static int sumQty3Category = 0;
  static double sumLyCategory = 0.00;
  static double vSLMCategory = 0.00;
  static double vSLyCategory = 0.00;

  static double sUMVSLY = 0.0;
  static double sumQty1Area = 0;
  static double sumQty1Kredit = 0;
  static double sumQty1Leasing = 0;
  static double sumQty2Area = 0;
  static double sumQty2Kredit = 0;
  static double sumQty2Leasing = 0;
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

  static var dayNow = DateTime.now().day;
  static var monthNow = DateTime.now().month;
  static var yearNow = DateTime.now().year;

  static String bulan = "";

  static Future<List<DataDashboardKategoriDP>> fetchDataLeasingDP(
      List<String> areaFilter,
      String mktKategoriFilter,
      String leasingFilter,
      List<String> kabupatenFilter,
      dynamic selectedDates) async {
    String tanggalapi = "";
    String tahun = "";

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
        bulan = "${startDate?.month}";
        tahun = "${startDate?.year}";
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
      bulan = "$monthNow";
      tahun = "$yearNow";
    }

    String branch = "";
    String mktCategory = mktKategoriFilter;
    String kabupaten = "";

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= kabupatenFilter.length - 1; i++) {
      kabupaten += "''${kabupatenFilter[i]}'',";
    }

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUByLeasingDP",
      'Branch': branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.substring(0, tanggalapi.length - 1),
      'Kabupaten': kabupaten.isNotEmpty
          ? kabupaten.substring(0, kabupaten.length - 1)
          : "",
      'Leasing': leasingFilter,
      'MktCategory': mktCategory,
      "MOdeGrid": "1"
    };

    // print(bodyPost);

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    print(jsonBody);

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

      List<DataDashboardKategoriDP> listLeasingDP =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<DataDashboardKategoriDP>(
                  (data) => DataDashboardKategoriDP.fromJson(data))
              .toList();

      sumQty1RangeUM = 0;
      sumQty2RangeUM = 0;
      sumQty3RangeUM = 0;
      vSLMRangeUM = 0;
      vSLyRangeUM = 0;
      sumLyRangeUM = 0;

      for (var i = 0; i < listLeasingDP.length; i++) {
        sumQty1RangeUM += listLeasingDP[i].qty1;
        sumQty2RangeUM += listLeasingDP[i].qty2;
        sumQty3RangeUM += listLeasingDP[i].qty3;
        vSLMRangeUM += listLeasingDP[i].vSLM;
        vSLyRangeUM += listLeasingDP[i].vSLY;
        sumLyRangeUM += listLeasingDP[i].lY;
      }

      return listLeasingDP;
    } else {
      print("b");
      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  static Future<List<DataLeasingCategory>> fetchDataLeasingCategory(
    List<String> areaFilter,
    List<String> mktKategoriFilter,
    String leasingFilter,
    List<String> kabupatenFilter,
    dynamic selectedDates,
  ) async {
    var tanggalapi = "";

    String tanggal = "";
    String tahun = "";

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

    String branch = "";
    String mktCategory = "";
    String kabupaten = "";

    for (var i = 0; i <= mktKategoriFilter.length - 1; i++) {
      mktCategory += "''${mktKategoriFilter[i]}'',";
    }

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= kabupatenFilter.length - 1; i++) {
      kabupaten += "''${kabupatenFilter[i]}'',";
    }

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUByLeasingCategory",
      'Branch': branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.substring(0, tanggalapi.length - 1),
      'Kabupaten': kabupaten.isNotEmpty
          ? kabupaten.substring(0, kabupaten.length - 1)
          : "",
      'Leasing': leasingFilter,
      'MktCategory': mktCategory,
      "MOdeGrid": "1"
    };

    print(bodyPost);

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    print(jsonBody);

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

      // print(response.body);

      List<DataLeasingCategory> listLeasingCategory =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<DataLeasingCategory>(
                  (data) => DataLeasingCategory.fromJson(data))
              .toList();

      for (var i = 0; i < listLeasingCategory.length; i++) {
        sumQty1Category += listLeasingCategory[i].qty1;
        sumQty2Category += listLeasingCategory[i].qty2;
        sumQty3Category += listLeasingCategory[i].qty3;
        vSLMCategory += listLeasingCategory[i].vSLM;
        vSLyCategory += listLeasingCategory[i].vSLY;
        sumLyCategory += listLeasingCategory[i].lY;
      }

      return listLeasingCategory;
    } else {
      print("b");
      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  static Future<List<STUDataDashboardArea>> fetchDataarea(
    List<String> areaFilter,
    List<String> kategoriFilter,
    List<String> tipeMotorFilter,
    List<String> tahunMotorFilter,
    List<String> kabupatenFilter,
    List<String> dpFilter,
    dynamic selectedDates,
  ) async {
    String tipe = "";
    String branch = "";
    String mktCategory = "";
    String kabupaten = "";
    String dp = "";
    String tahunMotor = "";

    var tanggalapi = "";
    String tahun = "";

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
        bulan = "${startDate?.month}";
        tahun = "${startDate?.year}";
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

    for (var i = 0; i <= areaFilter.length - 1; i++) {
      branch += "''${areaFilter[i]}'',";
    }

    for (var i = 0; i <= dpFilter.length - 1; i++) {
      dp += "''${dpFilter[i]}'',";
    }

    for (var i = 0; i <= tipeMotorFilter.length - 1; i++) {
      tipe += "''${tipeMotorFilter[i]}'',";
    }

    for (var i = 0; i <= tahunMotorFilter.length - 1; i++) {
      tahunMotor += "''${tahunMotorFilter[i]}'',";
    }

    for (var i = 0; i <= kategoriFilter.length - 1; i++) {
      mktCategory += "''${kategoriFilter[i]}'',";
    }

    for (var i = 0; i <= kabupatenFilter.length - 1; i++) {
      kabupaten += "''${kabupatenFilter[i]}'',";
    }

    String GroupName =
        "''CENTRAL'',''ID JEMBER'',''ID KALSEL'',''ID KALTENG'',''ID KALTIM'',''ID MALANG'',''ID NTB'',''ID SURABAYA'',''INDO PERKASA'',''IP JEMBER'',''IP NTB'',''KARTIKA GROUP'',''KARUNIA GROUP'',''METRO MOTOR'',''PUSAT GROUP'',''SINAR UTAMA'',''SIP JEMBER'',''SIP KALSEL'',''SIP KALTENG'',''SIP KALTIM'',''SIP MALANG'',''SIP NTB'',''SIP SURABAYA'',''SMA'',''SUMBER KARYA'',''TRISAKTI GROUP'',''TUGU MAS'',''UNION'',''UTAMA'',''YES GROUP NTT'',''YES GROUP SBY''";

    Map<String, String> bodyPost = {
      "Jenis": "DBSTUByLeasingArea",
      'Branch': branch.isNotEmpty ? branch.substring(0, branch.length - 1) : "",
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.isNotEmpty
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : "",
      'Tahunmotor': tahunMotor.isNotEmpty
          ? tahunMotor.substring(0, tahunMotor.length - 1)
          : "",
      'Tahunbelow': "2018",
      'Mktcategory': mktCategory.isNotEmpty
          ? mktCategory.substring(0, mktCategory.length - 1)
          : "",
      'Tipe': tipe.isNotEmpty ? tipe.substring(0, tipe.length - 1) : "",
      'Groupname': GroupName,
      'DP': dp.isNotEmpty ? dp.substring(0, dp.length - 1) : "",
      'Kabupaten': kabupaten.isNotEmpty
          ? kabupaten.substring(0, kabupaten.length - 1)
          : "",
    };

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);
    print(bodyPost);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http
        .post(Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
            body: jsonBody, headers: headers)
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      print(response.body);
      var jsonDecode = json.decode(response.body);
      List<STUDataDashboardArea> listarea =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<STUDataDashboardArea>(
                  (data) => STUDataDashboardArea.fromJson(data))
              .toList();

      sumQty1Area = 0;
      sumQty2Area = 0;
      sumQty3Area = 0;
      sumQty1Leasing = 0;
      sumQty2Leasing = 0;
      sumQty3Leasing = 0;
      sumQtyLYArea = 0;
      sumQtyLYLeasing = 0;

      return listarea;
    } else {
      print("Exception");
      throw Exception(Fluttertoast.showToast(
          msg: "LOAD DATA API GAGAL, TOLONG DICOBA KEMBALI",
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  static Future<List<GroupCC>> fetchDataAPIbyGroupCC(
    List<String> KategoriFilter,
    List<String> tipeMotorFilter,
    List<String> tahunMotorFilter,
    String LeasingFilter,
    dynamic selectedDates,
  ) async {
    String Tanggal = "";
    String Branch = "";
    String MktCategory = "";

    var tanggalapi = "";
    String tahun = "";

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
        bulan = "${startDate?.month}";
        tahun = "${startDate?.year}";
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
      bulan = "$monthNow";
      tahun = "$yearNow";
    }

    for (var i = 0; i <= KategoriFilter.length - 1; i++) {
      MktCategory += "''${KategoriFilter[i]}'',";
    }

    String tahunMotor = "";

    for (var i = 0; i <= tahunMotorFilter.length - 1; i++) {
      tahunMotor += "''${tahunMotorFilter[i]}'',";
    }

    String tipe = "";

    for (var i = 0; i <= tipeMotorFilter.length - 1; i++) {
      tipe += "''${tipeMotorFilter[i]}'',";
    }

    Map<String, String> bodyPost = {
      'Jenis': 'DBSTUByGroupCC',
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.isNotEmpty
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : '0',
      'MktCategory': MktCategory.isNotEmpty
          ? MktCategory.substring(0, MktCategory.length - 1)
          : '',
      'TahunMotor': tahunMotor.isNotEmpty
          ? tahunMotor.substring(0, tahunMotor.length - 1)
          : '',
      'TahunBelow': "2018",
      'Tipe': tipe.isNotEmpty ? tipe.substring(0, tipe.length - 1) : '',
      'Leasing': LeasingFilter
    };

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await http
          .post(
            Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
            body: jsonBody,
            headers: headers,
          )
          .timeout(const Duration(seconds: 60));

      if (response.statusCode == 200) {
        var jsonDecode = json.decode(response.body);

        List<GroupCC> listGroupcc = (jsonDecode as Map<String, dynamic>)['Data']
            .map<GroupCC>((data) => GroupCC.fromJson(data))
            .toList();

        print(listGroupcc);

        return listGroupcc;
      } else {
        print('fetchDataGroupCC tidak berhasil: ${response.statusCode}');

        return [];
      }
    } catch (e) {
      print('Terjadi kesalahan saat fetchDataKab, kodeError: $e');

      return [];
    }
  }
}
