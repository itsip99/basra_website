import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterKategori extends StatefulWidget {
  static List<String> selectedKategori = [...DataSalesConst.Mktkategori];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterKategori> {
  List<Map<String, dynamic>> listKategori = [
    {"name": 'LPM', "value": true},
    {"name": 'PP<125CC', "value": true},
    {"name": 'PP>125CC', "value": true},
    {"name": 'AT LPM', "value": true},
    {"name": 'AT STD', "value": true},
    {"name": 'AT STYLISH', "value": true},
    {"name": 'AT PREM 125', "value": true},
    {"name": 'AT PREM 150', "value": true},
    {"name": 'SPORT STD', "value": true},
    {"name": 'SPORT PREM', "value": true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    FilterKategori.selectedKategori = [...DataSalesConst.Mktkategori];

    print('Filter Awal Kategori: ${FilterKategori.selectedKategori}');
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
                Text('Kategori'),
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
                              FilterKategori.selectedKategori
                                  .add(listKategori[index]["name"]);
                            } else {
                              FilterKategori.selectedKategori
                                  .remove(listKategori[index]["name"]);
                            }

                            print(
                                "Fitler Kategori yang dipilih ${FilterKategori.selectedKategori}");
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
                      FilterKategori.selectedKategori = listKategori
                          .map((item) => item['name'] as String)
                          .toList();

                      print(
                          " check all Kategori: ${FilterKategori.selectedKategori}");
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listKategori.forEach((item) => item['value'] = false);

                      FilterKategori.selectedKategori.clear();

                      print(FilterKategori.selectedKategori);
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
