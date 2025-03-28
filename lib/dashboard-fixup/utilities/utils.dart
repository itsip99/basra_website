import 'package:stsj/dashboard-fixup/models/dashboard.dart';
import 'package:stsj/dashboard-fixup/models/dashboard3_model.dart';

List<Map<String, String>> dashboardList = [
  {'id': '1', 'text': 'DASHBOARD', 'acc': '000'},
  {'id': '2', 'text': 'DAILY BENGKEL', 'acc': '050'},
  {'id': '3', 'text': 'DAILY MEKANIK', 'acc': '051'},
  {'id': '4', 'text': 'MONTHLY BENGKEL', 'acc': '052'},
  {'id': '5', 'text': 'MEMBER REPORT', 'acc': '000'},
];

List<Map<String, String>> bengkelList = [
  {'id': '3101', 'text': 'KUTISARI'},
  {'id': '3102', 'text': 'DARMO'},
  {'id': '3103', 'text': 'GEDANGAN'},
  {'id': '3104', 'text': 'SUKO'},
  {'id': '3105', 'text': 'RUNGKUT'},
  {'id': '3106', 'text': 'KEDUNG TARUKAN'},
];

List<String> listBulan = [
  'JANUARI',
  'FEBRUARI',
  'MARET',
  'APRIL',
  'MEI',
  'JUNI',
  'JULI',
  'AGUSTUS',
  'SEPTEMBER',
  'OKTOBER',
  'NOVEMBER',
  'DESEMBER'
];

String sumList(List<Dashboard> list, int idx) {
  int tmp = 0;
  for (Dashboard data in list) {
    tmp = tmp + int.parse(Dashboard.toJson(data)['h${idx + 1}']);
  }
  return tmp.toString();
}

String sumModel(Dashboard data, int totalHari) {
  double tmp = 0;
  for (var i = 0; i < totalHari; i++) {
    tmp = tmp + double.parse(Dashboard.toJson(data)['h${i + 1}']);
  }
  return tmp.toString();
}

String averageModel(Dashboard data, int totalHari) {
  double tmp = 0;
  for (var i = 0; i < totalHari; i++) {
    tmp = tmp + double.parse(Dashboard.toJson(data)['h${i + 1}']);
  }
  return (tmp / totalHari).toString();
}

String sumTotalList(List<Dashboard> list, int totalHari) {
  int tmp = 0;
  for (var i = 0; i < totalHari; i++) {
    for (Dashboard data in list) {
      tmp = tmp + int.parse(Dashboard.toJson(data)['h${i + 1}']);
    }
  }
  return tmp.toString();
}

String averageTotalList(List<Dashboard> list, int totalHari) {
  double tmp = 0;
  for (Dashboard data in list) {
    for (var i = 0; i < totalHari; i++) {
      tmp = tmp + double.parse(Dashboard.toJson(data)['h${i + 1}']);
    }
  }
  return (tmp / (totalHari * list.length)).toString();
}

String sumTarget(List<Dashboard3> list) {
  int tmp = 0;
  for (Dashboard3 data in list) {
    tmp = tmp + int.parse(data.targetMekanik);
  }

  return tmp.toString();
}

String averageRUT(
    List<Dashboard3> list, int totalHari, List<Dashboard3> listUnitEntry) {
  int tmp = 0;
  for (Dashboard3 data in list) {
    tmp = tmp +
        (int.parse(sumModel(data, totalHari))) ~/
            int.parse(sumModel(
                listUnitEntry
                    .firstWhere((element) => element.eName == data.eName),
                totalHari));
  }

  return (tmp ~/ list.length).toString();
}

String sumRUT(List<Dashboard3> list, int totalHari) {
  int tmp = 0;
  for (Dashboard3 data in list) {
    tmp = tmp + int.parse(averageModel(data, totalHari).split('.')[0]);
  }

  return tmp.toString();
}

String sumTotalSPU(List<Dashboard3> listSpu, int totalHari,
    List<Dashboard3> listIncome, List<Dashboard3> listUnitEntry) {
  int tmp = 0;
  for (Dashboard3 data in listSpu) {
    tmp = tmp +
        ((int.parse(sumModel(
                listIncome.firstWhere((element) => element.eName == data.eName),
                totalHari))) ~/
            int.parse(sumModel(
                listUnitEntry
                    .firstWhere((element) => element.eName == data.eName),
                totalHari)));
  }

  return tmp.toString();
}
