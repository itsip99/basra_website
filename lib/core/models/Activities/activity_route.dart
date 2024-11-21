class ModelActivityRoute {
  String startTime;
  String endTime;
  dynamic lat;
  dynamic lng;
  int duration;
  double distance;
  int? isActAvailable;
  List<dynamic> detail;

  ModelActivityRoute({
    required this.startTime,
    required this.endTime,
    required this.lat,
    required this.lng,
    required this.duration,
    required this.distance,
    this.isActAvailable,
    required this.detail,
  });

  factory ModelActivityRoute.fromJson(Map<String, dynamic> json) {
    return ModelActivityRoute(
      startTime: json['startTime'],
      endTime: json['endTime'],
      lat: (json['lat'] is double) ? json['lat'] : double.parse(json['lat']),
      lng: (json['lng'] is double) ? json['lng'] : double.parse(json['lng']),
      duration: json['duration'],
      distance: json['distance'],
      isActAvailable: json['adaAktivitas'],
      detail: (json['detail'] as List)
          .map((dynamic data) => ModelActivityRouteDetails.fromJson(data))
          .toList(),
    );
  }
}

class ModelActivityRouteDetails {
  String actId;
  String actName;
  String actDesc;
  String contactName;
  String contactNumber;
  String pic1;
  String pic2;
  String pic3;
  String pic4;
  String pic5;

  ModelActivityRouteDetails({
    required this.actId,
    required this.actName,
    required this.actDesc,
    required this.contactName,
    required this.contactNumber,
    required this.pic1,
    required this.pic2,
    required this.pic3,
    required this.pic4,
    required this.pic5,
  });

  Map<String, dynamic> toJson() => {
        'activityID': actId,
        'activityName': actName,
        'activityDescription': actDesc,
        'contactName': contactName,
        'contactPhoneNo': contactNumber,
        'pic1': pic1,
        'pic2': pic2,
        'pic3': pic3,
        'pic4': pic4,
        'pic5': pic5,
      };

  factory ModelActivityRouteDetails.fromJson(Map<String, dynamic> json) {
    return ModelActivityRouteDetails(
      actId: json['activityID'],
      actName: json['activityName'],
      actDesc: json['activityDescription'],
      contactName: json['contactName'],
      contactNumber: json['contactPhoneNo'],
      pic1: json['pic1'],
      pic2: json['pic2'],
      pic3: json['pic3'],
      pic4: json['pic4'],
      pic5: json['pic5'],
    );
  }
}
