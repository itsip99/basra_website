import 'package:flutter/material.dart';

class FilterKategoriRadio extends StatefulWidget {
  static String selectedKategori = "LPM";

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterKategoriRadio> {
  List<Map<String, dynamic>> listKategori = [
    {"name": 'LPM', "value": false},
    {"name": 'PP<125CC', "value": false},
    {"name": 'PP>125CC', "value": false},
    {"name": 'AT LPM', "value": false},
    {"name": 'AT STD', "value": false},
    {"name": 'AT STYLISH', "value": false},
    {"name": 'AT PREM 125', "value": false},
    {"name": 'AT PREM 150', "value": false},
    {"name": 'SPORT STD', "value": false},
    {"name": 'SPORT PREM', "value": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 20)),
            ),
            onPressed: () {
              _showSingleSelectDialog();
            },
            child: Row(
              children: [
                Text('Filter By Kategori'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showSingleSelectDialog() {
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
                      trailing: Radio<String>(
                        value: listKategori[index]["name"],
                        groupValue: FilterKategoriRadio.selectedKategori,
                        onChanged: (String? value) {
                          setState(() {
                            FilterKategoriRadio.selectedKategori =
                                value!.toString();
                            print(
                                'filter Leasing DP selected ${FilterKategoriRadio.selectedKategori} ');
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
