import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stsj/alokasi-bm/helper/model_alokasi_bm.dart';

String msg = '', code = '';

class ApiAlokasiBM {
  static Future<List<ModelModify>> uploadExcelAlokasiBM(
      String branch, periode, userid, List<Map> listUpload) async {
    var url =
        Uri.https('wsip.yamaha-jatim.co.id:2448', '/api/BagiFS/UploadExcel');

    List<Map> bodyAPI = [
      {
        'Branch': branch,
        'Periode': periode,
        'UserID': userid,
        'Detail': listUpload
      }
    ];

    try {
      final response = await http.post(url,
          body: jsonEncode(bodyAPI),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 60));

      List<ModelModify> list = [];

      if (response.statusCode <= 200) {
        var json = jsonDecode(response.body);

        msg = json['msg'];
        code = json['code'];

        list = (json['data'] as List)
            .map<ModelModify>((data) => ModelModify.fromJson(data))
            .toList();
      }

      return list;
    } catch (e) {
      return throw 'Koneksi API Gagal';
    }
  }

  static Future<List<ModelBrowseAlokasi>> getDataAlokasiBM(
      String userid, branch, enddate) async {
    var url = Uri.https('wsip.yamaha-jatim.co.id:2448', '/api/BagiFS/Browse');

    Map bodyAPI = {'UserID': userid, 'Branch': branch, 'EndDate': enddate};

    try {
      final response = await http.post(url,
          body: jsonEncode(bodyAPI),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 60));

      List<ModelBrowseAlokasi> list = [];

      if (response.statusCode <= 200) {
        var json = jsonDecode(response.body);
        msg = json['msg'];
        code = json['code'];

        list = (json['data'] as List)
            .map<ModelBrowseAlokasi>(
                (data) => ModelBrowseAlokasi.fromJson(data))
            .toList();
      }

      return list;
    } catch (e) {
      return throw 'Koneksi API Gagal';
    }
  }

  static Future<List<ModelModify>> revisiAlokasiBM(
      String branch, periode, userid, List<Map> detail) async {
    var url = Uri.https('wsip.yamaha-jatim.co.id:2448', '/api/BagiFS/Modify');

    List<Map> bodyAPI = [
      {'Branch': branch, 'Periode': periode, 'UserID': userid, 'Detail': detail}
    ];

    try {
      final response = await http.post(url,
          body: jsonEncode(bodyAPI),
          headers: {
            'Content-Type': 'application/json'
          }).timeout(const Duration(seconds: 60));

      List<ModelModify> list = [];

      if (response.statusCode <= 200) {
        var json = jsonDecode(response.body);
        msg = json['msg'];
        code = json['code'];

        list = (json['data'] as List)
            .map<ModelModify>((data) => ModelModify.fromJson(data))
            .toList();
      }

      return list;
    } catch (e) {
      return throw e;
    }
  }
}
