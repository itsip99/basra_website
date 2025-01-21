class UserAccessModel {
  String header;
  String subHeader;
  String isAllow;

  UserAccessModel({
    required this.header,
    required this.subHeader,
    required this.isAllow,
  });

  factory UserAccessModel.fromJson(Map<String, dynamic> json) {
    return UserAccessModel(
      header: json['header'],
      subHeader: json['subHeader'],
      isAllow: json['isAllow'],
    );
  }
}
