import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stsj/dashboard-fixup/models/dashboard1_model.dart';
import 'package:stsj/dashboard-fixup/models/dashboard2_model.dart';
import 'package:stsj/dashboard-fixup/models/dashboard3_model.dart';
import 'package:stsj/dashboard-fixup/models/dashboard4_model.dart';
import 'package:stsj/dashboard-fixup/models/dashboard5_model.dart';
import 'package:stsj/dashboard-fixup/models/parameter_model.dart';

class SampApi {
  static Future<List<Dashboard1>> getDashboard1(
      String user, String bulan, String tahun) async {
    var url = Uri.https(
        'wsip.yamaha-jatim.co.id:2448', '/DBapi/DBFUMoto/Dashboard01');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({'UserID': user, 'Bulan': bulan, 'Tahun': tahun}),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard1> list = (jsonDecode['data'] as List)
              .map<Dashboard1>((data) => Dashboard1.fromJson(data))
              .toList();

          return list;
        } else {
          throw (jsonDecode['msg'] ?? 'DATA NOT FOUND');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<List<Dashboard2>> getDashboard2(
      String user, String branchshop, String periode) async {
    var url = Uri.https(
        'wsip.yamaha-jatim.co.id:2448', '/DBapi/DBFUMoto/DashboardFUDaily');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({
          'UserID': user,
          'Branch': branchshop == '' ? '' : branchshop.substring(0, 2),
          'Shop': branchshop == '' ? '' : branchshop.substring(2, 4),
          'Periode': periode,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard2> list = (jsonDecode['data'] as List)
              .map<Dashboard2>((data) => Dashboard2.fromJson(data))
              .toList();

          return list;
        } else {
          throw (jsonDecode['msg'] ?? 'DATA NOT FOUND');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<List<Dashboard3>> getDashboard3(
      String user, String branchshop, String periode) async {
    var url = Uri.https('wsip.yamaha-jatim.co.id:2448',
        '/DBapi/DBFUMoto/DashboardFUDailyMekanik');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({
          'UserID': user,
          'Branch': branchshop == '' ? '' : branchshop.substring(0, 2),
          'Shop': branchshop == '' ? '' : branchshop.substring(2, 4),
          'Periode': periode,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard3> list = (jsonDecode['data'] as List)
              .map<Dashboard3>((data) => Dashboard3.fromJson(data))
              .toList();

          return list;
        } else {
          throw (jsonDecode['msg'] ?? 'DATA NOT FOUND');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<List<Dashboard4>> getDashboard4(
      String user, String branchshop, String periode) async {
    var url = Uri.https(
        'wsip.yamaha-jatim.co.id:2448', '/DBapi/DBFUMoto/DashboardFUMonthly');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({
          'UserID': user,
          'Branch': branchshop == '' ? '' : branchshop.substring(0, 2),
          'Shop': branchshop == '' ? '' : branchshop.substring(2, 4),
          'Periode': periode,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard4> list = (jsonDecode['data'] as List)
              .map<Dashboard4>((data) => Dashboard4.fromJson(data))
              .toList();

          return list;
        } else {
          throw (jsonDecode['msg'] ?? 'DATA NOT FOUND');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<List<Dashboard5>> getDashboard5(
      String id, String nama, String hp) async {
    var url = Uri.https(
        'wsip.yamaha-jatim.co.id:2448', '/DBapi/DBFUMoto/BrowseMembership');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({
          'MemberID': id,
          'MemberName': nama,
          'PhoneNo': hp,
          'BranchShop': '',
          'BeginDate': '',
          'EndDate': '',
          'TotalVisit1': 0,
          'TotalVisit2': 0,
          'TotalAmount1': 0,
          'TotalAmount2': 0,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard5> list = (jsonDecode['data'] as List)
              .map<Dashboard5>((data) => Dashboard5.fromJson(data))
              .toList();

          return list;
        } else {
          throw (jsonDecode['msg'] ?? 'DATA NOT FOUND');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }

  static Future<Map<String, dynamic>> prosesUploadExcel(
      List<Parameter> listData) async {
    var url = Uri.https(
        'wsip.yamaha-jatim.co.id:2448', '/DBapi/DBFUMoto/ModifyFUDailyTarget');
    dynamic respon;
    List<Map<String, dynamic>> tmp = [
      for (Parameter data in listData)
        Map.of({
          "Branch": data.branch,
          "Shop": data.shop,
          "TransDate": data.tanggal,
          "SA": data.sa,
          "Teknisi": data.mekanik,
          "HariKerja": data.hariKerja,
          "RUT": data.rut,
        })
    ];
    try {
      respon = await http.post(
        url,
        body: jsonEncode(tmp),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
      ).timeout(const Duration(seconds: 180));
      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100' &&
            jsonDecode['data'][0]['resultMessage'] == 'Sukses') {
          return jsonDecode['data'][0];
        } else {
          throw (jsonDecode['msg'] ?? 'UPLOAD GAGAL');
        }
      } else {
        throw ('${respon.statusCode.toString()} : ${respon.reasonPhrase.toString()}');
      }
    } on TimeoutException {
      throw ('TIME OUT');
    } catch (e) {
      throw (e.toString());
    }
  }
}
