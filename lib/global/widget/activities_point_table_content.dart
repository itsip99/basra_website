// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/models/Activities/point_calculation.dart';
import 'package:stsj/core/providers/Provider.dart';

class ActivitiesPointTableContent extends StatelessWidget {
  ActivitiesPointTableContent(
    this.list,
    this.pointsIndex, {
    this.isModify = false,
    this.isMobile = false,
    super.key,
  });

  final List<ModelPointCalculation> list;
  final int pointsIndex;
  bool isModify;
  bool isMobile;

  Widget computerView(BuildContext context) {
    if (!isModify) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.2425,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((e) {
              final index = e.key;
              final ModelPointCalculation point = e.value;

              if (pointsIndex % 2 == 0) {
                if (list.length - 1 == index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: ((list.length - 1) == index)
                          ? Border()
                          : Border(
                              bottom: BorderSide(color: Colors.black),
                            ),
                      color: (index % 2 == 0)
                          ? Colors.grey[350]
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            point.point1.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point1 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point2.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point2 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point3.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point3 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.027125,
                    decoration: BoxDecoration(
                      border: ((list.length - 1) == index)
                          ? Border()
                          : Border(
                              bottom: BorderSide(color: Colors.black),
                            ),
                      color: (index % 2 == 0)
                          ? Colors.grey[350]
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            point.point1.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point1 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point2.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point2 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point3.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point3 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              } else {
                if (list.length - 1 == index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: ((list.length - 1) == index)
                          ? Border()
                          : Border(
                              bottom: BorderSide(color: Colors.black),
                            ),
                      color: (index % 2 == 0)
                          ? Colors.transparent
                          : Colors.grey[350],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            point.point1.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point1 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point2.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point2 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point3.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point3 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.027125,
                    decoration: BoxDecoration(
                      border: ((list.length - 1) == index)
                          ? Border()
                          : Border(
                              bottom: BorderSide(color: Colors.black),
                            ),
                      color: (index % 2 == 0)
                          ? Colors.transparent
                          : Colors.grey[350],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            point.point1.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point1 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point2.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point2 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            point.point3.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: (point.point3 == 1)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
            }).toList(),
          ),
        ),
      );
    } else {
      final pointTableState = Provider.of<MenuState>(context);

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.2425,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.asMap().entries.map((e) {
              final int index = e.key;
              final ModelPointCalculation point = e.value;

              if (pointsIndex % 2 == 0) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.02705,
                  decoration: BoxDecoration(
                    border: ((list.length - 1) == index)
                        ? Border()
                        : Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                    color: (index % 2 == 0)
                        ? Colors.grey[350]
                        : Colors.transparent,
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
                          style: TextStyle(
                            color:
                                (point.point1 == 1) ? Colors.red : Colors.black,
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
                          style: TextStyle(
                            color:
                                (point.point2 == 1) ? Colors.red : Colors.black,
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
                          style: TextStyle(
                            color:
                                (point.point3 == 1) ? Colors.red : Colors.black,
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
                  height: MediaQuery.of(context).size.height * 0.02705,
                  decoration: BoxDecoration(
                    border: ((list.length - 1) == index)
                        ? Border()
                        : Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                    color: (index % 2 == 0)
                        ? Colors.transparent
                        : Colors.grey[350],
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
                          style: TextStyle(
                            color:
                                (point.point1 == 1) ? Colors.red : Colors.black,
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
                          style: TextStyle(
                            color:
                                (point.point2 == 1) ? Colors.red : Colors.black,
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
                          style: TextStyle(
                            color:
                                (point.point3 == 1) ? Colors.red : Colors.black,
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
        ),
      );
    }
  }

  Widget mobileView(BuildContext context) {
    if (!isModify) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((e) {
            final index = e.key;
            final ModelPointCalculation point = e.value;

            if (pointsIndex % 2 == 0) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  border: ((list.length - 1) == index)
                      ? Border()
                      : Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                  color:
                      (index % 2 == 0) ? Colors.grey[350] : Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        point.point1.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point1 == 1) ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point2.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point2 == 1) ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point3.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point3 == 1) ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return DecoratedBox(
                decoration: BoxDecoration(
                  border: ((list.length - 1) == index)
                      ? Border()
                      : Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                  color:
                      (index % 2 == 0) ? Colors.transparent : Colors.grey[350],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        point.point1.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point1 == 1) ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point2.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point2 == 1) ? Colors.red : Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        point.point3.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              (point.point3 == 1) ? Colors.red : Colors.black,
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
    } else {
      final pointTableState = Provider.of<MenuState>(context);

      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((e) {
            final int index = e.key;
            final ModelPointCalculation point = e.value;

            if (pointsIndex % 2 == 0) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.0465,
                decoration: BoxDecoration(
                  border: ((list.length - 1) == index)
                      ? Border()
                      : Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                  color:
                      (index % 2 == 0) ? Colors.grey[350] : Colors.transparent,
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
                        style: TextStyle(
                          color:
                              (point.point1 == 1) ? Colors.red : Colors.black,
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
                        style: TextStyle(
                          color:
                              (point.point2 == 1) ? Colors.red : Colors.black,
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
                        style: TextStyle(
                          color:
                              (point.point3 == 1) ? Colors.red : Colors.black,
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
                height: MediaQuery.of(context).size.height * 0.0465,
                decoration: BoxDecoration(
                  border: ((list.length - 1) == index)
                      ? Border()
                      : Border(
                          bottom: BorderSide(color: Colors.black),
                        ),
                  color:
                      (index % 2 == 0) ? Colors.transparent : Colors.grey[350],
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
                        style: TextStyle(
                          color:
                              (point.point1 == 1) ? Colors.red : Colors.black,
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
                        style: TextStyle(
                          color:
                              (point.point2 == 1) ? Colors.red : Colors.black,
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
                        style: TextStyle(
                          color:
                              (point.point3 == 1) ? Colors.red : Colors.black,
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1024) {
          return computerView(context);
        } else {
          return mobileView(context);
        }
      },
    );
  }
}
