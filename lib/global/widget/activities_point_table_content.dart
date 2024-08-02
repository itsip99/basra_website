// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Activities/point_calculation.dart';
import 'package:stsj/core/providers/Provider.dart';

class ActivitiesPointTableContent extends StatelessWidget {
  ActivitiesPointTableContent(this.list, {this.isModify = false, super.key});

  final List<ModelPointCalculation> list;
  bool isModify;

  @override
  Widget build(BuildContext context) {
    if (!isModify) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.275,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((e) {
            final index = e.key;
            final ModelPointCalculation point = e.value;

            if (list.length - 1 == index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      point.point1.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point.point2.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      point.point3.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width * 0.225,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        point.point1.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point2.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point3.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }
          }).toList(),
        ),
      );
    } else {
      final pointTableState = Provider.of<MapState>(context);

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.275,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((e) {
            final int index = e.key;
            final ModelPointCalculation point = e.value;

            if (list.length - 1 == index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.02675,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point1.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint1(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point2.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint2(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point3.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint3(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: MediaQuery.of(context).size.width * 0.225,
                height: MediaQuery.of(context).size.height * 0.02675,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point1.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint1(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point2.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint2(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: point.point3.toString(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) => pointTableState.setPoint3(
                          value,
                          list[index],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }).toList(),
        ),
      );
    }
  }
}
