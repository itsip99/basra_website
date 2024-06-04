import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterByDP extends StatefulWidget {
  static List<String> selectedRangeUM = [...DataSalesConst.rangeUM];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterByDP> {
  List<Map<String, dynamic>> listKategori = [
    {"name": 'TUNAI', "value": true},
    {"name": '<=10%', "value": true},
    {"name": '10%-15%', "value": true},
    {"name": '15%-20%', "value": true},
    {"name": '20%-25%', "value": true},
    {"name": '25%-30%', "value": true},
    {"name": '>30%', "value": true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    FilterByDP.selectedRangeUM =
        listKategori.map((item) => item['name'] as String).toList();

    print('Filter Awal Kategori: ${FilterByDP.selectedRangeUM}');
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
                Text('Range UM'),
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
              title: Text('Select Kategori'),
              content: Container(
                width: 200,
                height: 300,
                child: ListView.builder(
                  itemCount: listKategori.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(listKategori[index]["name"]),
                      trailing: Checkbox(
                        value: listKategori[index]["value"],
                        onChanged: (bool? value) {
                          setState(() {
                            listKategori[index]["value"] = value;
                            if (value == true) {
                              FilterByDP.selectedRangeUM
                                  .add(listKategori[index]["name"]);
                            } else {
                              FilterByDP.selectedRangeUM
                                  .remove(listKategori[index]["name"]);
                            }

                            print(
                                "Fitler Kategori yang dipilih ${FilterByDP.selectedRangeUM}");
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

                      listKategori.forEach((item) => item['value'] = true);
                      FilterByDP.selectedRangeUM = listKategori
                          .map((item) => item['name'] as String)
                          .toList();

                      print(
                          " check all Kategori: ${FilterByDP.selectedRangeUM}");
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listKategori.forEach((item) => item['value'] = false);

                      FilterByDP.selectedRangeUM.clear();

                      print(FilterByDP.selectedRangeUM);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
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
