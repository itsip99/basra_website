import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

List<Color> conditionColor = [
  Colors.red,
  Colors.green,
  Colors.black,
];

Widget deliveryMapButton(
  String customerName,
  int condition, {
  Function? onPressed,
  Color color = Colors.black,
  String counter = '0',
}) {
  return GestureDetector(
    onTap: () => onPressed!(),
    child: Column(
      children: [
        SizedBox(
          width: 75,
          height: 75,
          child: Builder(
            builder: (context) {
              if (counter != '0') {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: conditionColor[condition],
                      size: 50.0,
                    ),
                    Align(
                      alignment: int.parse(counter) % 2 == 0
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Text(
                        counter,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Icon(
                  Icons.location_pin,
                  color: conditionColor[condition],
                  size: 50.0,
                );
              }
            },
          ),
        ),
        Text(
          customerName,
          style: GlobalFont.bigfontRBold,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
