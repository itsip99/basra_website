class ModelDriver {
  String employeeId;
  String employeeName;
  String branchId;
  String shopId;
  String shopName;

  ModelDriver({
    required this.employeeId,
    required this.employeeName,
    required this.branchId,
    required this.shopId,
    required this.shopName,
  });

  factory ModelDriver.fromJson(Map<String, dynamic> json) {
    return ModelDriver(
      employeeId: json['employeeID'],
      employeeName: json['eName'],
      branchId: json['branch'],
      shopId: json['shop'],
      shopName: json['bsName'],
    );
  }
}
