import 'package:stsj/dashboard-fixup/models/dashboard.dart';

class Dashboard4 extends Dashboard {
  String branch;
  String shop;
  String bName;
  String bsName;
  int line;
  String rowName;

  Dashboard4({
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
  });

  factory Dashboard4.fromJson(Map<String, dynamic> json) {
    return Dashboard4(
      branch: json['branch'],
      shop: json['shop'],
      bName: json['bName'],
      bsName: json['bsName'],
      line: json['line'],
      rowName: json['rowName'],
      h1: json['h1'].toString().split('.')[0],
      h2: json['h2'].toString().split('.')[0],
      h3: json['h3'].toString().split('.')[0],
      h4: json['h4'].toString().split('.')[0],
      h5: json['h5'].toString().split('.')[0],
      h6: json['h6'].toString().split('.')[0],
      h7: json['h7'].toString().split('.')[0],
      h8: json['h8'].toString().split('.')[0],
      h9: json['h9'].toString().split('.')[0],
      h10: json['h10'].toString().split('.')[0],
      h11: json['h11'].toString().split('.')[0],
      h12: json['h12'].toString().split('.')[0],
    );
  }
}
