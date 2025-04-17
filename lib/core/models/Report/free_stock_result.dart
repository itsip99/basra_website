class FreeStockResultModel {
  String unitId;
  String unitName;
  String color;
  String colorName;
  int freeStock;
  int adjustStock;

  FreeStockResultModel({
    required this.unitId,
    required this.unitName,
    required this.color,
    required this.colorName,
    required this.freeStock,
    required this.adjustStock,
  });

  factory FreeStockResultModel.fromJson(Map<String, dynamic> json) {
    return FreeStockResultModel(
      unitId: json['unitID'],
      unitName: json['itemName'],
      color: json['color'],
      colorName: json['colorName'],
      freeStock: json['fs'],
      adjustStock: json['adjust'],
    );
  }
}
