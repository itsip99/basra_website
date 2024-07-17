// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/models/Activities/activities.dart';
import 'package:stsj/core/models/Activities/activity_route.dart';
import 'package:stsj/core/models/Activities/area.dart';
import 'package:stsj/core/models/Activities/details_processing.dart';
import 'package:stsj/core/models/Activities/image.dart';
import 'package:stsj/core/models/Activities/manager_activities.dart';
import 'package:stsj/core/models/Activities/province.dart';
import 'package:stsj/core/models/Activities/salesman.dart';
import 'package:stsj/core/models/Activities/salesman_activities.dart';
import 'package:stsj/core/models/Activities/weekly_activities_report.dart';
import 'package:stsj/global/api.dart';
import 'package:stsj/router/router_const.dart';

class LoadingModel with ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}

class UserIDmodel with ChangeNotifier {
  List<String> _user = [];

  List<String> get getUserList => _user;

  void setUser(List<String> value) {
    _user = value;
    notifyListeners();
  }
}

class PtModel with ChangeNotifier {
  void getPTClicked(String pt) async {
    SharedPreferences ptClicked = await SharedPreferences.getInstance();
    ptClicked.setString("PT", pt);
  }

  String _ClickPT = "";

  String get getPT => _ClickPT;

  void setPT(String value) {
    _ClickPT = value;
    getPTClicked(_ClickPT);
    notifyListeners();
  }
}

class MapState with ChangeNotifier {
  // ================================================================
  // ============================ Map ===============================
  // ================================================================
  bool isReset = false;

  void setIsReset() {
    isReset = !isReset;
    notifyListeners();
  }

  void resetData() {
    isRouteListOpen = false;
    isFilterOpen = true;
    // routeID = '';
    // routeStartDate = '';
    // routeEndDate = '';
    activityRouteList.clear();
    activityRouteDetailsList.clear();
    imageList.clear();
    selectedImage = 0;
    isActive = 0;
    previewImageDir = '';
    isMapCarousel = false;
    isActivitiesCarousel = false;
    notifyListeners();
  }

  void refreshPage() {
    notifyListeners();
  }

  bool isRouteListOpen = false;
  bool isFilterOpen = true;

  bool get getIsRouteListOpen => isRouteListOpen;

  // String routeID = '';
  // String routeStartDate = '';
  // String routeEndDate = '';

  // String get getRouteID => routeID;
  // String get getRouteStartDate => routeStartDate;
  // String get getRouteEndDate => routeEndDate;

  // void setRouteID(String value) {
  //   routeID = value;
  // }

  // void setRouteStartDate(String value) {
  //   routeStartDate = value;
  // }

  // void setRouteEndDate(String value) {
  //   routeEndDate = value;
  // }

  void toggleRouteList() {
    isRouteListOpen = !isRouteListOpen;
    notifyListeners();
  }

  void toggleFilter() {
    isFilterOpen = !isFilterOpen;
  }

  List<ModelActivityRoute> activityRouteList = [];

  int index = 0;

  List<ModelActivityRoute> get getActivityRoute => activityRouteList;

  int get getImageIndex => index;

  void setImageIndex(int i) {
    index = i;
  }

  Future<List<ModelActivityRoute>> fetchActivityRoute(
    String employeeID,
    String date,
  ) async {
    activityRouteList.clear();
    activityRouteList = await GlobalAPI.fetchActivityRoute(
      employeeID,
      date,
    );

    return activityRouteList;
  }

  // ==================================================================
  // ===================== Image Pre-Processing =======================
  // ==================================================================
  List<ModelActivityRouteDetails> activityRouteDetailsList = [];

  List<ModelActivityRouteDetails> get fetchActivityRouteDetails =>
      activityRouteDetailsList;

  List<List<ModelImage>> imageList = [[]];

  List<List<ModelImage>> get fetchImageList => imageList;

