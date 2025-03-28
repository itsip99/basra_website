import 'package:stsj/dashboard-fixup/models/dashboard.dart';

class Dashboard2 extends Dashboard {
  String branch;
  String shop;
  String bName;
  String bsName;
  int line;
  String rowName;

  Dashboard2({
    required this.branch,
    required this.shop,
    required this.bName,
    required this.bsName,
    required this.line,
    required this.rowName,
    required super.h1,
    required super.h2,
    required super.h3,
    required super.h4,
    required super.h5,
    required super.h6,
    required super.h7,
    required super.h8,
    required super.h9,
    required super.h10,
    required super.h11,
    required super.h12,
    required super.h13,
    required super.h14,
    required super.h15,
    required super.h16,
    required super.h17,
    required super.h18,
    required super.h19,
    required super.h20,
    required super.h21,
    required super.h22,
    required super.h23,
    required super.h24,
    required super.h25,
    required super.h26,
    required super.h27,
    required super.h28,
    required super.h29,
    required super.h30,
    required super.h31,
  });

  factory Dashboard2.fromJson(Map<String, dynamic> json) {
    return Dashboard2(
      branch: json['branch'],
      shop: json['shop'],
      bName: json['bName'],
      bsName: json['bsName'],
      line: json['line'],
      rowName: json['rowName'],
      h1: json['h1'],
      h2: json['h2'],
      h3: json['h3'],
      h4: json['h4'],
      h5: json['h5'],
      h6: json['h6'],
      h7: json['h7'],
      h8: json['h8'],
      h9: json['h9'],
      h10: json['h10'],
      h11: json['h11'],
      h12: json['h12'],
      h13: json['h13'],
      h14: json['h14'],
      h15: json['h15'],
      h16: json['h16'],
      h17: json['h17'],
      h18: json['h18'],
      h19: json['h19'],
      h20: json['h20'],
      h21: json['h21'],
      h22: json['h22'],
      h23: json['h23'],
      h24: json['h24'],
      h25: json['h25'],
      h26: json['h26'],
      h27: json['h27'],
      h28: json['h28'],
      h29: json['h29'],
      h30: json['h30'],
      h31: json['h31'],
    );
  }
}
