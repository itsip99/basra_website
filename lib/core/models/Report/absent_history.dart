class SipSalesmanHistoryModel {
  String employeeID;
  String employeeName;
  String positionName;
  String branch;
  String shop;
  String locationID;
  String branchName;
  String shopName;
  String locationName;
  double lat;
  double lng;
  String date;
  String checkIn;
  String checkOut;
  double cLat;
  double cLng;
  // "EventName": "",
  // "EventPhoto": "",
  // "EventPhotoThumb": "",
  // "EventPhotoUrl": "",
  // "GMapUrl": "https://maps.google.com/?q=-8.3440925,113.6069649"
  String eventName;
  String eventPhoto;
  String eventPhotoThumb;
  String eventPhotoUrl;
  String gMapUrl;

  SipSalesmanHistoryModel({
    required this.employeeID,
    required this.employeeName,
    required this.positionName,
    required this.branch,
    required this.shop,
    required this.locationID,
    required this.branchName,
    required this.shopName,
    required this.locationName,
    required this.lat,
    required this.lng,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.cLat,
    required this.cLng,
    required this.eventName,
    required this.eventPhoto,
    required this.eventPhotoThumb,
    required this.eventPhotoUrl,
    required this.gMapUrl,
  });

  factory SipSalesmanHistoryModel.fromJson(Map<String, dynamic> json) {
    return SipSalesmanHistoryModel(
      employeeID: json['EmployeeID'],
      employeeName: json['EName'],
      positionName: json['PositionName'],
      branch: json['Branch'],
      shop: json['Shop'],
      locationID: json['LocationID'],
      branchName: json['BName'],
      shopName: json['BSName'],
      locationName: json['LocationName'],
      lat: json['Lat'],
      lng: json['Lng'],
      date: json['Date_'],
      checkIn: json['CheckIn'],
      checkOut: json['CheckOut'],
      cLat: json['CLat'],
      cLng: json['CLng'],
      eventName: json['EventName'],
      eventPhoto: json['EventPhoto'],
      eventPhotoThumb: json['EventPhotoThumb'],
      eventPhotoUrl: json['EventPhotoUrl'],
      gMapUrl: json['GMapUrl'],
    );
  }
}

class SipSalesBranchesModel {
  String branchCode;
  String branchName;

  SipSalesBranchesModel({
    required this.branchCode,
    required this.branchName,
  });

  factory SipSalesBranchesModel.fromJson(Map<String, dynamic> json) {
    return SipSalesBranchesModel(
      branchCode: json['branch'],
      branchName: json['bName'],
    );
  }
}

class SipSalesShopsModel {
  String branchCode;
  String shopCode;
  String shopName;

  SipSalesShopsModel({
    required this.branchCode,
    required this.shopCode,
    required this.shopName,
  });

  factory SipSalesShopsModel.fromJson(Map<String, dynamic> json) {
    return SipSalesShopsModel(
      branchCode: json['branch'],
      shopCode: json['shop'],
      shopName: json['bsName'],
    );
  }
}

class SipSalesLocationModel {
  String branchCode;
  String shopCode;
  String locationId;
  String locationName;

  SipSalesLocationModel({
    required this.branchCode,
    required this.shopCode,
    required this.locationId,
    required this.locationName,
  });

  factory SipSalesLocationModel.fromJson(Map<String, dynamic> json) {
    return SipSalesLocationModel(
      branchCode: json['branch'],
      shopCode: json['shop'],
      locationId: json['locationID'],
      locationName: json['locationName'],
    );
  }
}

class SipSalesmanModel {
  String locationName;
  String employeeID;
  String employeeName;
  String position;
  String idNumber;

  SipSalesmanModel({
    required this.locationName,
    required this.employeeID,
    required this.employeeName,
    required this.position,
    required this.idNumber,
  });

  factory SipSalesmanModel.fromJson(Map<String, dynamic> json) {
    return SipSalesmanModel(
      locationName: json['locationName'],
      employeeID: json['employeeID'],
      employeeName: json['eName'],
      position: json['position'],
      idNumber: json['eIdentificationNo'],
    );
  }
}
