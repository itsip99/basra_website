class DetailDashboard5 {
  String plateNo;
  String unitId;
  String chasisNo;
  String engineNo;
  String color;
  String year;
  int adaGambar;
  int line;

  DetailDashboard5({
    required this.plateNo,
    required this.unitId,
    required this.chasisNo,
    required this.engineNo,
    required this.color,
    required this.year,
    required this.adaGambar,
    required this.line,
  });

  factory DetailDashboard5.fromJson(Map<String, dynamic> json) {
    return DetailDashboard5(
      plateNo: json['plateNo'],
      unitId: json['unitID'],
      chasisNo: json['chasisNo'],
      engineNo: json['engineNo'],
      color: json['color'],
      year: json['year'],
      adaGambar: json['adaGambar'],
      line: json['line'],
    );
  }
}
