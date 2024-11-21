// "category": "DASHBOARD",
// "menuNumber": "002",
// "menuName": "AFTER SALES",
// "allowView": 1
class ModelUserAccess {
  String category;
  String menuNumber;
  String menuName;
  int isAllow;

  ModelUserAccess({
    required this.category,
    required this.menuNumber,
    required this.menuName,
    required this.isAllow,
  });

  factory ModelUserAccess.fromJson(Map<String, dynamic> json) {
    return ModelUserAccess(
      category: json['category'],
      menuNumber: json['menuNumber'],
      menuName: json['menuName'],
      isAllow: json['allowView'],
    );
  }
}
