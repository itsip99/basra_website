import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterbyGrup extends StatefulWidget {
  static List<String> selectedGroup = [...DataSalesConst.groupName];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterbyGrup> {
  List<Map<String, dynamic>> listgroup = [
    {'name': 'CENTRAL', 'value': true},
    {'name': 'ID JEMBER', 'value': true},
    {'name': 'ID KALSEL', 'value': true},
    {'name': 'ID KALTENG', 'value': true},
    {'name': 'ID KALTIM', 'value': true},
    {'name': 'ID MALANG', 'value': true},
    {'name': 'ID NTB', 'value': true},
    {'name': 'ID SURABAYA', 'value': true},
    {'name': 'INDO PERKASA', 'value': true},
    {'name': 'IP JEMBER', 'value': true},
    {'name': 'IP NTB', 'value': true},
    {'name': 'KARTIKA GROUP', 'value': true},
    {'name': 'KARUNIA GROUP', 'value': true},
    {'name': 'METRO MOTOR', 'value': true},
    {'name': 'PUSAT GROUP', 'value': true},
    {'name': 'SINAR UTAMA', 'value': true},
    {'name': 'SIP JEMBER', 'value': true},
    {'name': 'SIP KALSEL', 'value': true},
    {'name': 'SIP KALTENG', 'value': true},
    {'name': 'SIP KALTIM', 'value': true},
    {'name': 'SIP MALANG', 'value': true},
    {'name': 'SIP NTB', 'value': true},
    {'name': 'SIP SURABAYA', 'value': true},
    {'name': 'SMA', 'value': true},
    {'name': 'SUMBER KARYA', 'value': true},
    {'name': 'TRISAKTI GROUP', 'value': true},
    {'name': 'TUGU MAS', 'value': true},
    {'name': 'UNION', 'value': true},
    {'name': 'UTAMA', 'value': true},
    {'name': 'YES GROUP NTT', 'value': true},
    {'name': 'YES GROUP SBY', 'value': true}
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();


    //masukan semua list saat pertama kali dirender
    FilterbyGrup.selectedGroup =
        listgroup.map((item) => item['name'] as String).toList();
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
                Text('Group'),
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
        final TextEditingController _searchController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
            List<Map<String, dynamic>> filteredList = listgroup.where((item) {
              final itemName = item["name"].toString().toLowerCase();
              final query = _searchController.text.toLowerCase();
              return itemName.contains(query);
            }).toList();

            setState(
              () {},
            );

            return AlertDialog(
              title: Text('Select Group'),
              content: Container(
                width: 200,
                height: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        // Update the filtered list when the text changes.
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        labelText: 'Search',
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          print('filter search ${filteredList.length}');
                          return ListTile(
                            title: Text(filteredList[index]["name"]),
                            trailing: Checkbox(
                              value: filteredList[index]["value"],
                              onChanged: (bool? value) {
                                setState(() {
                                  filteredList[index]["value"] = value;
                                  if (value == true) {
                                    FilterbyGrup.selectedGroup
                                        .add(filteredList[index]["name"]);

                                    print(
                                        'filter true ${FilterbyGrup.selectedGroup}');
                                  } else {
                                    FilterbyGrup.selectedGroup
                                        .remove(filteredList[index]["name"]);

                                    print(
                                        'filter false ${FilterbyGrup.selectedGroup}');
                                  }
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Check All
                      checkAll = true;

                      listgroup.forEach((item) => item['value'] = true);

                      FilterbyGrup.selectedGroup = listgroup
                          .map((item) => item['name'] as String)
                          .toList();

                      print(FilterbyGrup.selectedGroup);
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listgroup.forEach((item) => item['value'] = false);

                      FilterbyGrup.selectedGroup.clear();

                      print(FilterbyGrup.selectedGroup);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
                    print(FilterbyGrup.selectedGroup);

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
