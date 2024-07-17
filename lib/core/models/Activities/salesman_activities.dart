class ModelSalesmanActivities {
  String currentDate;
  String startTime;
  String endTime;
  dynamic lat;
  dynamic lng;
  int duration;
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

  ModelSalesmanActivities({
    required this.currentDate,
    required this.startTime,
    required this.endTime,
    required this.lat,
    required this.lng,
    required this.duration,
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

  factory ModelSalesmanActivities.fromJson(Map<String, dynamic> json) {
    return ModelSalesmanActivities(
      currentDate: json['currentDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      lat: (json['lat'] is double) ? json['lat'] : double.parse(json['lat']),
      lng: (json['lng'] is double) ? json['lng'] : double.parse(json['lng']),
      duration: json['duration'],
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
