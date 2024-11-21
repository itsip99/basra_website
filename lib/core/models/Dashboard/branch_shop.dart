class ModelBranches {
  String branchId;
  String shopId;
  String name;

  ModelBranches({
    required this.branchId,
    required this.shopId,
    required this.name,
  });

  factory ModelBranches.fromJson(Map<String, dynamic> json) {
    return ModelBranches(
      branchId: json['branch'],
      shopId: json['shop'],
      name: json['bsName'],
    );
  }
}
