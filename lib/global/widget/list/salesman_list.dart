import 'package:flutter/material.dart';
import 'package:stsj/core/models/Report/mbrowse_salesman.dart';
import 'package:stsj/global/widget/gridtable/salesman_data_source.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesmanList extends StatefulWidget {
  const SalesmanList(
    this.salesmanDataList, {
    super.key,
  });

  final List<MBrowseSalesman> salesmanDataList;

  @override
  State<SalesmanList> createState() => _SalesmanListState();
}

class _SalesmanListState extends State<SalesmanList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SfDataGrid(
        source: SalesmanDataSource(salesmanData: widget.salesmanDataList),
        columnWidthMode: ColumnWidthMode.fill,
        checkboxShape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20.0),
        ),
        columns: <GridColumn>[
          GridColumn(
            columnName: 'branch',
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Cabang'),
            ),
          ),
          GridColumn(
            columnName: 'shop',
            width: MediaQuery.of(context).size.width * 0.15,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Toko'),
            ),
          ),
          GridColumn(
            columnName: 'location',
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Penempatan'),
            ),
          ),
          GridColumn(
            columnName: 'id',
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('NIP'),
            ),
          ),
          GridColumn(
            columnName: 'name',
            width: MediaQuery.of(context).size.width * 0.15,
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
            columnName: 'level',
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Level'),
            ),
          ),
          GridColumn(
            columnName: 'status',
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('status'),
            ),
          ),
          GridColumn(
            columnName: 'photo',
            width: MediaQuery.of(context).size.width * 0.075,
            label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text('Foto'),
            ),
          ),
          // GridColumn(
          //   columnName: 'map',
          //   label: Container(
          //     padding: EdgeInsets.all(16.0),
          //     alignment: Alignment.center,
          //     child: Text('Link Map'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
