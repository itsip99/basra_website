import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterbyTahunBelow extends StatefulWidget {
  static List<String> selectedTahunBelow = [...DataSalesConst.tahunMotor];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterbyTahunBelow> {
  List<Map<String, dynamic>> listArea = [
    {"name": "BELOW 2018", "value": true},
    {"name": "2024", "value": true},
    {"name": "2023", "value": true},
    {"name": "2022", "value": true},
    {"name": "2021", "value": true},
    {"name": "2020", "value": true},
    {"name": "2019", "value": true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    // FilterbyTahunBelow.selectedTahunBelow =
    //     listArea.map((item) => item['name'] as String).toList();

    FilterbyTahunBelow.selectedTahunBelow = [...DataSalesConst.tahunMotor];

    print('selected area awal ${FilterbyTahunBelow.selectedTahunBelow}');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white), // Warna latar belakang
              elevation: MaterialStateProperty.all<double>(
                  0), // Menghilangkan bayangan
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Atur sudut border
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1.0), // Atur warna dan ketebalan border
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20)), // Padding
            ),
            onPressed: () {
              _showMultiSelectDialog();
            },
            child: Row(
              children: [
                Text('Tahun Motor'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMultiSelectDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select Tahun Motor'),
              content: Container(
                width: 200,
                height: 300,
                child: ListView.builder(
                  itemCount: listArea.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(listArea[index]["name"]),
                      trailing: Checkbox(
                        value: listArea[index]["value"],
                        onChanged: (bool? value) {
                          setState(() {
                            listArea[index]["value"] = value;
                            if (value == true) {
                              FilterbyTahunBelow.selectedTahunBelow
                                  .add(listArea[index]["name"]);

                              print(
                                  'filter true ${FilterbyTahunBelow.selectedTahunBelow}');
                            } else {
                              FilterbyTahunBelow.selectedTahunBelow
                                  .remove(listArea[index]["name"]);

                              print(
                                  'filter false ${FilterbyTahunBelow.selectedTahunBelow}');
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Check All
                      checkAll = true;

                      listArea.forEach((item) => item['value'] = true);

                      FilterbyTahunBelow.selectedTahunBelow = listArea
                          .map((item) => item['name'] as String)
                          .toList();

                      print(FilterbyTahunBelow.selectedTahunBelow);
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listArea.forEach((item) => item['value'] = false);

                      FilterbyTahunBelow.selectedTahunBelow.clear();

                      print(FilterbyTahunBelow.selectedTahunBelow);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
                    print(FilterbyTahunBelow.selectedTahunBelow);

                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