  Future<ModelDetailsProcessing> fetchDetailsProcessing(int index) async {
    activityRouteDetailsList.clear();
    for (int i = 0; i < activityRouteList[index].detail.length; i++) {
      activityRouteDetailsList.add(activityRouteList[index].detail[i]);
    }

    imageList.clear();
    for (int i = 0; i < activityRouteList[index].detail.length; i++) {
      ModelActivityRouteDetails detail = activityRouteList[index].detail[i];

      List<ModelImage> temp = [];
      if (detail.pic1 != '') {
        temp.add(ModelImage(imageDir: detail.pic1, isSelected: true));

        if (detail.pic2 != '') {
          temp.add(ModelImage(imageDir: detail.pic2));
        }
        if (detail.pic3 != '') {
          temp.add(ModelImage(imageDir: detail.pic3));
        }
        if (detail.pic4 != '') {
          temp.add(ModelImage(imageDir: detail.pic4));
        }
        if (detail.pic5 != '') {
          temp.add(ModelImage(imageDir: detail.pic5));
        }
      } else {
        // do nothing if the first photo is not available
      }

      imageList.add(temp);
    }

    return ModelDetailsProcessing(
      routeDetails: activityRouteDetailsList,
      images: imageList,
    );
  }

  // ==================================================================
  // ==================== Carousel Route Details ======================
  // ==================================================================
  int selectedImage = 0;

  void resetSelectImage() {
    selectedImage = 0;
    notifyListeners();
  }

  int get getSelectedImage => selectedImage;

  void setSelectImage(int onImageChangeIindex) {
    selectedImage = onImageChangeIindex;
    // Delete -> remove later
    // imageList[onPageChangeIndex][selectedImage].isSelected = true;
    // for (int i = 0; i < imageList[onPageChangeIndex].length; i++) {
    //   if (i != onImageChangeIindex) {
    //     imageList[onPageChangeIndex][i].isSelected = false;
    //   }
    // }
    notifyListeners();
  }

  // Note -> Carousel Index Usage
  int isActive = 0;

  int get getIsActive => isActive;

  void resetIsActive() {
    isActive = 0;
  }

  void onCarouselChanged(int index) {
    isActive = index;
  }

  // ==================================================================
  // ======================== Image Preview ===========================
  // ==================================================================
  String previewImageDir = '';

  String get getPreviewImageDir => previewImageDir;

  bool isMapCarousel = false;

  bool get getIsMapCarousel => isMapCarousel;

  bool isActivitiesCarousel = false;

  bool get getIsActivitiesCarousel => isActivitiesCarousel;

  void setPreviewImageDir(String value) {
    previewImageDir = value;
    notifyListeners();
  }

  void setIsMapCarousel(bool value) {
    isMapCarousel = value;
    notifyListeners();
  }

  void setIsActivitiesCarousel(bool value) {
    isActivitiesCarousel = value;
    notifyListeners();
  }

  void openMapImageView(
    BuildContext context,
    String imageDir,
    bool isCarousel,
  ) {
    setPreviewImageDir(imageDir);
    setIsMapCarousel(isCarousel);

    if (isCarousel) {
      context.goNamed(RoutesConstant.carouselImageView);
    } else {
      context.goNamed(RoutesConstant.routeImageView);
    }
  }

  // ==================================================================
  // ====================== Salesman Identity =========================
  // ==================================================================
  List<ModelSalesman> salesman = [];

  List<ModelSalesman> get getSalesman => salesman;

  String username = '';

  Future<List<ModelSalesman>> fetchSalesmanList({String user = ''}) async {
    if (user == '') {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      username = prefs.getString('UserID') ?? '';
    }

    salesmanList.clear();
    salesmanList = await GlobalAPI.fetchSalesman(username);

    return salesmanList;
  }

  // ==================================================================
  // ====================== Sales Activities ==========================
  // ==================================================================
  List<ModelSalesman> salesmanList = [];

  List<ModelSalesman> get getSalesmanList => salesmanList;

  List<ModelSalesmanActivities> salesmanActivitiesList = [];

  List<ModelSalesmanActivities> get getSalesmanActivities =>
      salesmanActivitiesList;

  Future<ModelActivities> fetchSalesActivities(
    String employeeID,
    String date,
  ) async {
    salesman.clear();
    salesman.addAll(salesmanList.where((list) => list.id == employeeID));

    salesmanActivitiesList.clear();
    salesmanActivitiesList = await GlobalAPI.fetchSalesmanActivities(
      employeeID,
      date,
    );

    print('Salesman Activities List length: ${salesmanActivitiesList.length}');

    return ModelActivities(
      salesman: salesman,
      activities: salesmanActivitiesList,
    );
  }

  // ==================================================================
  // ===================== Manager Activities =========================
  // ==================================================================
  List<ModelManagerActivities> managerActivitiesList = [];

  List<ModelManagerActivities> get getManagerActivities =>
      managerActivitiesList;

  List<ModelProvinces> provinceList = [];

