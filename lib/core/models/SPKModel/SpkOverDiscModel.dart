class SpkOverDisc {
  String? branch;
  String? shop;
  String? transNO;
  String? transDate;
  String? unitID;
  String? itemName;
  double? hargaKosong;
  double? bBN;
  double? potonganToko;
  double? subsidiLeasing;
  double? campaign;
  double? bC;
  double? uangMuka;
  String? leasingID;
  String? memo;
  double? sisa;
  String? bSName;
  String? serverName;
  String? dBName;
  String? password;

  SpkOverDisc(
      {this.branch,
      this.shop,
      this.transNO,
      this.transDate,
      this.unitID,
      this.itemName,
      this.hargaKosong,
      this.bBN,
      this.potonganToko,
      this.subsidiLeasing,
      this.campaign,
      this.bC,
      this.uangMuka,
      this.leasingID,
      this.memo,
      this.sisa,
      this.bSName,
      this.serverName,
      this.dBName,
      this.password});

  SpkOverDisc.fromJson(Map<String, dynamic> json) {
    branch = json['Branch'];
    shop = json['Shop'];
    transNO = json['TransNO'];
    transDate = json['TransDate'];
    unitID = json['UnitID'];
    itemName = json['ItemName'];
    hargaKosong = json['HargaKosong'];
    bBN = json['BBN'];
    potonganToko = json['PotonganToko'];
    subsidiLeasing = json['SubsidiLeasing'];
    campaign = json['Campaign'];
    bC = json['BC'];
    uangMuka = json['UangMuka'];
    leasingID = json['LeasingID'];
    memo = json['Memo'];
    sisa = json['Sisa'];
    bSName = json['BSName'];
    serverName = json['ServerName'];
    dBName = json['DBName'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch'] = this.branch;
    data['Shop'] = this.shop;
    data['TransNO'] = this.transNO;
    data['TransDate'] = this.transDate;
    data['UnitID'] = this.unitID;
    data['ItemName'] = this.itemName;
    data['HargaKosong'] = this.hargaKosong;
    data['BBN'] = this.bBN;
    data['PotonganToko'] = this.potonganToko;
    data['SubsidiLeasing'] = this.subsidiLeasing;
    data['Campaign'] = this.campaign;
    data['BC'] = this.bC;
    data['UangMuka'] = this.uangMuka;
    data['LeasingID'] = this.leasingID;
    data['Memo'] = this.memo;
    data['Sisa'] = this.sisa;
    data['BSName'] = this.bSName;
    data['ServerName'] = this.serverName;
    data['DBName'] = this.dBName;
    data['Password'] = this.password;
    return data;
  }
}
