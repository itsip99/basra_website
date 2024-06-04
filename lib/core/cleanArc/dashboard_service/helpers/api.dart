import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stsj/core/cleanArc/dashboard_service/models/dashboard.dart';

class Api {
  static Future<List<Dashboard>> getDashboard(
      String param, String ter, String tgl1, String tgl2) async {
    var url =
        Uri.https('wsip.yamaha-jatim.co.id:2448', '/Service/Dashboard/$param');
    http.Response respon;
    try {
      respon = await http.post(
        url,
        body: jsonEncode({
          'Territori': ter,
          'BeginDate': tgl1,
          'EndDate': tgl2,
          'ASD': '',
          'Area': '',
          'GroupDealer': '',
          'District': '',
        }),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 30));

      if (respon.statusCode == 200) {
        var jsonDecode = json.decode(respon.body);
        if (jsonDecode['code'] == '100') {
          List<Dashboard> list = (jsonDecode['data'] as List)
              .map<Dashboard>((data) => Dashboard.fromJson(data))
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
}
