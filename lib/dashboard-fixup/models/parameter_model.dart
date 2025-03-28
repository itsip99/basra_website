class Parameter {
  String branch;
  String shop;
  String tanggal;
  int sa;
  int mekanik;
  double hariKerja;
  double rut;

  Parameter({
    required this.branch,
    required this.shop,
    required this.tanggal,
    required this.sa,
    required this.mekanik,
    required this.hariKerja,
    required this.rut,
  });

  factory Parameter.fromJson(List<String> json) {
    return Parameter(
      branch: json[0],
      shop: json[1],
      tanggal: json[2],
      sa: int.parse(json[3]),
      mekanik: int.parse(json[4]),
      hariKerja: double.parse(json[5]),
      rut: double.parse(json[6]),
    );
  }
}
