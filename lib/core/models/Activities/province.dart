class ModelProvinces {
  String provinceName;

  ModelProvinces({
    required this.provinceName,
  });

  factory ModelProvinces.fromJson(Map<String, dynamic> json) {
    return ModelProvinces(
      provinceName: json['bigArea'],
    );
  }
}
