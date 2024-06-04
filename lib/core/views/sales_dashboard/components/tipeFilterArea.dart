import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterbyArea extends StatefulWidget {
  static List<String> selectedArea = [...DataSalesConst.listarea];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterbyArea> {
  List<Map<String, dynamic>> listArea = [
    {"name": "KOTA+SDA", "value": true},
    {"name": "SBY OUT", "value": true},
    {"name": "NTT", "value": true},
    {"name": "MALANG", "value": true},
    {"name": "JEMBER", "value": true},
    {"name": "NTB", "value": true},
    {"name": "KALSEL", "value": true},
    {"name": "KALTENG", "value": true},
    {"name": "KALTIM", "value": true},
    {"name": "KALTARA", "value": true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    FilterbyArea.selectedArea = [...DataSalesConst.listarea];

    print('selected area awal ${FilterbyArea.selectedArea}');
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
                Text('Area'),
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
              title: Text('Select Areas'),
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
                              FilterbyArea.selectedArea
                                  .add(listArea[index]["name"]);

                              print('filter true ${FilterbyArea.selectedArea}');
                            } else {
                              FilterbyArea.selectedArea
                                  .remove(listArea[index]["name"]);

                              print(
                                  'filter false ${FilterbyArea.selectedArea}');
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

                      FilterbyArea.selectedArea = listArea
                          .map((item) => item['name'] as String)
                          .toList();

                      print(FilterbyArea.selectedArea);
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listArea.forEach((item) => item['value'] = false);

                      FilterbyArea.selectedArea.clear();

                      print(FilterbyArea.selectedArea);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
                    print(FilterbyArea.selectedArea);

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
