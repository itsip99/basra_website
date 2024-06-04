class ServiceReport {
  String? dPackID;
  String? territori;
  String? cName;
  String? cDistrict;
  String? groupDealer;
  String? area;
  String? asd;
  double? mekanik;
  double? ksG1;
  double? ksG2;
  double? ksG3;
  double? ksG4;
  double? unitEntry;
  double? labour;
  double? workshopPart;
  double? workshopOli;
  double? retailPart;
  double? retailOli;

  ServiceReport(
      {this.dPackID,
      this.territori,
      this.cName,
      this.cDistrict,
      this.groupDealer,
      this.area,
      this.asd,
      this.mekanik,
      this.ksG1,
      this.ksG2,
      this.ksG3,
      this.ksG4,
      this.unitEntry,
      this.labour,
      this.workshopPart,
      this.workshopOli,
      this.retailPart,
      this.retailOli});

  ServiceReport.fromJson(Map<String, dynamic> json) {
    dPackID = json['dPackID'];
    territori = json['territori'];
    cName = json['cName'];
    cDistrict = json['cDistrict'];
    groupDealer = json['groupDealer'];
    area = json['area'];
    asd = json['asd'];
    mekanik = json['mekanik'];
    ksG1 = json['ksG1'];
    ksG2 = json['ksG2'];
    ksG3 = json['ksG3'];
    ksG4 = json['ksG4'];
    unitEntry = json['unitEntry'];
    labour = json['labour'];
    workshopPart = json['workshopPart'];
    workshopOli = json['workshopOli'];
    retailPart = json['retailPart'];
    retailOli = json['retailOli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dPackID'] = this.dPackID;
    data['territori'] = this.territori;
    data['cName'] = this.cName;
    data['cDistrict'] = this.cDistrict;
    data['groupDealer'] = this.groupDealer;
    data['area'] = this.area;
    data['asd'] = this.asd;
    data['mekanik'] = this.mekanik;
    data['ksG1'] = this.ksG1;
    data['ksG2'] = this.ksG2;
    data['ksG3'] = this.ksG3;
    data['ksG4'] = this.ksG4;
    data['unitEntry'] = this.unitEntry;
    data['labour'] = this.labour;
    data['workshopPart'] = this.workshopPart;
    data['workshopOli'] = this.workshopOli;
    data['retailPart'] = this.retailPart;
    data['retailOli'] = this.retailOli;
    return data;
  }
}
