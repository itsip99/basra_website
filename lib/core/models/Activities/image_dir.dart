class ModelImageDirectory {
  String imgDir;

  ModelImageDirectory({
    required this.imgDir,
  });

  factory ModelImageDirectory.fromJson(Map<String, dynamic> json) {
    return ModelImageDirectory(
      imgDir: json['pic1'],
    );
  }
}
