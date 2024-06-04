import 'package:flutter/material.dart';

class FilterByLeasingRadio extends StatefulWidget {
  static String selectedLeasingDP =
      "BAF"; // Gunakan String untuk menyimpan kategori yang terpilih

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterByLeasingRadio> {
  List<Map<String, dynamic>> listLeasing = [
    {"name": 'BAF', "value": false},
    {"name": 'ADIRA', "value": false},
    {"name": 'SOF', "value": false},
    {"name": 'IMFI', "value": false},
    {"name": 'MANDALA', "value": false},
    {"name": 'MF', "value": false},
    {"name": 'MAF', "value": false},
    {"name": 'WOM', "value": false},
    {"name": 'CSF', "value": false},
    {"name": 'MUF', "value": false},
    {"name": 'OTHER', "value": false},
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
                Text('Leasing'),
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
              title: Text('Select Leasing'),
              content: Container(
                width: 200,
                height: 300,
                child: ListView.builder(
                  itemCount: listLeasing.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(listLeasing[index]["name"]),
                      trailing: Radio<String>(
                        value: listLeasing[index]["name"],
                        groupValue: FilterByLeasingRadio.selectedLeasingDP,
                        onChanged: (String? value) {
                          setState(() {
                            FilterByLeasingRadio.selectedLeasingDP =
                                value!.toString();

                            print(
                                'selected leasingDP ${FilterByLeasingRadio.selectedLeasingDP}');
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
