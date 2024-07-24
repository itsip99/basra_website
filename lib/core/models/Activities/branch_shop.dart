class ModelBranchShop {
  String province;
  String area;
  String branch;
  String shopId;
  String shopName;

  ModelBranchShop({
    required this.province,
    required this.area,
    required this.branch,
    required this.shopId,
    required this.shopName,
  });

  factory ModelBranchShop.fromJson(Map<String, dynamic> json) {
    return ModelBranchShop(
      province: json['bigArea'],
      area: json['smallArea'],
      branch: json['branch'],
      shopId: json['shop'],
      shopName: json['bsName'],
    );
  }
}
