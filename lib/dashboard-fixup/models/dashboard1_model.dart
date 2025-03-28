import 'package:stsj/dashboard-fixup/models/detail_dashboard1_model.dart';

class Dashboard1 {
  int unitEntryLy;
  int unitEntryLm;
  int unitEntryTm;
  int memberLy;
  int memberLm;
  int memberTm;
  int omsetLy;
  int omsetLm;
  int omsetTm;
  int lyP;
  int lmP;
  int tmP;
  int lyPS;
  int lmPS;
  int tmPS;
  int lyS;
  int lmS;
  int tmS;
  List<DetailDashboard1> detail;

  Dashboard1({
    required this.unitEntryLy,
    required this.unitEntryLm,
    required this.unitEntryTm,
    required this.memberLy,
    required this.memberLm,
    required this.memberTm,
    required this.omsetLy,
    required this.omsetLm,
    required this.omsetTm,
    required this.lyP,
    required this.lmP,
    required this.tmP,
    required this.lyPS,
    required this.lmPS,
    required this.tmPS,
    required this.lyS,
    required this.lmS,
    required this.tmS,
    required this.detail,
  });

  factory Dashboard1.fromJson(Map<String, dynamic> json) {
    return Dashboard1(
      unitEntryLy: json['unitEntryLy'],
      unitEntryLm: json['unitEntryLm'],
      unitEntryTm: json['unitEntryTm'],
      memberLy: json['memberLy'],
      memberLm: json['memberLm'],
      memberTm: json['memberTm'],
      omsetLy: json['omsetLy'],
      omsetLm: json['omsetLm'],
      omsetTm: json['omsetTm'],
      lyP: json['lyP'],
      lmP: json['lmP'],
      tmP: json['tmP'],
      lyPS: json['lyPS'],
      lmPS: json['lmPS'],
      tmPS: json['tmPS'],
      lyS: json['lyS'],
      lmS: json['lmS'],
      tmS: json['tmS'],
      detail: (json['detail'] as List)
          .map<DetailDashboard1>((x) => DetailDashboard1.fromJson(x))
          .toList(),
    );
  }
}
