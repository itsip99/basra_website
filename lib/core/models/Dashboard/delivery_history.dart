class DeliveryHistoryModel {
  String time;
  String lat;
  String lng;
  String speed;
  String direction;
  String gpsLength;
  String gpsSatelite;
  String acc;
  String mileage;
  String door;
  String adcTemp;
  String adcFuel;
  String adcVolt;
  String pto;

  DeliveryHistoryModel({
    required this.time,
    required this.lat,
    required this.lng,
    required this.speed,
    required this.direction,
    required this.gpsLength,
    required this.gpsSatelite,
    required this.acc,
    required this.mileage,
    required this.door,
    required this.adcTemp,
    required this.adcFuel,
    required this.adcVolt,
    required this.pto,
  });

  factory DeliveryHistoryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryHistoryModel(
      time: json['datatime'],
      lat: json['lat'],
      lng: json['lng'],
      speed: json['speed'],
      direction: json['direction'],
      gpsLength: json['gpslength'],
      gpsSatelite: json['gpssatelite'],
      acc: json['acc'],
      mileage: json['mileage'],
      door: json['door'],
      adcTemp: json['adctemp'],
      adcFuel: json['adcfuel'],
      adcVolt: json['adcvolt'],
      pto: json['pto'],
    );
  }
}
