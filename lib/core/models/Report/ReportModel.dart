// https://wsip.yamaha-jatim.co.id:2448/api/Report/BranchList
class ListBranch {
  String? bBranch;
  String? bName;

  ListBranch({this.bBranch, this.bName});

  ListBranch.fromJson(Map<String, dynamic> json) {
    bBranch = json['BBranch'];
    bName = json['BName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BBranch'] = this.bBranch;
    data['BName'] = this.bName;
    return data;
  }
}

class ListShop {
  String? bShop;
  String? bSName;

  ListShop({this.bShop, this.bSName});

  ListShop.fromJson(Map<String, dynamic> json) {
    bShop = json['BShop'];
    bSName = json['BSName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BShop'] = this.bShop;
    data['BSName'] = this.bSName;
    return data;
  }
}
