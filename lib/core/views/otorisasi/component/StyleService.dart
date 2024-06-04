import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StyleService {
  static Color primaryColor = const Color(0xFF687daf);
  static Color secondaryColor = const Color.fromARGB(255, 124, 152, 222);
  static Color tertiaryColor = const Color.fromARGB(255, 163, 191, 255);
  static Color textColor = const Color(0xFF3b3b3b);
  static Color subtextColor = const Color(0xFF607D8B);
  static Color bgColor = const Color.fromARGB(255, 94, 140, 182);
  static TextStyle textStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Metropolis');
  static TextStyle textForm = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.w500, fontFamily: 'Metropolis');
  static TextStyle headLine1 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Metropolis');
  static TextStyle headLine2 = const TextStyle(
      fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Metropolis');
  static TextStyle headLine3 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'Metropolis');
  static TextStyle headLine4 = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Metropolis');
  static TextStyle textError = const TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'BebasKai');

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
