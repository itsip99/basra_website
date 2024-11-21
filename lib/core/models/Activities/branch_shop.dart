class ModelBranchShop {
  String province;
  String area;
  String branchId;
  String shopId;
  String shopName;

  ModelBranchShop({
    required this.province,
    required this.area,
    required this.branchId,
    required this.shopId,
    required this.shopName,
  });

  factory ModelBranchShop.fromJson(Map<String, dynamic> json) {
    return ModelBranchShop(
      province: json['bigArea'],
      area: json['smallArea'],
      branchId: json['branch'],
      shopId: json['shop'],
      shopName: json['bsName'],
    );
  }
}
