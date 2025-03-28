// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stsj/core/models/Report/absent_history.dart';
import 'package:stsj/global/widget/gridtable/absent_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AbsentList extends StatefulWidget {
  const AbsentList(
    this.historyDetailList, {
    super.key,
  });

  final List<SipSalesmanHistoryModel> historyDetailList;

  @override
  State<AbsentList> createState() => _AbsentListState();
}

class _AbsentListState extends State<AbsentList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SfDataGrid(
        source: AbsentDataSource(absentData: widget.historyDetailList),
        columnWidthMode: ColumnWidthMode.fill,
        checkboxShape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        columns: <GridColumn>[
          GridColumn(
            columnName: 'branch',
            // width: MediaQuery.of(context).size.width * 0.15,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Toko'),
            ),
          ),
          GridColumn(
            columnName: 'placement',
            // width: MediaQuery.of(context).size.width * 0.15,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Penempatan'),
            ),
          ),
          GridColumn(
            columnName: 'date',
            // width: MediaQuery.of(context).size.width * 0.1,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Tanggal'),
            ),
          ),
          GridColumn(
            columnName: 'id',
            // width: MediaQuery.of(context).size.width * 0.1,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('NIP'),
            ),
          ),
          GridColumn(
            columnName: 'name',
            // width: MediaQuery.of(context).size.width * 0.2,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Nama',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GridColumn(
            columnName: 'time',
            // width: MediaQuery.of(context).size.width * 0.1,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Clock-In'),
            ),
          ),
          GridColumn(
            columnName: 'photo',
            // width: MediaQuery.of(context).size.width * 0.1,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Foto'),
            ),
          ),
        ],
      ),
    );
  }
}
