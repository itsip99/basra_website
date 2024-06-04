import 'package:stsj/core/service/ReusableService.dart';

class DataLeasingCategory {
  String urutan;
  String judul;
  int qty1;
  int qty2;
  int qty3;
  double vSLM;
  int lY;
  double vSLY;
  String TempvSLM = "";
  String TempvSLY = "";

  DataLeasingCategory(
      {required this.urutan,
      required this.judul,
      required this.qty1,
      required this.qty2,
      required this.qty3,
      required this.vSLM,
      required this.lY,
      required this.vSLY,
      TempvSLM,
      TempvSLY});

  factory DataLeasingCategory.fromJson(Map<String, dynamic> json) {
    final urutan = json['Urutan'];
    final judul = json['Judul'];
    final qty1 = json['Qty1'];
    final qty2 = json['Qty2'];
    final qty3 = json['Qty3'];
    final lY = json['LY'];

    final double vSLM =
        ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100) ?? 0.0;
    final double vSLY =
        ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100) ?? 0.0;

    final TempvSLM = vSLM >= 100
        ? "assets/images/icon-up.png"
        : "assets/images/icon-down.png";
    final TempvSLY = vSLY >= 100
        ? "assets/images/icon-up.png"
        : "assets/images/icon-down.png";

    return DataLeasingCategory(
      urutan: urutan,
      judul: judul,
      qty1: qty1,
      qty2: qty2,
      qty3: qty3,
      lY: lY,
      vSLM: vSLM,
      vSLY: vSLY,
      TempvSLM: TempvSLM,
      TempvSLY: TempvSLY,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Urutan'] = this.urutan;
    data['Judul'] = this.judul;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    return data;
  }
}
