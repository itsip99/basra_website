class BSLogin {
  String? branch;
  String? shop;
  String? bSName;
  String? serverName;
  String? dBName;
  String? password;
  String? pT;

  BSLogin(
      {this.branch,
      this.shop,
      this.bSName,
      this.serverName,
      this.dBName,
      this.password,
      this.pT});

  BSLogin.fromJson(Map<String, dynamic> json) {
    {
      branch = json['Branch'];
      shop = json['Shop'];
      bSName = json['BSName'];
      serverName = json['ServerName'];
      dBName = json['DBName'];
      password = json['Password'];
      pT = json['PT'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Branch'] = this.branch;
    data['Shop'] = this.shop;
    data['BSName'] = this.bSName;
    data['ServerName'] = this.serverName;
    data['DBName'] = this.dBName;
    data['Password'] = this.password;
    data['PT'] = this.pT;
    return data;
  }
}
