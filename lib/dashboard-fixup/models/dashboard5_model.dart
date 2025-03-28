import 'package:stsj/dashboard-fixup/models/detail_dashboard5_model.dart';

class Dashboard5 {
  String memberId;
  String memberName;
  String phoneNo;
  String emailAddress;
  int qtyMotor;
  int pointQty;
  String lastVisit;
  String lastVisitDealer;
  double lastVisitAmount;
  int totalVisit;
  double totalAmount;
  int dealerVisited;
  List<DetailDashboard5> detail;

  Dashboard5({
    required this.memberId,
    required this.memberName,
    required this.phoneNo,
    required this.emailAddress,
    required this.qtyMotor,
    required this.pointQty,
    required this.lastVisit,
    required this.lastVisitDealer,
    required this.lastVisitAmount,
    required this.totalVisit,
    required this.totalAmount,
    required this.dealerVisited,
    required this.detail,
  });

  factory Dashboard5.fromJson(Map<String, dynamic> json) {
    return Dashboard5(
      memberId: json['memberID'],
      memberName: json['memberName'],
      phoneNo: json['phoneNo'],
      emailAddress: json['emailAddress'],
      qtyMotor: json['qtyMotor'],
      pointQty: json['pointQty'],
      lastVisit: json['lastVisit'],
      lastVisitDealer: json['lastVisitDealer'],
      lastVisitAmount: json['lastVisitAmount'],
      totalVisit: json['totalVisit'],
      totalAmount: json['totalAmount'],
      dealerVisited: json['dealerVisited'],
      detail: (json['detail'] as List)
          .map<DetailDashboard5>((x) => DetailDashboard5.fromJson(x))
          .toList(),
    );
  }
}
