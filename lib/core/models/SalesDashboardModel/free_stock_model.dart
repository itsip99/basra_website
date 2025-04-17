class FreeStockModel {
  String branchId;
  String branchName;

  FreeStockModel({
    required this.branchId,
    required this.branchName,
  });

  factory FreeStockModel.fromJson(Map<String, dynamic> json) {
    return FreeStockModel(
      branchId: json['branch'],
      branchName: json['bsName'],
    );
  }
}
