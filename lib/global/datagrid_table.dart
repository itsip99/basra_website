import 'package:flutter/material.dart';
import 'package:stsj/core/models/Dashboard/delivery_memo.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class DeliveryDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  DeliveryDataSource({required List<DeliveryMemoModel> deliveryData}) {
    _deliveryData = deliveryData.expand<DataGridRow>((delivery) {
      bool isFirstLevel = true;

      final deliveryCase = delivery.casing.expand<DataGridRow>((casing) {
        isFirstLevel = true;
        bool isSecondLevel = true;

        final caseDetails = casing.details.map<DataGridRow>((details) {
          final data = DataGridRow(
            cells: [
              DataGridCell<String>(
                columnName: 'transId',
                value: isFirstLevel ? delivery.transNumber : '',
              ),
              DataGridCell<String>(
                columnName: 'date',
                value: isFirstLevel ? delivery.transDate : '',
              ),
              DataGridCell<String>(
                columnName: 'duNumber',
                value: isFirstLevel ? delivery.duNumber : '',
              ),
              DataGridCell<String>(
                columnName: 'casingNo',
                value: isSecondLevel ? casing.casingNumber : '',
              ),
              DataGridCell<String>(
                columnName: 'koli',
                value: isSecondLevel ? casing.koli.toString() : '',
              ),
              DataGridCell<String>(
                columnName: 'qty',
                value: isSecondLevel ? casing.qtyCase.toString() : '',
              ),
              DataGridCell<String>(
                columnName: 'unitId',
                value: details.unitId,
              ),
              DataGridCell<String>(
                columnName: 'itemName',
                value: details.itemName,
              ),
              DataGridCell<String>(
                columnName: 'itemQty',
                value: details.qty.toString(),
              ),
            ],
          );

          isFirstLevel = false;
          isSecondLevel = false;
          return data;
        }).toList();

        return caseDetails;
      }).toList();

      return deliveryCase;
    }).toList();
  }

  List<DataGridRow> _deliveryData = [];

  @override
  List<DataGridRow> get rows => _deliveryData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int index = _deliveryData.indexOf(row);

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
