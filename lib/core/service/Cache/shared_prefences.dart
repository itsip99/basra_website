// import 'dart:convert';

// import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:javayogaapp/core/LoginFeatures/presentation/controller/login_controller.dart';
// import 'package:javayogaapp/core/LoginFeatures/domain/entities/DTO_Login.dart';
// import 'package:javayogaapp/core/kelasFeatures/data/model/Member/Member.dart';
// import 'package:javayogaapp/global/global.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesManager {
//   static SharedPreferencesManager? _instance;
//   late SharedPreferences _preferences;

//   SharedPreferencesManager._(); // Private constructor

//   static Future<List<MemberModelData>> getList() async {
//     final prefs = await SharedPreferences.getInstance();
//     final encodedList = prefs.getStringList('UserData') ?? [];
//     return encodedList
//         .map((json) => MemberModelData.fromJson(jsonDecode(json)))
//         .toList();
//   }

//   static Future<SharedPreferencesManager> getInstance() async {
//     if (_instance == null) {
//       _instance = SharedPreferencesManager._();
//       await _instance!._initialize();
//     }
//     return _instance!;
//   }

//   Future<void> _initialize() async {
//     _preferences = await SharedPreferences.getInstance();
//   }

//   //   await sharedPreferencesManager.saveData(userDataList, 'UserData', (json) => UserData.fromJson(json));
//   Future<void> saveDataList(List<dynamic> dataList, String key,
//       Function(Map<String, dynamic>) fromJson) async {
//     final encodedList = dataList.map((data) => jsonEncode(data!)).toList();
//     await _preferences.setStringList(key, encodedList);

//     // print(encodedList);
//   }

//   // static void logout() {
//   final LoginController authController =
//       Get.put<LoginController>(LoginController());
//   // }

//   static void clearUserData() async {
//     // 1. Get the instance of LoginController using GetX
//     final LoginController authController =
//         Get.put<LoginController>(LoginController());

//     FlutterAppBadger.updateBadgeCount(0);

//     GetNotifPeriodic.clearTimer();

//     // 2. Call the deleteToken method of LoginController to perform token deletion
//     // authController.deleteToken(DTOFBToken(
//     //   mode: "2",
//     //   memberID: MemberDataGlobal.memberID,
//     //   serialNumber: MemberDataGlobal.deviceinfo,
//     //   fbToken: MemberDataGlobal.token,
//     // ));

//     // 3. Clear SharedPreferences to remove stored data
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.remove('MemberID');
//     preferences.remove('MemberName');
//     preferences.remove('FLAG');

//     // 4. Clear global variables and reset them to default values
//     MemberDataGlobal.memberName = '';
//     MemberDataGlobal.memberID = '';
//     MemberDataGlobal.userData.clear();
//     MemberDataGlobal.userPhoto.clear();
//     MemberDataGlobal.isLogin = false;
//     MemberDataGlobal.token = '';

//     // 5. Delete all instances managed by GetX to release resources
//     Get.deleteAll(force: true);
//   }

//   Future<void> saveBoolean(bool value, String key) async {
//     await _preferences.setBool(key, value);
//   }

//   bool getBoolean(String key) {
//     return _preferences.getBool(key) ?? false;
//   }

//   Future<void> saveString(String value, String key) async {
//     await _preferences.setString(key, value);
//   }

//   String getData(String key, {String defaultValue = ""}) {
//     return _preferences.getString(key) ?? defaultValue;
//   }
// }
