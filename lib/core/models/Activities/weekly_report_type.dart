import 'package:stsj/core/models/Activities/weekly_report.dart';

class ModelWeeklyReportType {
  String branchName;
  List<ModelWeeklyReport> morningBriefing;
  List<ModelWeeklyReport> visitMarket;
  List<ModelWeeklyReport> recruitmentInterview;
  List<ModelWeeklyReport> dailyReport;

  ModelWeeklyReportType({
    required this.branchName,
    required this.morningBriefing,
    required this.visitMarket,
    required this.recruitmentInterview,
    required this.dailyReport,
  });
}
