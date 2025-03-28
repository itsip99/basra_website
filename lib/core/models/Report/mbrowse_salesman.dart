class MBrowseSalesman {
  String branchCode;
  String shopCode;
  String locationCode;
  String branchName;
  String shopName;
  String locationName;
  String employeeId;
  String employeeName;
  String identificationNo;
  String typeId;
  String positionName;
  String beginDate;
  String endDate;
  String thumbnail;
  String isActive;
  String status;
  String photoUrl;
  String mapUrl;

  MBrowseSalesman({
    required this.branchCode,
    required this.shopCode,
    required this.locationCode,
    required this.branchName,
    required this.shopName,
    required this.locationName,
    required this.employeeId,
    required this.employeeName,
    required this.identificationNo,
    required this.typeId,
    required this.positionName,
    required this.beginDate,
    required this.endDate,
    required this.thumbnail,
    required this.isActive,
    required this.status,
    required this.photoUrl,
    required this.mapUrl,
  });

  factory MBrowseSalesman.fromJson(Map<String, dynamic> json) {
    return MBrowseSalesman(
      branchCode: json['branch'],
      shopCode: json['shop'],
      locationCode: json['locationID'],
      branchName: json['bName'],
      shopName: json['bsName'],
      locationName: json['locationName'],
      employeeId: json['employeeID'],
      employeeName: json['eName'],
      identificationNo: json['eIdentificationNo'],
      typeId: json['eTypeID'],
      positionName: json['positionName'],
      beginDate: json['beginDate'],
      endDate: json['endDate'],
      thumbnail: json['photoThumb'],
      isActive: json['active'],
      status: json['eStatus'],
      photoUrl: json['photoUrl'],
      mapUrl: json['gMapUrl'],
    );
  }
}
