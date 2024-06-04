import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/models/AuthModel/DataAuth.dart';

class Auth {
  static Color primarycolor = Colors.blueAccent;
  static TextStyle fontdashboard = TextStyle(fontFamily: "fontdashboard");

  static final List<String> DataListPT = [
    "STSJ",
    "SS",
    "SP",
    "SPAA",
    "SAMP",
    "ST",
    "RSSM",
    "SPr",
  ];

  static final Map<String, bool> valueToBool = {
    "STSJ": false,
    "SS": false,
    "SP": false,
    "SPAA": false,
    "SAMP": false,
    "ST": false,
    "RSSM": false,
    "SPr": false,
  };
  static bool rssmAuth = false; // Roda Sakti Surya Megah
  static bool stsjAuth = false; // SURYA TIMUR SAKTI JATIM
  static bool spaauth = false; // SURYA PERKASA ANUGRAH ABADI

  static bool ssAuth = false; // SAPTA AJI MANUNGGAL PRIMA
  static bool sampAuth = false; // SAPTA AJI MANUNGGAL PRIMA
  static bool stAuth = false; //Surya Terang
  static bool spAuth = false; // Surya Prima
  static bool sprauth = false; //Surya Pratama

  // static void updateValuesFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   stsjAuth = prefs.getBool('STSJ') ?? false;
  //   ssAuth = prefs.getBool('SS') ?? false;
  //   spAuth = prefs.getBool('SP') ?? false;
  //   spaauth = prefs.getBool('SPAA') ?? false;
  //   sampAuth = prefs.getBool('SAMP') ?? false;
  //   stAuth = prefs.getBool('ST') ?? false;
  //   rssmAuth = prefs.getBool('RSSM') ?? false;
  // }

  static void updateBasedOnDataDT(List<DataDT> dataDT) {
    // Create a map to associate values with boolean variables

    for (var itemDt in dataDT) {
      final value = itemDt.pt;
      if (DataListPT.contains(value)) {
        valueToBool[value] = true;
      }
    }

    print(valueToBool);
    rssmAuth = valueToBool["RSSM"]!;

    stsjAuth = valueToBool["STSJ"]!;

    spaauth = valueToBool["SPAA"]!;
    sampAuth = valueToBool["SAMP"]!;

    stAuth = valueToBool["ST"]!;
    ssAuth = valueToBool["SS"]!;
    spAuth = valueToBool["SP"]!;
    sprauth = valueToBool["SPr"]!;
  }

  static void saveDataToSharedPreferences(List<DataDT> dataDT) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var itemDt in dataDT) {
      final value = itemDt.pt;
      if (DataListPT.contains(value)) {
        valueToBool[value] = true;
      }
    }

    stsjAuth = valueToBool["STSJ"]!;
    ssAuth = valueToBool["SS"]!;
    spAuth = valueToBool["SP"]!;
    spaauth = valueToBool["SPAA"]!;
    sampAuth = valueToBool["SAMP"]!;
    stAuth = valueToBool["ST"]!;
    rssmAuth = valueToBool["RSSM"]!;
    sprauth = valueToBool["SPr"]!;

// Simpan nilai baru ke SharedPreferences
    await prefs.setBool('STSJ', stsjAuth);
    await prefs.setBool('SPAA', spaauth);
    await prefs.setBool('SAMP', sampAuth);
    await prefs.setBool('ST', stAuth);
    await prefs.setBool('RSSM', rssmAuth);
    await prefs.setBool('SS', ssAuth);
    await prefs.setBool('SP', spAuth);
    await prefs.setBool('Spr', sprauth);

    print('Data disimpan dalam SharedPreferences.');
  }
}
