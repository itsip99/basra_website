class ModelWeeklyReport {
  String province;
  String area;
  String branch;
  String shopId;
  String shopName;
  String actId;
  String actName;
  String currentDate;
  String day;
  String employeeID;
  String employeeName;
  int isActAvailable;
  int isLate;
  int total;

  ModelWeeklyReport({
    required this.province,
    required this.area,
    required this.branch,
    required this.shopId,
    required this.shopName,
    required this.actId,
    required this.actName,
    required this.currentDate,
    required this.day,
    required this.employeeID,
    required this.employeeName,
    required this.isActAvailable,
    required this.isLate,
    this.total = 0,
  });

  factory ModelWeeklyReport.fromJson(Map<String, dynamic> json) {
    return ModelWeeklyReport(
      province: json['bigArea'],
      area: json['smallArea'],
      branch: json['branch'],
      shopId: json['shop'],
      shopName: json['bsName'],
      actId: json['activityID'],
      actName: json['activityName'],
      currentDate: json['currentDate'],
      day: json['hari'],
      employeeID: json['employeeID'],
      employeeName: json['eName'],
      isActAvailable: json['activity'],
      isLate: json['flag'],
    );
  }
}
