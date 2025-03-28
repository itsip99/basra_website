class DetailDashboard1 {
  String branch;
  String shop;
  String bsName;
  int unitEntryLyBS;
  int unitEntryLmBS;
  int unitEntryTmBS;
  int omsetLyBS;
  int omsetLmBS;
  int omsetTmBS;
  int lyPBS;
  int lmPBS;
  int tmPBS;
  int lyPSBS;
  int lmPSBS;
  int tmPSBS;
  int lySBS;
  int lmSBS;
  int tmSBS;

  DetailDashboard1({
    required this.branch,
    required this.shop,
    required this.bsName,
    required this.unitEntryLyBS,
    required this.unitEntryLmBS,
    required this.unitEntryTmBS,
    required this.omsetLyBS,
    required this.omsetLmBS,
    required this.omsetTmBS,
    required this.lyPBS,
    required this.lmPBS,
    required this.tmPBS,
    required this.lyPSBS,
    required this.lmPSBS,
    required this.tmPSBS,
    required this.lySBS,
    required this.lmSBS,
    required this.tmSBS,
  });

  factory DetailDashboard1.fromJson(Map<String, dynamic> json) {
    return DetailDashboard1(
      branch: json['branch'],
      shop: json['shop'],
      bsName: json['bsName'],
      unitEntryLyBS: json['unitEntryLyBS'],
      unitEntryLmBS: json['unitEntryLmBS'],
      unitEntryTmBS: json['unitEntryTMBS'],
      omsetLyBS: json['omsetLyBS'],
      omsetLmBS: json['omsetLmBS'],
      omsetTmBS: json['omsetTmBS'],
      lyPBS: json['lyPBS'],
      lmPBS: json['lmPBS'],
      tmPBS: json['tmpbs'],
      lyPSBS: json['lyPSBS'],
      lmPSBS: json['lmPSBS'],
      tmPSBS: json['tmPSBS'],
      lySBS: json['lySBS'],
      lmSBS: json['lmSBS'],
      tmSBS: json['tmSBS'],
    );
  }
}
