class PickPackModel {
  int tdu;
  int tLine;
  int tLeadTime;
  double avgLeadTime;
  int diff;
  double avgDiff;
  double tAmount;
  int onGoingDU;
  int onGoingLine;
  double onGoingAmount;
  String time;

  PickPackModel({
    required this.tdu,
    required this.tLine,
    required this.tLeadTime,
    required this.avgLeadTime,
    required this.diff,
    required this.avgDiff,
    required this.tAmount,
    required this.onGoingDU,
    required this.onGoingLine,
    required this.onGoingAmount,
    required this.time,
  });

  factory PickPackModel.fromJson(Map<String, dynamic> json) {
    return PickPackModel(
      tdu: json['tdu'],
      tLine: json['tLine'],
      tLeadTime: json['tLeadTime'],
      avgLeadTime: json['avgLeadTime'],
      diff: json['jeda'],
      avgDiff: json['avgJeda'],
      tAmount: json['tAmount'],
      onGoingDU: json['onGoingDU'],
      onGoingLine: json['onGoingLine'],
      onGoingAmount: json['onGoingAmount'],
      time: json['awal'],
    );
  }
}

class PickPackDetailsModel {
  String duNo;
  String pic;
  String startTime;
  String endTime;
  int line;
  int diff;
  int leadTime;
  double amount;

  PickPackDetailsModel({
    required this.duNo,
    required this.pic,
    required this.startTime,
    required this.endTime,
    required this.line,
    required this.diff,
    required this.leadTime,
    required this.amount,
  });

  factory PickPackDetailsModel.fromJson(Map<String, dynamic> json) {
    return PickPackDetailsModel(
      duNo: json['duNo'],
      pic: json['pic'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      line: json['line'],
      diff: json['jeda'],
      leadTime: json['leadTime'],
      amount: json['amount'],
    );
  }
}
