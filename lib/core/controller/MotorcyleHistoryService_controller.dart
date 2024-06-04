import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:stsj/core/models/ServiceDashboard/MotorService.dart';
import 'package:stsj/core/views/Services/MotorcyleHistory/MotorcycleHistory_pages.dart';

class MotorCyleService {
  static List<DataMotorcycleHistory> listdatamotorhistory = [];
  static List<Detail> listdatamotorhistorydetail = [];
  static bool tidakadadata = false;

  static Future<List<DataMotorcycleHistory>> fetchdatamotorcyclehistory(
      String NoRangka, String NoMesin) async {
    var koderespon = 0;
    String chasisno = NoRangka;
    String engineno = NoMesin;

    Map<String, String> mainheader = {
      'chasisno': chasisno,
      'engineno': engineno,
    };

    final response = await http
        .get(Uri.parse('http://203.201.175.80:81/apiBA/MotorHistory'),
            headers: mainheader)
        .timeout(const Duration(seconds: 60));

    print(mainheader);

    print(response.statusCode);
    print(response.request);
    if (response.statusCode == 200) {
      print(response.body);
      var jsonDecode = json.decode(response.body);
      koderespon = response.statusCode;
      if (jsonDecode['Code'] == '404') {
        listdatamotorhistory = [];
        listdatamotorhistorydetail = [];
        tidakadadata = true;
      } else {
        print(jsonDecode['Data']);
        print(jsonDecode['Data'][0]['Detail']);

        List<DataMotorcycleHistory> listmotorhistory =
            (jsonDecode as Map<String, dynamic>)['Data']
                .map<DataMotorcycleHistory>(
                    (data) => DataMotorcycleHistory.fromJson(data))
                .toList();
        List<Detail> listmotorhistorydetail =
            (jsonDecode as Map<String, dynamic>)['Data'][0]['Detail']
                .map<Detail>((data) => Detail.fromJson(data))
                .toList();
        listdatamotorhistory.clear();
        listdatamotorhistorydetail.clear();
        print(listmotorhistory.length);
        print(listmotorhistorydetail.length);
        for (var i = 0; i < listmotorhistory.length; i++) {
          listdatamotorhistory.add(listmotorhistory[i]);
          MotorCycleHistoryPages.NamaBarang = listmotorhistory[i].itemname;
          MotorCycleHistoryPages.chasistext = listmotorhistory[i].chasisno;
          MotorCycleHistoryPages.enginetext = listmotorhistory[i].engineno;
          MotorCycleHistoryPages.NamaWarna = listmotorhistory[i].colorname;
          MotorCycleHistoryPages.Tahun = listmotorhistory[i].year;
        }
        for (var i = 0; i < listmotorhistorydetail.length; i++) {
          listdatamotorhistorydetail.add(listmotorhistorydetail[i]);
        }
        tidakadadata = false;
      }
      return listdatamotorhistory;
    } else {
      print("b");
      throw Exception(Fluttertoast.showToast(
          msg:
              "LOAD DATA API GAGAL, TOLONG DICOBA KEMBALI. Status Code : $koderespon", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          timeInSecForIosWeb: 5 // duration
          ));
    }
  }
}