  List<ModelProvinces> get getProvinceList => provinceList;

  List<ModelAreas> areaList = [];

  List<ModelAreas> get getAreaList => areaList;

  ValueNotifier<String> provinceNotifier = ValueNotifier('');
  ValueNotifier<String> areaNotifier = ValueNotifier('');

  void setProvinceNotifier(String value) {
    provinceNotifier.value = value;
    notifyListeners();
  }

  void setAreaNotifier(String value) {
    areaNotifier.value = value;
    notifyListeners();
  }

  Future<List<ModelProvinces>> fetchProvinces() async {
    provinceList.clear();
    provinceList = await GlobalAPI.getProvinces();
    // print('Provider - Province length: ${provinceList.length}');

    return provinceList;
  }

  Future<List<ModelAreas>> fetchAreas(String value) async {
    areaList.clear();
    areaList = await GlobalAPI.getAreas(value);
    // print('Provider - Area length: ${areaList.length}');

    return areaList;
  }

  List<ModelManagerActivities> morningBriefingList = [];
  List<ModelManagerActivities> visitMarketList = [];
  List<ModelManagerActivities> recruitmentInterviewList = [];
  List<ModelManagerActivities> dailyReportList = [];

  List<ModelManagerActivities> get getMorningBriefingList =>
      morningBriefingList;
  List<ModelManagerActivities> get getVisitMarketList => visitMarketList;
  List<ModelManagerActivities> get getRecruitmentInterviewList =>
      recruitmentInterviewList;
  List<ModelManagerActivities> get getDailyReportList => dailyReportList;

  Future<List> fetchManagerActivities(
    String province,
    String area,
    String date,
  ) async {
    print('Fetch Manager Activities');
    print(province);
    print(area);
    print(date);

    managerActivitiesList.clear();
    managerActivitiesList = await GlobalAPI.fetchManagerActivities(
      province,
      area == '' ? province : area,
      date,
    );

    print('Manager Activities List length: ${managerActivitiesList.length}');

    morningBriefingList.clear();
    morningBriefingList.addAll(managerActivitiesList
        .where((list) => list.actName == 'MORNING BRIEFING'));

    visitMarketList.clear();
    visitMarketList.addAll(
        managerActivitiesList.where((list) => list.actName == 'VISIT MARKET'));

    recruitmentInterviewList.clear();
    recruitmentInterviewList.addAll(managerActivitiesList
        .where((list) => list.actName == 'RECRUITMENT & INTERVIEW'));

    dailyReportList.clear();
    dailyReportList.addAll(
        managerActivitiesList.where((list) => list.actName == 'DAILY REPORT'));

    if (morningBriefingList.length == managerActivitiesList.length / 4 &&
        visitMarketList.length == managerActivitiesList.length / 4 &&
        recruitmentInterviewList.length == managerActivitiesList.length / 4 &&
        dailyReportList.length == managerActivitiesList.length / 4) {
      return [
        morningBriefingList,
        visitMarketList,
        recruitmentInterviewList,
        dailyReportList
      ];
    } else {
      return [];
    }
  }

  // ==================================================================
  // ================== View In Map for Manager =======================
  // ==================================================================
  double lat = 0.0;
  double lng = 0.0;

  double get getLat => lat;

  double get getLng => lng;

  void setLat(double value) {
    lat = value;
    notifyListeners();
  }

  void setLng(double value) {
    lng = value;
    notifyListeners();
  }

  // ==================================================================
  // ========================== New Menu ==============================
  // ==================================================================
  ValueNotifier<String> staticMenuNotifier = ValueNotifier('');

  ValueNotifier<String> get getStaticMenuNotifier => staticMenuNotifier;

  void setStaticMenuNotifier(String value) {
    staticMenuNotifier.value = value;
    notifyListeners();
  }

  // ==================================================================
  // ======================== Weekly Report ===========================
  // ==================================================================
  List<ModelWeeklyReport> weeklyReportList = [];

  List<ModelWeeklyReport> get getWeeklyReportList => weeklyReportList;

  Future<List<ModelWeeklyReport>> fetchWeeklyReport(
    String province,
    String area,
    String beginDate,
    String endDate,
  ) async {
    weeklyReportList.clear();
    weeklyReportList = await GlobalAPI.fetchWeeklyReport(
      province,
      area,
      beginDate,
      endDate,
    );

    return weeklyReportList;
  }
}
