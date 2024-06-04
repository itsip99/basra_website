class DataMotorcycleHistory {
  String chasisno;
  String engineno;
  String unitid;
  String itemname;
  String color;
  String colorname;
  String year;
  List<Detail> detail;

  DataMotorcycleHistory(
      {required this.chasisno,
      required this.engineno,
      required this.unitid,
      required this.itemname,
      required this.color,
      required this.colorname,
      required this.year,
      required this.detail});

  factory DataMotorcycleHistory.fromJson(Map<String, dynamic> json) {
    var list = json['Detail'] as List;
    List<Detail> detaillist =
        list.map((data) => Detail.fromJson(data)).toList();

    return DataMotorcycleHistory(
        chasisno: json['ChasisNO'],
        engineno: json['EngineNO'],
        unitid: json['UnitID'],
        itemname: json['ItemName'],
        color: json['Color'],
        colorname: json['ColorName'],
        year: json['Year'],
        detail: detaillist);
  }
}

class Detail {
  String bsname;
  String transno;
  String transdate;
  String trans;
  int line;

  Detail({
    required this.bsname,
    required this.transno,
    required this.transdate,
    required this.trans,
    required this.line,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      bsname: json['BSName'],
      transno: json['TransNO'],
      transdate: json['TransDate'],
      trans: json['Trans'],
      line: json['Line'],
    );
  }
}

class DataServiceHistory {
  String chasisno;
  String engineno;
  String plateno;
  String unitid;
  String color;
  String colorname;
  String year;
  String unpwp;
  String uname;
  String uaddress;
  String uzipcode;
  String ubirthday;
  String ureligion;
  String religionname;
  String uvillage;
  String usubdistrict;
  String ucity;
  String uprovince;
  String uphone;
  String uhp;
  String tglfaktur;

  DataServiceHistory(
      {required this.chasisno,
      required this.engineno,
      required this.plateno,
      required this.unitid,
      required this.color,
      required this.colorname,
      required this.year,
      required this.unpwp,
      required this.uname,
      required this.uaddress,
      required this.uzipcode,
      required this.ubirthday,
      required this.ureligion,
      required this.religionname,
      required this.uvillage,
      required this.usubdistrict,
      required this.ucity,
      required this.uprovince,
      required this.uphone,
      required this.uhp,
      required this.tglfaktur});

  factory DataServiceHistory.fromJson(Map<String, dynamic> json) {
    return DataServiceHistory(
      chasisno: json['ChasisNO'],
      engineno: json['EngineNO'],
      plateno: json['PlateNO'],
      unitid: json['UnitID'],
      color: json['Color'],
      colorname: json['ColorName'],
      year: json['Year'],
      unpwp: json['uNPWP'],
      uname: json['uName'],
      uaddress: json['uAddress'],
      uzipcode: json['uZipCode'],
      ubirthday: json['uBirthday'],
      ureligion: json['uReligion'],
      religionname: json['ReligionName'],
      uvillage: json['uVillage'],
      usubdistrict: json['uSubDistrict'],
      ucity: json['uCity'],
      uprovince: json['uProvince'],
      uphone: json['uPhone'],
      uhp: json['uHP'],
      tglfaktur: json['TglFaktur'],
    );
  }
}
