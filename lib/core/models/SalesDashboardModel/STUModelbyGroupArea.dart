import 'package:stsj/core/service/ReusableService.dart';

class SalesGroupByArea {
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  List<Detail>? detail;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;

  SalesGroupByArea(
      {this.qty1,
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

  SalesGroupByArea.fromJson(Map<String, dynamic> json) {
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

    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM']) * 100;
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY']) * 100;
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1']);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2']);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3']);
    if (json['Detail'] != null) {
      detail = <Detail>[];
      json['Detail'].forEach((v) {
        detail!.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  int? tQty1;
  int? tQty2;
  int? tQty3;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  List<DataDT2>? dataDT2;

  Detail(
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
      this.dataDT2,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY});

  Detail.fromJson(Map<String, dynamic> json) {
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
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100);
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100);
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1'] * 100);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2'] * 100);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3'] * 100);
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
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<DataDT3>? dataDT3;

  DataDT2(
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
      this.UrlGambarVZLM,
      this.UrlGambarVZLY,
      this.dataDT3});

  DataDT2.fromJson(Map<String, dynamic> json) {
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
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100);
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100);
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1'] * 100);
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1'] * 100);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2'] * 100);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3'] * 100);
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
  String? groupBigName;
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  int? tQty1;
  int? tQty2;
  int? tQty3;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  List<DataDT4>? dataDT4;

  DataDT3(
      {this.territori,
      this.bigArea,
      this.groupBigName,
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
      this.dataDT4});

  DataDT3.fromJson(Map<String, dynamic> json) {
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
    groupBigName = json['GroupBigName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100);
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100);
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1'] * 100);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2'] * 100);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3'] * 100);
    if (json['DataDT4'] != null) {
      dataDT4 = <DataDT4>[];
      json['DataDT4'].forEach((v) {
        dataDT4!.add(new DataDT4.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['GroupBigName'] = this.groupBigName;
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
    if (this.dataDT4 != null) {
      data['DataDT4'] = this.dataDT4!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDT4 {
  String? territori;
  String? bigArea;
  String? groupBigName;
  String? groupName;
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  int? tQty1;
  int? tQty2;
  int? tQty3;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;
  List<DataDT5>? dataDT5;

  DataDT4(
      {this.territori,
      this.bigArea,
      this.groupBigName,
      this.groupName,
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
      this.dataDT5});

  DataDT4.fromJson(Map<String, dynamic> json) {
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
    groupBigName = json['GroupBigName'];
    groupName = json['GroupName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM']);
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY']);
    tQty1 = json['TQty1'];
    tQty2 = json['TQty2'];
    tQty3 = json['TQty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1']);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2']);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3']);
    if (json['DataDT5'] != null) {
      dataDT5 = <DataDT5>[];
      json['DataDT5'].forEach((v) {
        dataDT5!.add(new DataDT5.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['GroupBigName'] = this.groupBigName;
    data['GroupName'] = this.groupName;
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
    if (this.dataDT5 != null) {
      data['DataDT5'] = this.dataDT5!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDT5 {
  String? territori;
  String? bigArea;
  String? groupBigName;
  String? groupName;
  String? cName;
  int? qty1;
  int? qty2;
  int? qty3;
  double? vSLM;
  int? lY;
  double? vSLY;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  double? pTQty1;
  double? pTQty2;
  double? pTQty3;
  String? UrlGambarVZLM;
  String? UrlGambarVZLY;

  DataDT5(
      {this.territori,
      this.bigArea,
      this.groupBigName,
      this.groupName,
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
      this.pTQty3,
      this.UrlGambarVZLM,
      this.UrlGambarVZLY});

  DataDT5.fromJson(Map<String, dynamic> json) {
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
    groupBigName = json['GroupBigName'];
    groupName = json['GroupName'];
    cName = json['CName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    UrlGambarVZLM = Temp;
    UrlGambarVZLY = TempLY;
    vSLM = ServiceReusable.parseAndHandleNaNPercent(json['VSLM'] * 100);
    lY = json['LY'];
    vSLY = ServiceReusable.parseAndHandleNaNPercent(json['VSLY'] * 100);
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1'] * 100);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2'] * 100);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3'] * 100);
    pTQty1 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty1'] * 100);
    pTQty2 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty2'] * 100);
    pTQty3 = ServiceReusable.parseAndHandleNaNPercent(json['PTQty3'] * 100);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Territori'] = this.territori;
    data['BigArea'] = this.bigArea;
    data['GroupBigName'] = this.groupBigName;
    data['GroupName'] = this.groupName;
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
