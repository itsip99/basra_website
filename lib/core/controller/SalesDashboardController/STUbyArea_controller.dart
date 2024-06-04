import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stsj/core/models/SalesDashboardModel/STUModelbyAreaKab.dart';
import 'package:stsj/core/models/SalesDashboardModel/STUModelbyGroupArea.dart';
import 'package:stsj/core/views/Sales_Dashboard/components/pickerdatarange.dart';

class STUBYAreaController {
  static List<kabupatenModel> listGroup = [];

  static List<String> kabupatenTitle = [];

  static double sumKABqty1 = 0;
  static double sumKABqty2 = 0;
  static double sumKABqty3 = 0;
  static double sumKABly = 0;
  static double sumKABVSLM = 0;
  static double sumKABVSLY = 0;

  static var urlgambarvslm = "";
  static var urlgambarvsly = "";
  static var DayNow = DateTime.now().day;
  static var monthNow = DateTime.now().month;
  static var YearNow = DateTime.now().year;

  static String bulan = "";

  static Future<List<kabupatenModel>> fetchDataAPIbyKab(
    List<String> KategoriFilter,
    List<String> listTipeMotorFilter,
    List<String> listTahunMotorFilter,
    dynamic selectedDates,
  ) async {
    String Tanggal = "";
    String branch = "";
    String mktCategory = "";
    String tipe = "";
    String tahunMotor = "";

    var DayNow = DateTime.now().day;
    var YearNow = DateTime.now().year;
    var yearbelow = DateTime.now().year - 5;

    for (var i = 0; i <= listTipeMotorFilter.length - 1; i++) {
      tipe += "''${listTipeMotorFilter[i]}'',";
    }

    for (var i = 0; i <= listTahunMotorFilter.length - 1; i++) {
      tahunMotor += "''${listTahunMotorFilter[i]}'',";
    }

    var tahunmotorheaderapi = "";

    var tanggalapi = "";
    String tahun = "";

    if (selectedDates is List<PickerDateRange>) {
      List<PickerDateRange> dateRanges = selectedDates;

      for (PickerDateRange dateRange in dateRanges) {
        DateTime? startDate = dateRange.startDate;
        DateTime? endDate = dateRange.endDate;

        int startDay =
            startDate?.day ?? DayNow; // Mengambil tanggal awal atau 0 jika null
        int endDay = endDate?.day ?? DayNow;

        for (int day = startDay; day <= endDay; day++) {
          tanggalapi += "$day,";
        }
        bulan = "${startDate?.month}" ?? "${monthNow}";
        tahun = "${startDate?.year}" ?? "${YearNow}";
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
      for (int day = DayNow; DayNow <= DayNow; day++) {
        tanggalapi += "$day,";
      }
      bulan = "${monthNow}";
      tahun = "${YearNow}";
    }

    for (var i = 0; i <= KategoriFilter.length - 1; i++) {
      mktCategory += "''${KategoriFilter[i]}'',";
    }

    String tahunBelow = yearbelow.toString();

    Map<String, String> bodyPost = {
      'Jenis': 'DBSTUByKabupaten',
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.length > 0
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : '0',
      'MktCategory': mktCategory.length > 0
          ? mktCategory.substring(0, mktCategory.length - 1)
          : '',
      'TahunMotor': tahunMotor.length > 0
          ? tahunMotor.substring(0, tahunMotor.length - 1)
          : '',
      'TahunBelow': tahunBelow,
      'Tipe': tipe.length > 0 ? tipe.substring(0, tipe.length - 1) : ''
    };

    print(bodyPost);

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http
        .post(
          Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
          body: jsonBody,
          headers: headers,
        )
        .timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);

      List<kabupatenModel> listKab =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<kabupatenModel>((data) => kabupatenModel.fromJson(data))
              .toList();

      // set semua qty nol
      sumKABqty1 = 0;
      sumKABqty2 = 0;
      sumKABqty3 = 0;
      sumKABVSLY = 0;
      sumKABVSLM = 0;
      sumKABVSLY = 0;

      // grand total
      for (var i = 0; i < listKab.length; i++) {
        sumKABqty1 += listKab[i].qty1!;
        sumKABqty2 += listKab[i].qty2!;
        sumKABqty3 += listKab[i].qty3!;
        sumKABVSLY += listKab[i].lY!;
        sumKABVSLM += listKab[i].vSLM!;
        sumKABVSLY += listKab[i].vSLY!;
      }

      return listKab;
    } else {
      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }

