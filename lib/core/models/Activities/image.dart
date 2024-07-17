class ModelImage {
  String imageDir;
  bool isSelected;

  ModelImage({
    required this.imageDir,
    this.isSelected = false,
  });

  Map<String, dynamic> toJson() => {
        'imageDir': imageDir,
        'isSelected': isSelected,
      };

  factory ModelImage.fromJson(Map<String, dynamic> json) {
    return ModelImage(
      imageDir: json['imageDir'] as String,
      isSelected: json['isSelected'] as bool,
    );
  }
}
