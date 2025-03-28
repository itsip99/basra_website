import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/models/Report/absent_history.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class AbsentDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  AbsentDataSource({required List<SipSalesmanHistoryModel> absentData}) {
    urlList.clear();
    urlList.addAll(absentData.map((e) => e.eventPhotoUrl).toList());

    _absentData = absentData.asMap().entries.map<DataGridRow>((data) {
      SipSalesmanHistoryModel absent = data.value;
      // int index = data.key;

      final absentData = DataGridRow(
        cells: [
          DataGridCell<String>(
            columnName: 'branch',
            value: absent.shopName,
          ),
          DataGridCell<String>(
            columnName: 'placement',
            value: absent.locationName,
          ),
          DataGridCell<String>(
            columnName: 'date',
            value: Format.tanggalFormat(absent.date),
          ),
          DataGridCell<String>(
            columnName: 'id',
            value: absent.employeeID,
          ),
          DataGridCell<String>(
            columnName: 'name',
            value: absent.employeeName,
          ),
          DataGridCell<String>(
            columnName: 'time',
            value: absent.checkIn.isEmpty ? '-' : absent.checkIn,
          ),
          DataGridCell<String>(
            columnName: 'photo',
            value: absent.eventPhotoThumb,
          ),
        ],
      );

      return absentData;
    }).toList();
  }

  List<String> urlList = [];

  List<DataGridRow> _absentData = [];

  @override
  List<DataGridRow> get rows => _absentData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int index = _absentData.indexOf(row);

    return DataGridRowAdapter(
      color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
      cells: row.getCells().asMap().entries.map<Widget>((e) {
        int num = e.key;
        DataGridCell data = e.value;

        print(num);
        if (num == 6 &&
            _absentData[index].getCells()[num].value.toString().isNotEmpty) {
          return GestureDetector(
            onTap: () async {
              Uri uri = Uri.parse(urlList[index]);

              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            child: Image.memory(
              base64Decode(data.value.toString()),
            ),
          );
        } else {
          if (data.value.toString().isNotEmpty) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                data.value.toString(),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text('-'),
            );
          }
        }
      }).toList(),
    );
  }
}
