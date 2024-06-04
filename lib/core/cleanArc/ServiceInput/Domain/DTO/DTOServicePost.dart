class ServicePOSTModel {
  String? dPackID;
  String? tahun;
  String? bulan;
  int? mekanik;
  double? kSG1;
  double? kSG2;
  double? kSG3;
  double? kSG4;
  double? unitEntry;
  double? labour;
  int? workshopPart;
  double? workshopOli;
  double? retailPart;
  double? retailOli;
  String? userID;

  ServicePOSTModel(
      {this.dPackID,
      this.tahun,
      this.bulan,
      this.mekanik,
      this.kSG1,
      this.kSG2,
      this.kSG3,
      this.kSG4,
      this.unitEntry,
      this.labour,
      this.workshopPart,
      this.workshopOli,
      this.retailPart,
      this.retailOli,
      this.userID});

  ServicePOSTModel.fromJson(Map<String, dynamic> json) {
    dPackID = json['DPackID'];
    tahun = json['Tahun'];
    bulan = json['Bulan'];
    mekanik = json['Mekanik'];
    kSG1 = json['KSG1'];
    kSG2 = json['KSG2'];
    kSG3 = json['KSG3'];
    kSG4 = json['KSG4'];
    unitEntry = json['UnitEntry'];
    labour = json['Labour'];
    workshopPart = json['WorkshopPart'];
    workshopOli = json['WorkshopOli'];
    retailPart = json['RetailPart'];
    retailOli = json['RetailOli'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DPackID'] = this.dPackID;
    data['Tahun'] = this.tahun;
    data['Bulan'] = this.bulan;
    data['Mekanik'] = this.mekanik;
    data['KSG1'] = this.kSG1;
    data['KSG2'] = this.kSG2;
    data['KSG3'] = this.kSG3;
    data['KSG4'] = this.kSG4;
    data['UnitEntry'] = this.unitEntry;
    data['Labour'] = this.labour;
    data['WorkshopPart'] = this.workshopPart;
    data['WorkshopOli'] = this.workshopOli;
    data['RetailPart'] = this.retailPart;
    data['RetailOli'] = this.retailOli;
    data['UserID'] = this.userID;
    return data;
  }
}
