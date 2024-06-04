class Dashboard {
  String dpackId;
  String territori;
  String cName;
  String cDistrict;
  String groupDealer;
  String area;
  String asd;
  int ksg1;
  int ksg2;
  int ksg3;
  int ksg4;
  int ksg;
  int ksb;
  int unitEntry;
  int labourCost;
  int workshopPart;
  int workshopOli;
  int retailPart;
  int retailOli;
  int omzet;
  int workshopSpu;
  int labourSpu;
  int workshopPartSpu;
  int workshopOliSpu;
  int spu;
  int rtu;

  Dashboard({
    required this.dpackId,
    required this.territori,
    required this.cName,
    required this.cDistrict,
    required this.groupDealer,
    required this.area,
    required this.asd,
    required this.ksg1,
    required this.ksg2,
    required this.ksg3,
    required this.ksg4,
    required this.ksg,
    required this.ksb,
    required this.unitEntry,
    required this.labourCost,
    required this.workshopPart,
    required this.workshopOli,
    required this.retailPart,
    required this.retailOli,
    required this.omzet,
    required this.workshopSpu,
    required this.labourSpu,
    required this.workshopPartSpu,
    required this.workshopOliSpu,
    required this.spu,
    required this.rtu,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      dpackId: json['dPackID'],
      territori: json['territori'],
      cName: json['cName'],
      cDistrict: json['cDistrict'],
      groupDealer: json['groupDealer'],
      area: json['area'],
      asd: json['asd'],
      ksg1: json['ksG1'],
      ksg2: json['ksG2'],
      ksg3: json['ksG3'],
      ksg4: json['ksG4'],
      ksg: json['ksg'],
      ksb: json['ksb'],
      unitEntry: json['unitEntry'],
      labourCost: json['labourCost'],
      workshopPart: json['workshopPart'],
      workshopOli: json['workshopOli'],
      retailPart: json['retailPart'],
      retailOli: json['retailOli'],
      omzet: json['omzet'],
      workshopSpu: json['workshopSPU'],
      labourSpu: json['labourSPU'],
      workshopPartSpu: json['workshopPartSPU'],
      workshopOliSpu: json['workshopOliSPU'],
      spu: json['spu'],
      rtu: json['rtu'],
    );
  }
}
