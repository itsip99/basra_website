import 'package:flutter/material.dart';
import 'package:stsj/core/models/Report/mbrowse_salesman.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:url_launcher/url_launcher.dart';

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class SalesmanDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  SalesmanDataSource({required List<MBrowseSalesman> salesmanData}) {
    photoUrlList.clear();
    photoUrlList.addAll(salesmanData.map((e) => e.photoUrl).toList());

    mapUrlList.clear();
    mapUrlList.addAll(salesmanData.map((e) => e.mapUrl).toList());

    _salesmanData = salesmanData.asMap().entries.map<DataGridRow>((data) {
      MBrowseSalesman salesman = data.value;
      // int index = data.key;

      final salesmanData = DataGridRow(
        cells: [
          // 1
          DataGridCell<String>(
            columnName: 'branch',
            value: salesman.branchName,
          ),
          // 2
          DataGridCell<String>(
            columnName: 'shop',
            value: salesman.shopName,
          ),
          // 3
          DataGridCell<String>(
            columnName: 'location',
            value: salesman.locationName,
          ),
          // 4
          DataGridCell<String>(
            columnName: 'id',
            value: salesman.employeeId,
          ),
          // 5
          DataGridCell<String>(
            columnName: 'name',
            value: salesman.employeeName,
          ),
          // 6
          DataGridCell<String>(
            columnName: 'level',
            value: salesman.positionName,
          ),
          // 7
          DataGridCell<String>(
            columnName: 'status',
            value: salesman.isActive == '1' ? 'Aktif' : 'Tidak Aktif',
          ),
          // 8
          DataGridCell<String>(
            columnName: 'photo',
            value: salesman.photoUrl,
          ),
          // 9
          // DataGridCell<IconData>(
          //   columnName: 'map',
          //   value: salesman.mapUrl.isNotEmpty
          //       ? Icons.open_in_new_rounded
          //       : Icons.open_in_new_off_rounded,
          // ),
        ],
      );

      return salesmanData;
    }).toList();
  }

  List<String> photoUrlList = [];
  List<String> mapUrlList = [];

  List<DataGridRow> _salesmanData = [];

  @override
  List<DataGridRow> get rows => _salesmanData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    int index = _salesmanData.indexOf(row);

    return DataGridRowAdapter(
      color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
      cells: row.getCells().asMap().entries.map<Widget>((e) {
        int num = e.key;
        DataGridCell data = e.value;

        print('Index: $index');
        print(num);
        if (num == 7 &&
            _salesmanData[index].getCells()[num].value.toString().isNotEmpty) {
          // print('$num. isPhoto');
          return GestureDetector(
            onTap: () async {
              Uri uri = Uri.parse(photoUrlList[index]);

              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            child: Image.network(
              photoUrlList[index],
              width: 100,
              height: 100,
            ),
          );
        }
        // Not used for awhile
        else if (num == 8 &&
            _salesmanData[index].getCells()[num].value.toString().isNotEmpty) {
          // print('$num. isMap');
          return IconButton(
            onPressed: () async {
              Uri uri = Uri.parse(mapUrlList[index]);

              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            icon: Icon(Icons.open_in_new_rounded),
          );
        } else {
          if (data.value.toString().isNotEmpty) {
            if (num == 2 &&
                _salesmanData[index]
                    .getCells()[num]
                    .value
                    .toString()
                    .isNotEmpty) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                    if (mapUrlList[index].isNotEmpty) {
                      Uri uri = Uri.parse(mapUrlList[index]);

                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    }
                  },
                  child: Text(
                    data.value.toString(),
                    textAlign: TextAlign.center,
                    style: (mapUrlList[index].isNotEmpty)
                        ? TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          )
                        : TextStyle(),
                  ),
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  data.value.toString(),
                  textAlign: TextAlign.center,
                ),
              );
            }
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text('N/A'),
            );
          }
        }
      }).toList(),
    );
  }
}
