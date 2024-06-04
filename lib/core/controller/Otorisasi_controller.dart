import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:stsj/core/models/AuthModel/BSLoginModel.dart';
import 'package:stsj/core/models/SPKModel/SpkOverDiscModel.dart';

class ServiceOtorisasi {
  static Future<List<SpkOverDisc>> getDataSpkOverDisc(
      String userID, String pt, String? BSCode) async {
    Uri url = Uri.parse("http://203.201.175.80:81/apiBA/spkoverdisc");
    Map<String, String> mainheader = {
      'UserID': userID,
      'pt': pt,
      'branchshop': BSCode!
    };
    var response = await http.get(url, headers: mainheader);

    if (response.statusCode == 200) {
      var jasonDecode = json.decode(response.body);
      if (jasonDecode['Code'] == '100') {
        print(response.body);
        List<SpkOverDisc> ListSPK =
            (jasonDecode as Map<String, dynamic>)['Data']
                .map<SpkOverDisc>((data) => SpkOverDisc.fromJson(data))
                .toList();

        print(ListSPK);
        return ListSPK;
      } else {
        List<SpkOverDisc> ListSPK = [];
        return ListSPK;
      }
      //return jsonDecode(response.body);
    } else {
      throw ('ResponseFailed');
    }
  }

  static Future<List<BSLogin>> getDataBSLogin(String userID) async {
    Uri url = Uri.parse("http://203.201.175.80:81/apiBA/LoginBranchshop");
    Map<String, String> mainheader = {'UserID': userID};
    var response = await http.get(url, headers: mainheader);

    if (response.statusCode == 200) {
      var jasonDecode = json.decode(response.body);
      if (jasonDecode['Code'] == '100') {
        //print(response.body);
        List<BSLogin> ListBS = (jasonDecode as Map<String, dynamic>)['Data']
            .map<BSLogin>((data) => BSLogin.fromJson(data))
            .toList();

        return ListBS;
      }
      return jsonDecode(response.body);
    } else {
      throw ('ResponseFailed');
    }
  }

  static void spkOverDiscSave(SpkOverDisc spk, String stats, String userID,
      BuildContext context) async {
    //http://203.201.175.80:81/apiBA/spkoverdisc
    var _httpsUri = Uri(
      scheme: 'http',
      host: '203.201.175.80',
      port: 81,
      path: '/apiBA/spkoverdisc',
    );

    Map mapBody = {
      "ServerName": spk.serverName.toString(),
      "DBName": spk.dBName.toString(),
      "Password": spk.password.toString(),
      "TransNO": spk.transNO.toString(),
      "Status": stats,
      "UserID": userID.toString(),
    };

    var body = json.encode(mapBody);
    print("c");
    try {
      final hasilSpkOverDisc = await http.post(_httpsUri, body: body, headers: {
        "Content-Type": "application/json",
      }).timeout(const Duration(seconds: 60));

      Map<String, dynamic> jsonSpkOverDisc = jsonDecode(hasilSpkOverDisc.body);
      print(jsonSpkOverDisc);
      if (jsonSpkOverDisc['Code'] == '100') {
        print(jsonSpkOverDisc['Data'][0]['Result']);
        Fluttertoast.showToast(
          msg: "Success: ${jsonSpkOverDisc['Data'][0]['Result']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green, // Use a different color for success
          textColor: Colors.white,
        );

        Navigator.pop(context);
      }
    } on TimeoutException catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
        msg:
            "Timeout error: ${e.message}", // Display a message related to the error
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } on ClientException catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
        msg:
            "Client error: ${e.message}", // Display a message related to the error
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } on SocketException catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(
        msg:
            "Socket error: ${e.message}", // Display a message related to the error
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
