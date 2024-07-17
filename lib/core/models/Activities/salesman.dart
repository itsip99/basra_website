class ModelSalesman {
  String location;
  String id;
  String name;

  ModelSalesman({
    required this.location,
    required this.id,
    required this.name,
  });

  factory ModelSalesman.fromJson(Map<String, dynamic> json) {
    return ModelSalesman(
      location: json['locationName'],
      id: json['employeeID'],
      name: json['eName'],
    );
  }
}
