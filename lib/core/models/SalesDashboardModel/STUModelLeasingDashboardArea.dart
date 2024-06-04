import 'package:stsj/core/service/ReusableService.dart';

class STUDataDashboardArea {
  String urutan;
  String leasingmkt;
  double Qty1;
  double Qty2;
  double Qty3;
  double VSLM;
  double LY;
  double VSLY;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;

  STUDataDashboardArea(
      {required this.urutan,
      required this.leasingmkt,
      required this.Qty1,
      required this.Qty2,
      required this.Qty3,
      required this.VSLM,
      required this.LY,
      required this.VSLY,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY});

  factory STUDataDashboardArea.fromJson(Map<String, dynamic> json) {
    String Temp;
    String TempLY;
    if ((json['VSLM'] * 100) >= 100) {
      Temp = "assets/images/icon-up.png";
    } else {
      Temp = "assets/images/icon-down.png";
    }

    if ((json['VSLY'] * 100) >= 100) {
      TempLY = "assets/images/icon-up.png";
    } else {
      TempLY = "assets/images/icon-down.png";
    }

    return STUDataDashboardArea(
      urutan: json['Urutan'],
      leasingmkt: json['LeasingMkt'],
      Qty1: json['Qty1'],
      Qty2: json['Qty2'],
      Qty3: json['Qty3'],
      VSLM: ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100),
      LY: json['LY'],
      VSLY: ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100),
      UrlGambarVZLM: Temp,
      UrlGambarVZLY: TempLY,
    );
  }
}
