import 'package:stsj/core/service/ReusableService.dart';

class DataDashboardTipe {
  String? urutan;
  String? category;
  String? bigcategory;
  String? itemname;
  double? Qty1;
  double? Qty2;
  double? Qty3;
  double? VSLM;
  double? LY;
  double? VSLY;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<DataCategorytotal>? detail;

  DataDashboardTipe(
      {this.urutan,
      this.category,
      this.bigcategory,
      this.itemname,
      this.Qty1,
      this.Qty2,
      this.Qty3,
      this.VSLM,
      this.LY,
      this.VSLY,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY,
      this.detail});

  factory DataDashboardTipe.fromJson(Map<String, dynamic> json) {
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

    return DataDashboardTipe(
      urutan: json['Urutan'],
      category: json['Category'],
      bigcategory: json['BigCategory'],
      itemname: json['ItemName'],
      Qty1: json['Qty1'],
      Qty2: json['Qty2'],
      Qty3: json['Qty3'],
      VSLM: json['VSLM'] * 100,
      LY: json['LY'],
      VSLY: json['VSLY'] * 100,
      UrlGambarVZLM: Temp,
      UrlGambarVZLY: TempLY,
    );
  }
}

class DataCategorytotal {
  String? urutan;
  String? category;
  String? bigCategory;
  String? itemName;
  num? qty1;
  num? qty2;
  num? subqty1;
  num? qty3;
  num? vSLM;
  num? lY;
  num? vSLY;
  String? TempvSLM;
  String? TempvSLY;

  DataCategorytotal(
      {this.urutan,
      this.category,
      this.bigCategory,
      this.itemName,
      this.qty1,
      this.qty2,
      this.qty3,
      this.vSLM,
      this.lY,
      this.vSLY});

  DataCategorytotal.fromJson(Map<String, dynamic> json) {
    if ((json['VSLM'] * 100) >= 100) {
      TempvSLM = "assets/images/icon-up.png";
    } else {
      TempvSLM = "assets/images/icon-down.png";
    }

    if ((json['VSLY'] * 100) >= 100) {
      TempvSLY = "assets/images/icon-up.png";
    } else {
      TempvSLY = "assets/images/icon-down.png";
    }

    urutan = json['Urutan'];
    category = json['Category'];
    bigCategory = json['BigCategory'];
    itemName = json['ItemName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM']) * 100;
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY']) * 100;
    TempvSLM = TempvSLM;
    TempvSLY = TempvSLY;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Urutan'] = this.urutan;
    data['Category'] = this.category;
    data['BigCategory'] = this.bigCategory;
    data['ItemName'] = this.itemName;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    return data;
  }
}
