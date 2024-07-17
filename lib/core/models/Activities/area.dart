class ModelAreas {
  String areaName;

  ModelAreas({
    required this.areaName,
  });

  factory ModelAreas.fromJson(Map<String, dynamic> json) {
    return ModelAreas(
      areaName: json['smallArea'],
    );
  }
}