  static Future<List<SalesGroupByArea?>> fetchDataAPIGroupArea(
    List<String> KategoriFilter,
    List<String> tipeMotorFilter,
    List<String> tahunMotorFilter,
    dynamic selectedDates,
  ) async {
    String Tanggal = "";
    String Branch = "";
    String MktCategory = "";
    var DayNow = DateTime.now().day;
    var YearNow = DateTime.now().year;
    var yearbelow = DateTime.now().year - 5;
    String tahunMotor = "";
    String tahunBelow = yearbelow.toString();
    String tipe = "";
    var tanggalapi = "";
    String tahun = "";

    if (selectedDates is List<PickerDateRange>) {
      List<PickerDateRange> dateRanges = selectedDates;

      for (PickerDateRange dateRange in dateRanges) {
        DateTime? startDate = dateRange.startDate;
        DateTime? endDate = dateRange.endDate;

        int startDay =
            startDate.day ?? DayNow; // Mengambil tanggal awal atau 0 jika null
        int endDay = endDate.day ?? DayNow;

        for (int day = startDay; day <= endDay; day++) {
          tanggalapi += "$day,";
        }
        bulan = "${startDate?.month}" ?? "${monthNow}";
        tahun = "${startDate?.year}" ?? "${YearNow}";
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
      for (int day = DayNow; DayNow <= DayNow; day++) {
        tanggalapi += "$day,";
      }
      bulan = "$monthNow";
      tahun = "$YearNow";
    }

    for (var i = 0; i <= KategoriFilter.length - 1; i++) {
      MktCategory += "''${KategoriFilter[i]}'',";
    }

    for (var i = 0; i <= tahunMotorFilter.length - 1; i++) {
      tahunMotor += "''${tahunMotorFilter[i]}'',";
    }

    for (var i = 0; i <= tipeMotorFilter.length - 1; i++) {
      tipe += "''${tipeMotorFilter[i]}'',";
    }

    Map<String, String> bodyPost = {
      'Jenis': 'DBSTUByGroup',
      'Bulan': bulan,
      'Tahun': tahun,
      'Tanggal': tanggalapi.length > 0
          ? tanggalapi.substring(0, tanggalapi.length - 1)
          : '0',
      'MktCategory': MktCategory.length > 0
          ? MktCategory.substring(0, MktCategory.length - 1)
          : '',
      'TahunMotor': tahunMotor.length > 0
          ? tahunMotor.substring(0, tahunMotor.length - 1)
          : '',
      'TahunBelow': tahunBelow,
      'Tipe': tipe.length > 0 ? tipe.substring(0, tipe.length - 1) : '',
    };

    // Convert the map to a JSON string
    final String jsonBody = json.encode(bodyPost);

    // Set the 'Content-Type' header to 'application/json'
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http
        .post(
          Uri.parse('https://wsip.yamaha-jatim.co.id:2448/DBapi/DBSales'),
          body: jsonBody,
          headers: headers,
        )
        .timeout(const Duration(seconds: 60));

    if (response.statusCode == 200) {
      var jsonDecode = json.decode(response.body);

      List<SalesGroupByArea> listGroupcc =
          (jsonDecode as Map<String, dynamic>)['Data']
              .map<SalesGroupByArea>((data) => SalesGroupByArea.fromJson(data))
              .toList();

      print(listGroupcc);

      return listGroupcc;
    } else {
      print('fetchDataGroupCC tidak berhasil: ${response.statusCode}');

      throw Exception(Fluttertoast.showToast(
          msg: "Terjadi kesalahan saat mengambil data", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }
}
