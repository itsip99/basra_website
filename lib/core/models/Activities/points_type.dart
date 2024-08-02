import 'package:stsj/core/models/Activities/point_calculation.dart';

class ModelPointsType {
  String date;
  List<ModelPointCalculation> morningBriefing;
  List<ModelPointCalculation> visitMarket;
  List<ModelPointCalculation> recruitmentInterview;
  List<ModelPointCalculation> dailyReport;

  ModelPointsType({
    required this.date,
    required this.morningBriefing,
    required this.visitMarket,
    required this.recruitmentInterview,
    required this.dailyReport,
  });
}
