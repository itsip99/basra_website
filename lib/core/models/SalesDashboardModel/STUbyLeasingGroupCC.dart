import 'package:stsj/core/service/ReusableService.dart';

class GroupCC {
  int? qty1;
  int? qty2;
  int? qty3;
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;
  List<Detail>? detail;

  GroupCC(
      {this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2,
      this.detail});

  GroupCC.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }

    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1']) * 100;
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1']) * 100;
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2']) * 100;
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3']) * 100;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2']) * 100;
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1']) * 100;
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2']) * 100;
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3']) * 100;
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
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
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;
  List<DataDT2>? dataDT2;

  Detail(
      {this.territori,
      this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2,
      this.dataDT2});

  Detail.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }

    territori = json['Territori'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1'] * 100);
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1'] * 100);
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2'] * 100);
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3'] * 100);
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2'] * 100);
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1'] * 100);
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2'] * 100);
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3'] * 100);
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
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
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;
  List<DataDT3>? dataDT3;

  DataDT2(
      {this.territori,
      this.bigArea,
      this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2,
      this.dataDT3});

  DataDT2.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }

    territori = json['Territori'];
    bigArea = json['BigArea'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1']) * 100;
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1']) * 100;
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2']) * 100;
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3']) * 100;
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2']) * 100;
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1']) * 100;
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2']) * 100;
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3']) * 100;
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
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
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;
  List<DataDT4>? dataDT4;

  DataDT3(
      {this.territori,
      this.bigArea,
      this.groupBigName,
      this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2,
      this.dataDT4});

  DataDT3.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }

    territori = json['Territori'];
    bigArea = json['BigArea'];
    groupBigName = json['GroupBigName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1']) * 100;
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1']) * 100;
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2']) * 100;
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3']) * 100;
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2']) * 100;
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1']) * 100;
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2']) * 100;
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3']) * 100;
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
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
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;
  List<DataDT5>? dataDT5;

  DataDT4(
      {this.territori,
      this.bigArea,
      this.groupBigName,
      this.groupName,
      this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2,
      this.dataDT5});

  DataDT4.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }
    territori = json['Territori'];
    bigArea = json['BigArea'];
    groupBigName = json['GroupBigName'];
    groupName = json['GroupName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1']) * 100;
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1']) * 100;
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2']) * 100;
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3']) * 100;
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2']) * 100;
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1']) * 100;
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2']) * 100;
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3']) * 100;
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
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
  double? growth1;
  double? share1;
  double? share2;
  double? share3;
  int? kQty1;
  int? kQty2;
  int? kQty3;
  double? growth2;
  double? kShare1;
  double? kShare2;
  double? kShare3;
  double? tQty1;
  double? tQty2;
  double? tQty3;
  String? UrlGambarGrow1;
  String? UrlGambarGrow2;

  DataDT5(
      {this.territori,
      this.bigArea,
      this.groupBigName,
      this.groupName,
      this.cName,
      this.qty1,
      this.qty2,
      this.qty3,
      this.growth1,
      this.share1,
      this.share2,
      this.share3,
      this.kQty1,
      this.kQty2,
      this.kQty3,
      this.growth2,
      this.kShare1,
      this.kShare2,
      this.kShare3,
      this.tQty1,
      this.tQty2,
      this.tQty3,
      this.UrlGambarGrow1,
      this.UrlGambarGrow2});

  DataDT5.fromJson(Map<String, dynamic> json) {
    String TempGrow1;
    String TempGrow2;
    if ((json['Growth1'] * 100) > 100) {
      TempGrow1 = "assets/images/icon-up.png";
    } else {
      TempGrow1 = "assets/images/icon-down.png";
    }

    if ((json['Growth2'] * 100) > 100) {
      TempGrow2 = "assets/images/icon-up.png";
    } else {
      TempGrow2 = "assets/images/icon-down.png";
    }
    territori = json['Territori'];
    bigArea = json['BigArea'];
    groupBigName = json['GroupBigName'];
    groupName = json['GroupName'];
    cName = json['CName'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    growth1 = ServiceReusable.parseAndHandleNaNPercent(json['Growth1']) * 100;
    share1 = ServiceReusable.parseAndHandleNaNPercent(json['Share1']) * 100;
    share2 = ServiceReusable.parseAndHandleNaNPercent(json['Share2']) * 100;
    share3 = ServiceReusable.parseAndHandleNaNPercent(json['Share3']) * 100;
    kQty1 = json['KQty1'];
    kQty2 = json['KQty2'];
    kQty3 = json['KQty3'];
    UrlGambarGrow1 = TempGrow1;
    UrlGambarGrow2 = TempGrow2;
    growth2 = ServiceReusable.parseAndHandleNaNPercent(json['Growth2']) * 100;
    kShare1 = ServiceReusable.parseAndHandleNaNPercent(json['KShare1']) * 100;
    kShare2 = ServiceReusable.parseAndHandleNaNPercent(json['KShare2']) * 100;
    kShare3 = ServiceReusable.parseAndHandleNaNPercent(json['KShare3']) * 100;
    tQty1 = ServiceReusable.parseAndHandleNaNPercent(json['TQty1']);
    tQty2 = ServiceReusable.parseAndHandleNaNPercent(json['TQty2']);
    tQty3 = ServiceReusable.parseAndHandleNaNPercent(json['TQty3']);
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
    data['Growth1'] = this.growth1;
    data['Share1'] = this.share1;
    data['Share2'] = this.share2;
    data['Share3'] = this.share3;
    data['KQty1'] = this.kQty1;
    data['KQty2'] = this.kQty2;
    data['KQty3'] = this.kQty3;
    data['Growth2'] = this.growth2;
    data['KShare1'] = this.kShare1;
    data['KShare2'] = this.kShare2;
    data['KShare3'] = this.kShare3;
    data['TQty1'] = this.tQty1;
    data['TQty2'] = this.tQty2;
    data['TQty3'] = this.tQty3;
    return data;
  }
}
