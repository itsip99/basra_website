import 'package:intl/intl.dart' as intl;

/*
   Model Data Login

   */

class DataLogin {
  final String userID;
  final String entryLevelID;
  final String entryLevelName;
  final String memo;
  final List<DataDT> dataDT;

  DataLogin(
      {required this.userID,
      required this.entryLevelID,
      required this.entryLevelName,
      required this.memo,
      required this.dataDT});

  factory DataLogin.fromJson(Map<String, dynamic> json) {
    final dataDTList = (json['DataDT'] as List)
        .map((dataDTJson) => DataDT.fromJson(dataDTJson))
        .toList();

    return DataLogin(
      userID: json['UserID'] as String,
      entryLevelID: json['EntryLevelID'] as String,
      entryLevelName: json['EntryLevelName'] as String,
      memo: json['Memo'] as String,
      dataDT: dataDTList,
    );
  }
}

class DataDT {
  final String pt;

  DataDT({required this.pt});

  factory DataDT.fromJson(Map<String, dynamic> json) {
    return DataDT(pt: json['PT'] as String);
  }
}

class DataPrivilege {
  String Menu = "";

  DataPrivilege({
    required this.Menu,
  });

  factory DataPrivilege.fromJson(Map<String, dynamic> json) {
    return DataPrivilege(Menu: json['Menu']);
  }
}
