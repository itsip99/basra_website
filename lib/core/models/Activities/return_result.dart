class ModelReturnResult {
  String result;

  ModelReturnResult({
    required this.result,
  });

  factory ModelReturnResult.fromJson(Map<String, dynamic> json) {
    return ModelReturnResult(
      result: json['resultMessage'],
    );
  }
}
