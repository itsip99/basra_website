import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';

class kabupatenModel {
  String? territori;
  double? qty1 = 0.00;
  double? qty2 = 0.00;
  double? qty3 = 0.00;
  double? vSLM = 0.00;
  double? lY = 0.00;
  double? vSLY = 0.00;
  double? tQty1 = 0.00;
  double? tQty2 = 0.00;
  double? tQty3 = 0.00;
  double? pTQty1 = 0.00;
  double? pTQty2 = 0.00;
  double? pTQty3 = 0.00;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<Detail>? detail;

  kabupatenModel(
      {this.territori,
      this.qty1,
      this.qty2,
      this.qty3,
      this.vSLM,
      this.lY,
      this.vSLY,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.pTQty1,
      this.pTQty2,
      this.pTQty3,
      this.detail,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY});

  kabupatenModel.fromJson(Map<String, dynamic> json) {
    var f = NumberFormat("00.00", "en_US");

    String Temp = "";
    String TempLY = "";
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

    territori = json['Territori'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = double.parse(f.format(json['VSLM'] * 100));
    lY = json['LY'];
    vSLY = double.parse(f.format(json['VSLY'] * 100));
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = double.parse(f.format(json['PTQty1'])) * 100;
    pTQty2 = double.parse(f.format(json['PTQty2'])) * 100;
    pTQty3 = double.parse(f.format(json['PTQty3'])) * 100;
    if (json['Detail'] != null) {
      detail = <Detail>[];
      json['Detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
    data['PTQty1'] = this.pTQty1;
    data['PTQty2'] = this.pTQty2;
    data['PTQty3'] = this.pTQty3;
    if (this.detail != null) {
      data['Detail'] = this.detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  String? territori;
  String? bigArea;
  double? qty1 = 0.00;
  double? qty2 = 0.00;
  double? qty3 = 0.00;
  double? vSLM = 0.00;
  double? lY = 0.00;
  double? vSLY = 0.00;
  double? tQty1 = 0.00;
  double? tQty2 = 0.00;
  double? tQty3 = 0.00;
  double? pTQty1 = 0.00;
  double? pTQty2 = 0.00;
  double? pTQty3 = 0.00;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<DataDT2>? dataDT2;

  Detail(
      {this.territori,
      this.bigArea,
      this.qty1,
      this.qty2,
      this.qty3,
      this.vSLM,
      this.lY,
      this.vSLY,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.pTQty1,
      this.pTQty2,
      this.pTQty3,
      this.dataDT2,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY});

  Detail.fromJson(Map<String, dynamic> json) {
    var f = NumberFormat("00.00", "en_US");

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

    territori = json['Territori'];
    bigArea = json['BigArea'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = double.parse(f.format(json['VSLM'] * 100));
    lY = json['LY'];
    vSLY = double.parse(f.format(json['VSLY'] * 100));
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = double.parse(f.format(json['PTQty1'])) * 100;
    pTQty2 = double.parse(f.format(json['PTQty2'])) * 100;
    pTQty3 = double.parse(f.format(json['PTQty3'])) * 100;
    if (json['DataDT2'] != null) {
      dataDT2 = <DataDT2>[];
      json['DataDT2'].forEach((v) {
        dataDT2!.add(new DataDT2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
    data['PTQty1'] = this.pTQty1;
    data['PTQty2'] = this.pTQty2;
    data['PTQty3'] = this.pTQty3;
    if (this.dataDT2 != null) {
      data['DataDT2'] = this.dataDT2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDT2 {
  String? territori;
  String? bigArea;
  String? kabupaten;
  double? qty1 = 0.00;
  double? qty2 = 0.00;
  double? qty3 = 0.00;
  double? vSLM = 0.00;
  double? lY = 0.00;
  double? vSLY = 0.00;
  double? tQty1 = 0.00;
  double? tQty2 = 0.00;
  double? tQty3 = 0.00;
  double? pTQty1 = 0.00;
  double? pTQty2 = 0.00;
  double? pTQty3 = 0.00;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<DataDT3>? dataDT3;

  DataDT2(
      {this.territori,
      this.bigArea,
      this.kabupaten,
      this.qty1,
      this.qty2,
      this.qty3,
      this.vSLM,
      this.lY,
      this.vSLY,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.pTQty1,
      this.pTQty2,
      this.pTQty3,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY,
      this.dataDT3});

  DataDT2.fromJson(Map<String, dynamic> json) {
    var f = NumberFormat("0.0", "en_US");

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

    territori = json['Territori'];
    bigArea = json['BigArea'];
    kabupaten = json['Kabupaten'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = double.parse(f.format(json['VSLM'] * 100));
    lY = json['LY'];
    vSLY = double.parse(f.format(json['VSLY'] * 100));
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = double.parse(f.format(json['PTQty1'])) * 100;
    pTQty2 = double.parse(f.format(json['PTQty2'])) * 100;
    pTQty3 = double.parse(f.format(json['PTQty3'])) * 100;

    if (json['DataDT3'] != null) {
      dataDT3 = <DataDT3>[];
      json['DataDT3'].forEach((v) {
        dataDT3!.add(new DataDT3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['Kabupaten'] = this.kabupaten;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
    data['PTQty1'] = this.pTQty1;
    data['PTQty2'] = this.pTQty2;
    data['PTQty3'] = this.pTQty3;
    if (this.dataDT3 != null) {
      data['DataDT3'] = this.dataDT3!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDT3 {
  String? territori;
  String? bigArea;
  String? kabupaten;
  String? customerID;
  String? cName;
  double? qty1 = 0.00;
  double? qty2 = 0.00;
  double? qty3 = 0.00;
  double? vSLM = 0.00;
  double? lY = 0.00;
  double? vSLY = 0.00;
  double? tQty1 = 0.00;
  double? tQty2 = 0.00;
  double? tQty3 = 0.00;
  double? pTQty1 = 0.00;
  double? pTQty2 = 0.00;
  double? pTQty3 = 0.00;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;

  DataDT3(
      {this.territori,
      this.bigArea,
      this.kabupaten,
      this.customerID,
      this.cName,
      this.qty1,
      this.qty2,
      this.qty3,
      this.vSLM,
      this.lY,
      this.vSLY,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.pTQty1,
      this.pTQty2,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY,
      this.pTQty3});

  DataDT3.fromJson(Map<String, dynamic> json) {
    var f = NumberFormat("0.0", "en_US");

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

    territori = json['Territori'];
    bigArea = json['BigArea'];
    kabupaten = json['Kabupaten'];
    customerID = json['CustomerID'];
    cName = json['CName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = double.parse(f.format(json['VSLM'] * 100));
    lY = json['LY'];
    vSLY = double.parse(f.format(json['VSLY'] * 100));
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = double.parse(f.format(json['PTQty1'])) * 100;
    pTQty2 = double.parse(f.format(json['PTQty2'])) * 100;
    pTQty3 = double.parse(f.format(json['PTQty3'])) * 100;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['Kabupaten'] = this.kabupaten;
    data['CustomerID'] = this.customerID;
    data['CName'] = this.cName;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['VSLM'] = this.vSLM;
    data['LY'] = this.lY;
    data['VSLY'] = this.vSLY;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
    data['PTQty1'] = this.pTQty1;
    data['PTQty2'] = this.pTQty2;
    data['PTQty3'] = this.pTQty3;
    return data;
  }
}
