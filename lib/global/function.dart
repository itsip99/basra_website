import 'package:flutter/material.dart';

class GlobalFunction {
  static tampilkanDialog(
    BuildContext context,
    bool isDismissible,
    Widget widget, {
    bool isBackgroundDisable = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              isBackgroundDisable ? Colors.transparent : Colors.blue.shade50,
          elevation: 16,
          child: widget,
        );
      },
    );
  }

  static showSnackbar(
    BuildContext context,
    String text, {
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duration),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Text(text),
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.005,
          vertical: MediaQuery.of(context).size.height * 0.005,
        ),
      ),
    );
  }

  static Widget showLegend(
    Color color,
    String text,
  ) {
    return Row(
      children: [
        Icon(
          Icons.location_pin,
          color: color,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
