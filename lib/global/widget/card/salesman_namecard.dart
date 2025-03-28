import 'package:flutter/material.dart';
import 'package:stsj/core/models/Report/mbrowse_salesman.dart';

class SalesmanNamecard extends StatelessWidget {
  const SalesmanNamecard(
    this.data, {
    super.key,
  });

  final MBrowseSalesman data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.01,
        vertical: MediaQuery.of(context).size.height * 0.0175,
      ),
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.0075,
        horizontal: MediaQuery.of(context).size.height * 0.0075,
      ),
    );
  }
}
