import 'package:flutter/material.dart';

class GlobalFunction {
  static tampilkanDialog(
      BuildContext context, bool isDismissible, Widget widget,
      {bool isBackgroundDisable = false}) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor:
              isBackgroundDisable ? Colors.transparent : Colors.blue.shade50,
          elevation: 16,
          child: widget,
        );
      },
    );
  }
}
