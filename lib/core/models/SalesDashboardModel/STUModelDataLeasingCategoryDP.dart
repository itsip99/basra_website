import 'package:stsj/core/service/ReusableService.dart';

class DataDashboardKategoriDP {
  String urutan;
  String judul;
  int qty1;
  int qty2;
  int qty3;
  double vSLM;
  int lY;
  double vSLY;
  String urlGambarVZLM;
  String urlGambarVZLY;

  DataDashboardKategoriDP(
      {required this.urutan,
      required this.judul,
      required this.qty1,
      required this.qty2,
      required this.qty3,
      required this.vSLM,
      required this.lY,
      required this.vSLY,
      required this.urlGambarVZLM,
      required this.urlGambarVZLY});

  factory DataDashboardKategoriDP.fromJson(Map<String, dynamic> json) {
    String Temp;
    String TempLY;
    if (((json['Qty3'] / json['Qty2']) * 100) >= 100) {
      Temp = "assets/images/icon-up.png";
    } else {
      Temp = "assets/images/icon-down.png";
    }

    if (((json['Qty3'] / json['LY']) * 100) >= 100) {
      TempLY = "assets/images/icon-up.png";
    } else {
      TempLY = "assets/images/icon-down.png";
    }

    return DataDashboardKategoriDP(
        urutan: json['Urutan'],
        judul: json['Judul'],
        qty1: json['Qty1'],
        qty2: json['Qty2'],
        qty3: json['Qty3'],
        vSLM: ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100),
        lY: json['LY'],
        vSLY: ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100),
        urlGambarVZLM: Temp,
        urlGambarVZLY: TempLY);
  }
}
