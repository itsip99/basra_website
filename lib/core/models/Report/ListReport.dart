class ListReport {
  String? category;
  String? reportName;
  String? fileName;
  int? parameter;
  int? branch;
  int? shop;
  int? beginDate;
  int? endDate;
  int? transID;
  int? beginDate2;
  int? endDate2;
  int? beginDate3;
  int? endDate3;
  int? beginDate4;
  int? endDate4;
  int? beginDate5;
  int? endDate5;
  int? beginDate6;
  int? endDate6;
  int? beginAcc;
  int? endAcc;
  int? deptID;
  int? cashBank;
  int? filter1;
  int? filter2;
  int? filter3;
  int? filter4;
  int? filter5;
  int? filter6;
  String? filterLabel1;
  String? filterLabel2;
  String? filterLabel3;
  String? filterLabel4;
  String? filterLabel5;
  String? filterLabel6;
  String? dateLabel2;
  String? dateLabel3;
  String? dateLabel4;
  String? dateLabel5;
  String? dateLabel6;

  ListReport(
      {this.category,
      this.reportName,
      this.fileName,
      this.parameter,
      this.branch,
      this.shop,
      this.beginDate,
      this.endDate,
      this.transID,
      this.beginDate2,
      this.endDate2,
      this.beginDate3,
      this.endDate3,
      this.beginDate4,
      this.endDate4,
      this.beginDate5,
      this.endDate5,
      this.beginDate6,
      this.endDate6,
      this.beginAcc,
      this.endAcc,
      this.deptID,
      this.cashBank,
      this.filter1,
      this.filter2,
      this.filter3,
      this.filter4,
      this.filter5,
      this.filter6,
      this.filterLabel1,
      this.filterLabel2,
      this.filterLabel3,
      this.filterLabel4,
      this.filterLabel5,
      this.filterLabel6,
      this.dateLabel2,
      this.dateLabel3,
      this.dateLabel4,
      this.dateLabel5,
      this.dateLabel6});

  ListReport.fromJson(Map<String, dynamic> json) {
    category = json['Category'];
    reportName = json['ReportName'];
    fileName = json['FileName'];
    parameter = json['Parameter'];
    branch = json['Branch'];
    shop = json['Shop'];
    beginDate = json['BeginDate'];
    endDate = json['EndDate'];
    transID = json['TransID'];
    beginDate2 = json['BeginDate2'];
    endDate2 = json['EndDate2'];
    beginDate3 = json['BeginDate3'];
    endDate3 = json['EndDate3'];
    beginDate4 = json['BeginDate4'];
    endDate4 = json['EndDate4'];
    beginDate5 = json['BeginDate5'];
    endDate5 = json['EndDate5'];
    beginDate6 = json['BeginDate6'];
    endDate6 = json['EndDate6'];
    beginAcc = json['BeginAcc'];
    endAcc = json['EndAcc'];
    deptID = json['DeptID'];
    cashBank = json['CashBank'];
    filter1 = json['Filter1'];
    filter2 = json['Filter2'];
    filter3 = json['Filter3'];
    filter4 = json['Filter4'];
    filter5 = json['Filter5'];
    filter6 = json['Filter6'];
    filterLabel1 = json['FilterLabel1'];
    filterLabel2 = json['FilterLabel2'];
    filterLabel3 = json['FilterLabel3'];
    filterLabel4 = json['FilterLabel4'];
    filterLabel5 = json['FilterLabel5'];
    filterLabel6 = json['FilterLabel6'];
    dateLabel2 = json['DateLabel2'];
    dateLabel3 = json['DateLabel3'];
    dateLabel4 = json['DateLabel4'];
    dateLabel5 = json['DateLabel5'];
    dateLabel6 = json['DateLabel6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category'] = this.category;
    data['ReportName'] = this.reportName;
    data['FileName'] = this.fileName;
    data['Parameter'] = this.parameter;
    data['Branch'] = this.branch;
    data['Shop'] = this.shop;
    data['BeginDate'] = this.beginDate;
    data['EndDate'] = this.endDate;
    data['TransID'] = this.transID;
    data['BeginDate2'] = this.beginDate2;
    data['EndDate2'] = this.endDate2;
    data['BeginDate3'] = this.beginDate3;
    data['EndDate3'] = this.endDate3;
    data['BeginDate4'] = this.beginDate4;
    data['EndDate4'] = this.endDate4;
    data['BeginDate5'] = this.beginDate5;
    data['EndDate5'] = this.endDate5;
    data['BeginDate6'] = this.beginDate6;
    data['EndDate6'] = this.endDate6;
    data['BeginAcc'] = this.beginAcc;
    data['EndAcc'] = this.endAcc;
    data['DeptID'] = this.deptID;
    data['CashBank'] = this.cashBank;
    data['Filter1'] = this.filter1;
    data['Filter2'] = this.filter2;
    data['Filter3'] = this.filter3;
    data['Filter4'] = this.filter4;
    data['Filter5'] = this.filter5;
    data['Filter6'] = this.filter6;
    data['FilterLabel1'] = this.filterLabel1;
    data['FilterLabel2'] = this.filterLabel2;
    data['FilterLabel3'] = this.filterLabel3;
    data['FilterLabel4'] = this.filterLabel4;
    data['FilterLabel5'] = this.filterLabel5;
    data['FilterLabel6'] = this.filterLabel6;
    data['DateLabel2'] = this.dateLabel2;
    data['DateLabel3'] = this.dateLabel3;
    data['DateLabel4'] = this.dateLabel4;
    data['DateLabel5'] = this.dateLabel5;
    data['DateLabel6'] = this.dateLabel6;
    return data;
  }
}
