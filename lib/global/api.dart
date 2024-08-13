import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stsj/core/models/Activities/point_calculation.dart';
import 'package:stsj/core/models/Activities/activity_route.dart';
import 'package:stsj/core/models/Activities/area.dart';
import 'package:stsj/core/models/Activities/branch_shop.dart';
import 'package:stsj/core/models/Activities/manager_activities.dart';
import 'package:stsj/core/models/Activities/province.dart';
import 'package:stsj/core/models/Activities/return_result.dart';
import 'package:stsj/core/models/Activities/salesman.dart';
import 'package:stsj/core/models/Activities/salesman_activities.dart';
import 'package:stsj/core/models/Activities/weekly_report.dart';

class GlobalAPI {
  static Future<List<ModelActivityRoute>> fetchActivityRoute(
    String employeeID,
    String date,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/EmployeeActivityRoute',
    );

    Map mapActivityRoute = {
      "EmployeeID": employeeID,
      "CurrentDate": date,
    };

    List<ModelActivityRoute> activityRouteList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapActivityRoute), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonActivityRoute = jsonDecode(response.body);
        if (jsonActivityRoute['code'] == '100' &&
            jsonActivityRoute['msg'] == 'Sukses') {
          activityRouteList = (jsonActivityRoute['data'] as List)
              .map<ModelActivityRoute>(
                  (list) => ModelActivityRoute.fromJson(list))
              .toList();

          return activityRouteList;
        } else {
          return activityRouteList;
        }
      } else {}
      return activityRouteList;
    } catch (e) {
      print(e.toString());
      return activityRouteList;
    }
  }

  static Future<List<ModelSalesman>> fetchSalesman(
    String username,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/BrowseSalesman',
    );

    Map mapSalesman = {
      "UserID": username,
    };

    List<ModelSalesman> salesmanList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapSalesman), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonSalesman = jsonDecode(response.body);
        if (jsonSalesman['code'] == '100' && jsonSalesman['msg'] == 'Sukses') {
          salesmanList = (jsonSalesman['data'] as List)
              .map<ModelSalesman>((list) => ModelSalesman.fromJson(list))
              .toList();

          return salesmanList;
        } else {
          return salesmanList;
        }
      } else {}
      return salesmanList;
    } catch (e) {
      print(e.toString());
      return salesmanList;
    }
  }

  static Future<List<ModelSalesmanActivities>> fetchSalesmanActivities(
    String employeeID,
    String date,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/EmployeeActivity',
    );

    Map mapSalesmanActivities = {
      "EmployeeID": employeeID,
      "CurrentDate": date,
    };

    List<ModelSalesmanActivities> activityRouteList = [];

    try {
      final response = await http
          .post(url, body: jsonEncode(mapSalesmanActivities), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonSalesmanActivities = jsonDecode(response.body);
        if (jsonSalesmanActivities['code'] == '100' &&
            jsonSalesmanActivities['msg'] == 'Sukses') {
          activityRouteList = (jsonSalesmanActivities['data'] as List)
              .map<ModelSalesmanActivities>(
                  (list) => ModelSalesmanActivities.fromJson(list))
              .toList();

          return activityRouteList;
        } else {
          return activityRouteList;
        }
      } else {}
      return activityRouteList;
    } catch (e) {
      print(e.toString());
      return activityRouteList;
    }
  }

  static Future<List<ModelProvinces>> getProvinces(String userId) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/BrowseMBigArea',
    );

    Map mapGetProvinces = {
      "UserID": userId,
    };

    List<ModelProvinces> provinceList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapGetProvinces), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonProvinces = jsonDecode(response.body);
        if (jsonProvinces['code'] == '100' &&
            jsonProvinces['msg'] == 'Sukses') {
          provinceList.add(ModelProvinces(provinceName: ''));
          provinceList.addAll((jsonProvinces['data'] as List)
              .map<ModelProvinces>((list) => ModelProvinces.fromJson(list))
              .toList());

          return provinceList;
        } else {
          return provinceList;
        }
      } else {}
      return provinceList;
    } catch (e) {
      print(e.toString());
      return provinceList;
    }
  }

  static Future<List<ModelAreas>> getAreas(
    String userId,
    String province,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/BrowseMSmallArea',
    );

    Map mapAreas = {
      "UserID": userId,
      "BigArea": province,
    };

    List<ModelAreas> areaList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapAreas), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonAreas = jsonDecode(response.body);
        if (jsonAreas['code'] == '100' && jsonAreas['msg'] == 'Sukses') {
          areaList.add(ModelAreas(areaName: ''));
          areaList.addAll((jsonAreas['data'] as List)
              .map<ModelAreas>((list) => ModelAreas.fromJson(list))
              .toList());

          return areaList;
        } else {
          return areaList;
        }
      } else {}
      return areaList;
    } catch (e) {
      print(e.toString());
      return areaList;
    }
  }

  static Future<List<ModelManagerActivities>> fetchManagerActivities(
    String userid,
    String province,
    String area,
    String date,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/EmployeeActivitySMByArea',
    );

    Map mapManagerActivities = {
      "UserID": userid,
      "BigArea": province,
      "SmallArea": area,
      "CurrentDate": date,
    };

    List<ModelManagerActivities> manangerActivitiesList = [];

    try {
      final response = await http
          .post(url, body: jsonEncode(mapManagerActivities), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonManagerActivities = jsonDecode(response.body);
        if (jsonManagerActivities['code'] == '100' &&
            jsonManagerActivities['msg'] == 'Sukses') {
          manangerActivitiesList = (jsonManagerActivities['data'] as List)
              .map<ModelManagerActivities>(
                  (list) => ModelManagerActivities.fromJson(list))
              .toList();

          return manangerActivitiesList;
        } else {
          return manangerActivitiesList;
        }
      } else {}
      return manangerActivitiesList;
    } catch (e) {
      print(e.toString());
      return manangerActivitiesList;
    }
  }

  static Future<List<ModelWeeklyReport>> fetchWeeklyReport(
    String userid,
    String province,
    String area,
    String beginDate,
    String endDate,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/EmployeeActivitySMByAreaWeekly',
    );

    Map mapWeeklyReport = {
      "UserID": userid,
      "BigArea": province,
      "SmallArea": area,
      "BeginDate": beginDate,
      "EndDate": endDate,
    };

    List<ModelWeeklyReport> weeklyReportList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapWeeklyReport), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonWeeklyReport = jsonDecode(response.body);
        if (jsonWeeklyReport['code'] == '100' &&
            jsonWeeklyReport['msg'] == 'Sukses') {
          weeklyReportList = (jsonWeeklyReport['data'] as List)
              .map<ModelWeeklyReport>(
                  (list) => ModelWeeklyReport.fromJson(list))
              .toList();

          return weeklyReportList;
        } else {
          return weeklyReportList;
        }
      } else {}
      return weeklyReportList;
    } catch (e) {
      print(e.toString());
      return weeklyReportList;
    }
  }

  static Future<List<ModelBranchShop>> fetchBranchShop(
    String userid,
    String province,
    String area,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/BrowseMBranchShop',
    );

    Map mapWeeklyReport = {
      "UserID": userid,
      "BigArea": province,
      "SmallArea": area,
    };

    List<ModelBranchShop> branchShopList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapWeeklyReport), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranchShop = jsonDecode(response.body);
        if (jsonBranchShop['code'] == '100' &&
            jsonBranchShop['msg'] == 'Sukses') {
          branchShopList = (jsonBranchShop['data'] as List)
              .map<ModelBranchShop>((list) => ModelBranchShop.fromJson(list))
              .toList();

          return branchShopList;
        } else {
          return branchShopList;
        }
      } else {}
      return branchShopList;
    } catch (e) {
      print(e.toString());
      return branchShopList;
    }
  }

  static Future<List<ModelPointCalculation>> fetchActivitiesPoint(
    String userid,
    String province,
    String area,
    String beginDate,
    String endDate,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/BrowseEmployeePointSM',
    );

    Map mapActivitiesPoint = {
      "UserID": userid,
      "BigArea": province,
      "SmallArea": area,
      "BeginDate": beginDate,
      "EndDate": endDate,
    };

    List<ModelPointCalculation> activitiesPointList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapActivitiesPoint), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonActivitiesPoint = jsonDecode(response.body);
        if (jsonActivitiesPoint['code'] == '100' &&
            jsonActivitiesPoint['msg'] == 'Sukses') {
          activitiesPointList = (jsonActivitiesPoint['data'] as List)
              .map<ModelPointCalculation>(
                  (list) => ModelPointCalculation.fromJson(list))
              .toList();
        } else {
          return activitiesPointList;
        }
      } else {}
      return activitiesPointList;
    } catch (e) {
      print(e.toString());
      return activitiesPointList;
    }
  }

  static Future<List<ModelPointCalculation>> fetchPointCalculation(
    String userid,
    String province,
    String area,
    String date,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/CalculateEmployeePointSM',
    );

    Map mapPointCalculation = {
      "UserID": userid,
      "BigArea": province,
      "SmallArea": area,
      "CurrentDate": date,
    };

    List<ModelPointCalculation> pointCalculationList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapPointCalculation), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonPointCalculation = jsonDecode(response.body);
        if (jsonPointCalculation['code'] == '100' &&
            jsonPointCalculation['msg'] == 'Sukses') {
          pointCalculationList = (jsonPointCalculation['data'] as List)
              .map<ModelPointCalculation>(
                  (list) => ModelPointCalculation.fromJson(list))
              .toList();
        } else {
          return pointCalculationList;
        }
      } else {}
      return pointCalculationList;
    } catch (e) {
      print(e.toString());
      return pointCalculationList;
    }
  }

  static Future<List<ModelReturnResult>> fetchModifyPoint(
    List<Map<String, dynamic>> map,
  ) async {
    for (var value in map) {
      value.forEach((key, value) {
        print('$key: $value');
      });
      print('');
    }

    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/InsertEmployeePointSM',
    );

    List<ModelReturnResult> modifyPointResult = [];

    try {
      final response = await http.post(url, body: jsonEncode(map), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonModifyPoint = jsonDecode(response.body);
        if (jsonModifyPoint['code'] == '100' &&
            jsonModifyPoint['msg'] == 'Sukses') {
          modifyPointResult = (jsonModifyPoint['data'] as List)
              .map<ModelReturnResult>(
                  (list) => ModelReturnResult.fromJson(list))
              .toList();
        } else {
          return modifyPointResult;
        }
      } else {}
      return modifyPointResult;
    } catch (e) {
      print(e.toString());
      return modifyPointResult;
    }
  }
}
