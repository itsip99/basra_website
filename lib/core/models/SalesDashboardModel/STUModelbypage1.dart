import 'package:stsj/core/service/ReusableService.dart';

class DataSTUBYKategori {
  String kode = "";
  String urutan = "";
  String Kategori = "";
  double Qty1;
  double Qty2;
  double Qty3;
  double VSLM;
  double LY;
  double VSLY;
  String UrlGambarVZLM;
  String UrlGambarVZLY;
  String UrlGambarVZLMPersentase;
  String UrlGambarVZLYPersentase;
  String UrlGambarVZLMPersentaseKredit;
  String UrlGambarVZLYPersentaseKredit;
  double Target;

  DataSTUBYKategori({
    required this.kode,
    required this.urutan,
    required this.Kategori,
    required this.Qty1,
    required this.Qty2,
    required this.Qty3,
    required this.VSLM,
    required this.LY,
    required this.VSLY,
    required this.UrlGambarVZLM,
    required this.UrlGambarVZLY,
    required this.UrlGambarVZLMPersentase,
    required this.UrlGambarVZLYPersentase,
    required this.UrlGambarVZLMPersentaseKredit,
    required this.UrlGambarVZLYPersentaseKredit,
    required this.Target,
  });

  factory DataSTUBYKategori.fromJson(Map<String, dynamic> json) {
    String Temp;
    String TempLY;
    if ((json['VSLM'] * 100) > 100) {
      Temp = "assets/images/icon-up.png";
    } else {
      Temp = "assets/images/icon-down.png";
    }

    if ((json['VSLY'] * 100) > 100) {
      TempLY = "assets/images/icon-up.png";
    } else {
      TempLY = "assets/images/icon-down.png";
    }
    return DataSTUBYKategori(
        kode: json['Kode'],
        urutan: json['Urutan'],
        Kategori: json['Category'],
        Qty1: json['Qty1'],
        Qty2: json['Qty2'],
        Qty3: json['Qty3'],
        VSLM: ServiceReusable.parseAndHandleNaNPercent((json['VSLM'] * 100)),
        LY: json['LY'],
        VSLY: ServiceReusable.parseAndHandleNaNPercent((json['VSLY'] * 100)),
        UrlGambarVZLM: Temp,
        UrlGambarVZLY: TempLY,
        UrlGambarVZLMPersentase: "",
        UrlGambarVZLYPersentase: "",
        UrlGambarVZLMPersentaseKredit: "",
        UrlGambarVZLYPersentaseKredit: "",
        Target: json['Target']);
  }
}

class DataDashBoard {
  String kode = "";
  String urutan = "";
  String Kategori = "";
  double Qty1;
  double Qty2;
  double Qty3;
  double VSLM;
  double LY;
  double VSLY;
  String UrlGambarVZLM;
  String UrlGambarVZLY;
  String UrlGambarVZLMPersentase;
  String UrlGambarVZLYPersentase;
  String UrlGambarVZLMPersentaseKredit;
  String UrlGambarVZLYPersentaseKredit;
  double Target;

  DataDashBoard({
    required this.kode,
    required this.urutan,
    required this.Kategori,
    required this.Qty1,
    required this.Qty2,
    required this.Qty3,
    required this.VSLM,
    required this.LY,
    required this.VSLY,
    required this.UrlGambarVZLM,
    required this.UrlGambarVZLY,
    required this.UrlGambarVZLMPersentase,
    required this.UrlGambarVZLYPersentase,
    required this.UrlGambarVZLMPersentaseKredit,
    required this.UrlGambarVZLYPersentaseKredit,
    required this.Target,
  });

  factory DataDashBoard.fromJson(Map<String, dynamic> json) {
    String Temp;
    String TempLY;
    if ((json['VSLM'] * 100) > 100) {
      Temp = "assets/images/icon-up.png";
    } else {
      Temp = "assets/images/icon-down.png";
    }

    if ((json['VSLY'] * 100) > 100) {
      TempLY = "assets/images/icon-up.png";
    } else {
      TempLY = "assets/images/icon-down.png";
    }
    return DataDashBoard(
        kode: json['Kode'],
        urutan: json['Urutan'],
        Kategori: json['Category'],
        Qty1: json['Qty1'],
        Qty2: json['Qty2'],
        Qty3: json['Qty3'],
        VSLM: ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100),
        LY: json['LY'],
        VSLY: ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100),
        UrlGambarVZLM: Temp,
        UrlGambarVZLY: TempLY,
        UrlGambarVZLMPersentase: "",
        UrlGambarVZLYPersentase: "",
        UrlGambarVZLMPersentaseKredit: "",
        UrlGambarVZLYPersentaseKredit: "",
        Target: json['Target']);
  }
}
