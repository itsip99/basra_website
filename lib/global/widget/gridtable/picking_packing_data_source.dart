import 'package:flutter/material.dart';
import 'package:stsj/core/models/Dashboard/picking_packing.dart';
import 'package:stsj/core/views/otorisasi/component/StyleService.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class PPDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  PPDataSource({required List<PickPackDetailsModel> ppData}) {
    _ppData = ppData.asMap().entries.map<DataGridRow>((data) {
      PickPackDetailsModel pickPack = data.value;
      int index = data.key;

      final pickPackData = DataGridRow(
        cells: [
          DataGridCell<String>(
            columnName: 'header',
            value: (index + 1).toString(),
          ),
          DataGridCell<String>(
            columnName: 'duNumber',
            value: pickPack.duNo.toString(),
          ),
          DataGridCell<String>(
            columnName: 'start',
            value: pickPack.startTime.toString().replaceAll(RegExp(r':'), '.'),
          ),
          DataGridCell<String>(
            columnName: 'end',
            value: pickPack.endTime.toString().replaceAll(RegExp(r':'), '.'),
          ),
          DataGridCell<String>(
            columnName: 'line',
            value: pickPack.line.toString(),
          ),
          DataGridCell<String>(
            columnName: 'timeDiff',
            value: pickPack.diff.toString(),
          ),
          DataGridCell<String>(
            columnName: 'leadTime',
            value: pickPack.leadTime.toString(),
          ),
          DataGridCell<String>(
            columnName: 'amt',
            value: StyleService.convertToIdr(pickPack.amount, 0),
          ),
        ],
      );

      return pickPackData;
    }).toList();
  }

  List<DataGridRow> _ppData = [];

  @override
  List<DataGridRow> get rows => _ppData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int index = _ppData.indexOf(row);

    return DataGridRowAdapter(
      color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
      cells: row.getCells().map<Widget>((e) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }).toList(),
    );
  }
}
