import 'package:flutter/material.dart';

  import 'package:countup/countup.dart';


class wSummary extends StatelessWidget {
  wSummary({
    super.key,
    required this.title,
    required this.desc,
    required this.warna,
  });

  final  title;
  final String desc;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: warna,
            width: 5,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [

                Countup(
              begin: 0,
              end:  double.parse(title) ,
              duration: Duration(seconds: 3),
              separator: ',',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 36,
              ),
            ),
              // Text(title,
              //     style: TextStyle(fontSize: 16, color: Colors.lightBlue)),
            ],
          ),
          Text(desc, style: TextStyle(fontSize: 16)),
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
    );
  }
}
