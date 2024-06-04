class STUbyDate {
  int? hari;
  int? qty1;
  int? qty2;
  int? qty3;
  int? lY;

  STUbyDate({this.hari, this.qty1, this.qty2, this.qty3, this.lY});

  STUbyDate.fromJson(Map<String, dynamic> json) {
    hari = json['Hari'];
    qty1 = json['Qty1'];
    qty2 = json['Qty2'];
    qty3 = json['Qty3'];
    lY = json['LY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Hari'] = this.hari;
    data['Qty1'] = this.qty1;
    data['Qty2'] = this.qty2;
    data['Qty3'] = this.qty3;
    data['LY'] = this.lY;
    return data;
  }
}
