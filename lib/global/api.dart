import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:stsj/core/models/Activities/image_dir.dart';
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
import 'package:stsj/core/models/AuthModel/user_access.dart';
import 'package:stsj/core/models/Dashboard/branch_shop.dart';
import 'package:stsj/core/models/Dashboard/delivery.dart';
import 'package:stsj/core/models/Dashboard/delivery_history.dart';
import 'package:stsj/core/models/Dashboard/delivery_memo.dart';
import 'package:stsj/core/models/Dashboard/driver.dart';
import 'package:stsj/core/models/Report/absent_history.dart';

class GlobalAPI {
  static Future<List<ModelUserAccess>> fetchUserAccess(
    String companyName,
    String entryLevelId,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/Login/Privilege',
    );

    Map mapUserAccess = {
      "PT": companyName,
      "EntryLevelID": entryLevelId,
    };

    List<ModelUserAccess> userAccessList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapUserAccess), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 120));

      if (response.statusCode <= 200) {
        var jsonUserAccess = jsonDecode(response.body);
        if (jsonUserAccess['code'] == '100' &&
            jsonUserAccess['msg'] == 'Sukses') {
          userAccessList = (jsonUserAccess['data'] as List)
              .map<ModelUserAccess>((list) => ModelUserAccess.fromJson(list))
              .toList();

          return userAccessList;
        } else {
          return [];
        }
      } else {}
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<List<ModelBranches>> getSISBranchShop(
    String userId,
    String companyId,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/GetBranchShop',
    );

    Map mapGetBranches = {
      "Companyid": companyId,
      "UserID": userId,
    };

    List<ModelBranches> branchList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapGetBranches), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          branchList.add(ModelBranches(branchId: '', shopId: '', name: ''));
          branchList.addAll((jsonBranches['data'] as List)
              .map<ModelBranches>((list) => ModelBranches.fromJson(list))
              .toList());

          return branchList;
        } else {
          return branchList;
        }
      }
      return branchList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return branchList;
    }
  }

  static Future<List<ModelDriver>> getSISDrivers(
    String companyId, {
    String branchId = '',
    String shopId = '',
  }) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/GetDriver',
    );

    Map mapGetBranches = {
      "Companyid": companyId,
      "Branch": branchId,
      "Shop": shopId,
    };

    List<ModelDriver> driverList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapGetBranches), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          driverList.add(ModelDriver(
            employeeId: '',
            employeeName: '',
            branchId: '',
            shopId: '',
            shopName: '',
          ));
          driverList.addAll((jsonBranches['data'] as List)
              .map<ModelDriver>((list) => ModelDriver.fromJson(list))
              .toSet()
              .toList());

          return driverList;
        } else {
          return driverList;
        }
      }
      return driverList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return driverList;
    }
  }

  // ~:NEW:~
  static Future<List<SipSalesBranchesModel>> getSipSalesBranches(
    String userId,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/SIPSalesBranch',
    );

    Map mapGetSipSalesBranches = {"UserID": userId};

    List<SipSalesBranchesModel> branchesList = [];

    try {
      final response = await http
          .post(url, body: jsonEncode(mapGetSipSalesBranches), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          branchesList.add(SipSalesBranchesModel(
            branchCode: '',
            branchName: '',
          ));
          branchesList.addAll((jsonBranches['data'] as List)
              .map<SipSalesBranchesModel>(
                  (list) => SipSalesBranchesModel.fromJson(list))
              .toList());

          return branchesList;
        } else {
          return branchesList;
        }
      }
      return branchesList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return branchesList;
    }
  }

  static Future<List<SipSalesShopsModel>> getSipSalesShops(
    String userId,
    String branchCode,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/SIPSalesBranchShop',
    );

    Map mapGetSipSalesShops = {
      "UserID": userId,
      "Branch": branchCode,
    };

    print(mapGetSipSalesShops);

    List<SipSalesShopsModel> shopsList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapGetSipSalesShops), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          shopsList.add(SipSalesShopsModel(
            branchCode: '',
            shopCode: '',
            shopName: '',
          ));
          shopsList.addAll((jsonBranches['data'] as List)
              .map<SipSalesShopsModel>(
                  (list) => SipSalesShopsModel.fromJson(list))
              .toList());

          return shopsList;
        } else {
          return shopsList;
        }
      }
      return shopsList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return shopsList;
    }
  }

  static Future<List<SipSalesLocationModel>> getSipSalesLocation(
    String userId,
    String branchCode,
    String shopCode,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/SIPSalesLocation',
    );

    Map mapGetSipSalesLocation = {
      "UserID": userId,
      "Branch": branchCode,
      "Shop": shopCode,
    };

    List<SipSalesLocationModel> locationList = [];

    try {
      final response = await http
          .post(url, body: jsonEncode(mapGetSipSalesLocation), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          locationList.add(SipSalesLocationModel(
            branchCode: '',
            shopCode: '',
            locationId: '',
            locationName: '',
          ));
          locationList.addAll((jsonBranches['data'] as List)
              .map<SipSalesLocationModel>(
                  (list) => SipSalesLocationModel.fromJson(list))
              .toList());

          return locationList;
        } else {
          return locationList;
        }
      }
      return locationList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return locationList;
    }
  }

  static Future<List<SipSalesmanModel>> getSipSalesman(
    String userId,
    String branchCode,
    String shopCode,
    String locationId,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/SIPSalesman',
    );

    Map mapGetSipSalesman = {
      "UserID": userId,
      "Branch": branchCode,
      "Shop": shopCode,
      "LocationID": locationId,
    };

    List<SipSalesmanModel> salesmanList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapGetSipSalesman), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          salesmanList.add(SipSalesmanModel(
            locationName: '',
            employeeID: '',
            employeeName: '',
            position: '',
            idNumber: '',
          ));
          salesmanList.addAll((jsonBranches['data'] as List)
              .map<SipSalesmanModel>((list) => SipSalesmanModel.fromJson(list))
              .toList());

          return salesmanList;
        } else {
          return salesmanList;
        }
      }
      return salesmanList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return salesmanList;
    }
  }

  static Future<List<SipSalesmanHistoryModel>> getSipSalesmanHistory(
    String userId,
    String branchCode,
    String shopCode,
    String locationId,
    String employeeId,
    String beginDate,
    String endDate,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/AttendanceHistory',
    );

    Map mapGetSipSalesmanHistory = {
      "UserID": userId,
      "Branch": branchCode,
      "Shop": shopCode,
      "LocationID": locationId,
      "EmployeeID": employeeId,
      "BeginDate": beginDate,
      "EndDate": endDate,
    };

    print(mapGetSipSalesmanHistory);

    List<SipSalesmanHistoryModel> salesmanHistoryList = [];

    try {
      final response = await http
          .post(url, body: jsonEncode(mapGetSipSalesmanHistory), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      // print(response.body);

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['Code'] == '100' && jsonBranches['Msg'] == 'Sukses') {
          salesmanHistoryList.addAll((jsonBranches['Data'] as List)
              .map<SipSalesmanHistoryModel>(
                  (list) => SipSalesmanHistoryModel.fromJson(list))
              .toList());

          return salesmanHistoryList;
        } else {
          return salesmanHistoryList;
        }
      }
      return salesmanHistoryList;
    } catch (e) {
      print('Error: ${e.toString()}');
      return salesmanHistoryList;
    }
  }
  // ~:NEW:~

  static Future<List<DeliveryModel>> fetchDeliveryList(
    String companyId,
    String branchId,
    String shopId,
    String employeeId,
    String currentDate,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/CheckListPengiriman',
    );

    Map mapDelivery = {
      "Companyid": companyId,
      "Branch": branchId,
      "Shop": shopId,
      "EmployeeID": employeeId,
      "CurrentDate": currentDate,
    };

    print('Delivery map: $mapDelivery');

    List<DeliveryModel> deliveryList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapDelivery), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      // print(response.body);

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        if (jsonBranches['code'] == '100' && jsonBranches['msg'] == 'Sukses') {
          deliveryList.addAll((jsonBranches['data'] as List)
              .map<DeliveryModel>((list) => DeliveryModel.fromJson(list))
              .toSet()
              .toList());

          log('Fetch data succeed');
          return deliveryList;
        } else {
          log('Fetch data failed or error occured');
          deliveryList.add(DeliveryModel(
            employeeId: '',
            employeeName: '',
            chasisNumber: '',
            plateNumber: '',
            imeiNumber: '',
            drivingLicense: '',
            activityNumber: '',
            startTime: '',
            startImageThumb: '',
            startKm: '',
            endTime: '',
            endImageThumb: '',
            endKm: '',
            deliveryDetail: [],
          ));

          return deliveryList;
        }
      }

      return [];
    } catch (e) {
      print('Error: ${e.toString()}');
      return [];
    }
  }

  static Future<List<DeliveryHistoryModel>> fetchDeliveryHistory(
    String token,
    String imei,
    String date,
  ) async {
    Map mapDeliveryHistory = {
      "token": token,
      "imei": imei,
      "CurrentDate": date,
    };

    print(mapDeliveryHistory);

    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/MaxTracker',
    );

    print(url);

    List<DeliveryHistoryModel> deliveryHistoryList = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapDeliveryHistory), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      // print(response.body);

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        deliveryHistoryList.addAll((jsonBranches as List)
            .map<DeliveryHistoryModel>(
                (list) => DeliveryHistoryModel.fromJson(list))
            .toList());

        log('Fetch data succeed');
        return deliveryHistoryList;
      }

      log('Fetch data failed');
      return [];
    } catch (e) {
      print('Error: ${e.toString()}');
      return [];
    }
  }

  static Future<String> fetchDeliveryHDImage(
    String companyId,
    String timelineType,
    String transNumber,
    String shippingNumber,
  ) async {
    Map mapDeliveryHDImage = {
      "Companyid": companyId,
      "Jenis": timelineType,
      "TransNo": transNumber,
      "ShippingCLNo": shippingNumber,
    };

    print(mapDeliveryHDImage);

    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/DriverActivityImage',
    );

    print(url);

    try {
      final response =
          await http.post(url, body: jsonEncode(mapDeliveryHDImage), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      // print(response.body);
      print('Response stage passed');

      if (response.statusCode <= 200) {
        var jsonBranches = jsonDecode(response.body);
        print('JSON Branches stage passed');
        // if (jsonBranches['data'] != null) {
        //   log('jsonBranches is not null');
        // } else {
        //   log('jsonBranches is null');
        //   return 'null';
        // }
        if (jsonBranches['data'][0]['image1'] != '') {
          log('Fetch data succeed, data available');
          return jsonBranches['data'][0]['image1'];
        } else {
          log('Fetch data succeed, data not available');
          return '';
        }
      }

      log('Fetch data failed');
      return 'fail';
    } catch (e) {
      print('Error: ${e.toString()}');
      return 'error';
    }
  }

  static Future<Map<String, dynamic>> fetchDeliveryMemo(
    String companyId,
    String branchId,
    String shopId,
    String transNumber,
  ) async {
    Map<String, dynamic> mapDeliveryMemoReturn = {
      'data': [],
      'status': '',
    };

    Map mapDeliveryMemo = {
      "Companyid": companyId,
      "Branch": branchId,
      "Shop": shopId,
      "TransNo": transNumber,
    };

    // print(mapDeliveryMemo);

    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/SIS/Driver/CheckListPengirimanDetail',
    );

    // print(url);

    try {
      final response =
          await http.post(url, body: jsonEncode(mapDeliveryMemo), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      // print(response.body);

      List<DeliveryMemoModel> deliveryDetailList = [];

      if (response.statusCode <= 200) {
        // print('200');
        var jsonDeliveryMemo = jsonDecode(response.body);
        if (jsonDeliveryMemo['code'] == '100' &&
            jsonDeliveryMemo['msg'] == 'Sukses') {
          // print('processing');
          deliveryDetailList.addAll((jsonDeliveryMemo['data'] as List)
              .map<DeliveryMemoModel>(
                  (list) => DeliveryMemoModel.fromJson(list))
              .toList());

          // print('success');
          mapDeliveryMemoReturn.update('data', (_) => deliveryDetailList);
          mapDeliveryMemoReturn.update('status', (_) => 'success');

          return mapDeliveryMemoReturn;
        } else {
          // print('failed'); // gagal memuat data
          mapDeliveryMemoReturn.update('status', (_) => 'failed');

          return mapDeliveryMemoReturn;
        }
      } else {
        // print('404'); // terjadi kesalahan, mohon coba lagi
        mapDeliveryMemoReturn.update('status', (_) => 'not found');

        return mapDeliveryMemoReturn;
      }
    } catch (e) {
      // terjadi kesalahan, mohon coba lagi
      // print('Error: ${e.toString()}');
      mapDeliveryMemoReturn.update('status', (_) => 'error');

      return mapDeliveryMemoReturn;
    }
  }

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
    print(userId);
    print(province);

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

          // print('API Area List: ${areaList.length}');
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

    // print('Fetch Manager Activities: $userid, $province, $area, $date');

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

  static Future<String> fetchImageDirectory(
    String date,
    String eId,
    String aId,
  ) async {
    var url = Uri.https(
      'wsip.yamaha-jatim.co.id:2448',
      '/api/SIPSales/EmployeeActivitySMPic',
    );

    print('Fetch Image Dir');
    print(date);
    print(eId);
    print(aId);

    Map mapImageDirectory = {
      "CurrentDate": date,
      "EmployeeID": eId,
      "ActivityID": aId,
    };

    List<ModelImageDirectory> imageDirectory = [];

    try {
      final response =
          await http.post(url, body: jsonEncode(mapImageDirectory), headers: {
        'Content-Type': 'application/json',
      }).timeout(const Duration(seconds: 60));

      if (response.statusCode <= 200) {
        var jsonImageDirectory = jsonDecode(response.body);
        if (jsonImageDirectory['code'] == '100' &&
            jsonImageDirectory['msg'] == 'Sukses') {
          imageDirectory = (jsonImageDirectory['data'] as List)
              .map<ModelImageDirectory>(
                  (list) => ModelImageDirectory.fromJson(list))
              .toList();

          return imageDirectory[0].imgDir;
        } else {
          return '';
        }
      } else {
        return '';
      }
    } catch (e) {
      print(e.toString());
      return '';
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
