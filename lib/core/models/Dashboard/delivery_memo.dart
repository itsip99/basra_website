class DeliveryMemoModel {
  String transNumber;
  String transDate;
  String duNumber;
  List<CasingModel> casing;

  DeliveryMemoModel({
    required this.transNumber,
    required this.transDate,
    required this.duNumber,
    required this.casing,
  });

  factory DeliveryMemoModel.fromJson(Map<String, dynamic> json) {
    return DeliveryMemoModel(
      transNumber: json['transNo'],
      transDate: json['transDate'],
      duNumber: json['duNo'],
      casing: (json['casing'] as List)
          .map((dynamic data) => CasingModel.fromJson(data))
          .toList(),
    );
  }
}

class CasingModel {
  String casingNumber;
  int koli;
  int qtyCase;
  List<CasingDetailsModel> details;

  CasingModel({
    required this.casingNumber,
    required this.koli,
    required this.qtyCase,
    required this.details,
  });

  factory CasingModel.fromJson(Map<String, dynamic> json) {
    return CasingModel(
      casingNumber: json['casingNo'],
      koli: json['koli'],
      qtyCase: json['qtyCase'],
      details: (json['detail'] as List)
          .map((dynamic data) => CasingDetailsModel.fromJson(data))
          .toList(),
    );
  }
}

class CasingDetailsModel {
  String unitId;
  String itemName;
  int qty;

  CasingDetailsModel({
    required this.unitId,
    required this.itemName,
    required this.qty,
  });

  factory CasingDetailsModel.fromJson(Map<String, dynamic> json) {
    return CasingDetailsModel(
      unitId: json['unitID'],
      itemName: json['itemName'],
      qty: json['qty'],
    );
  }
}
