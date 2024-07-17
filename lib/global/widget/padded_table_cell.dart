// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

class PaddedTableCell extends StatelessWidget {
  PaddedTableCell(
    this.value, {
    this.isText = true,
    this.valueFunction,
    super.key,
  });

  String value;
  bool isText;
  Function? valueFunction;

  @override
  Widget build(BuildContext context) {
    if (isText) {
      return TableCell(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: GlobalFont.mediumgiantfontR,
          ),
        ),
      );
    } else {
      return TableCell(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: IconButton(
            onPressed: () {
              if (value != '' && value.length % 4 == 0) {
                valueFunction!(
                  value,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Image is not available',
                    ),
                  ),
                );
              }
            },
            icon: Icon(
              Icons.image_rounded,
              size: 35.0,
              color: value != '' && value.length % 4 == 0
                  ? Colors.black
                  : Colors.grey[350],
            ),
          ),
        ),
      );
    }
  }
}
