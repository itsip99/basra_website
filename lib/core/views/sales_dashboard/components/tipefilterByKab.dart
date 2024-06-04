import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterbyKab extends StatefulWidget {
  static List<String> selectedKab = [...DataSalesConst.kabupaten_area];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterbyKab> {
  List<Map<String, dynamic>> listKab = [
    {"name": "ALOR", "value": true},
    {"name": "AMUNTAI", "value": true},
    {"name": "BALANGAN", "value": true},
    {"name": "BALIKPAPAN", "value": true},
    {"name": "BANJARBARU", "value": true},
    {"name": "BANJARMASIN", "value": true},
    {"name": "BANYUWANGI", "value": true},
    {"name": "BARABAI", "value": true},
    {"name": "BATULICIN", "value": true},
    {"name": "BELU", "value": true},
    {"name": "BERAU", "value": true},
    {"name": "BIMA", "value": true},
    {"name": "BOJONEGORO", "value": true},
    {"name": "BONDOWOSO", "value": true},
    {"name": "BONTANG", "value": true},
    {"name": "BUNTOK", "value": true},
    {"name": "ENDE", "value": true},
    {"name": "GRESIK", "value": true},
    {"name": "JEMBER", "value": true},
    {"name": "JOMBANG", "value": true},
    {"name": "KANDANGAN", "value": true},
    {"name": "KAPUAS", "value": true},
    {"name": "KASONGAN", "value": true},
    {"name": "KOTABARU", "value": true},
    {"name": "LAMONGAN", "value": true},
    {"name": "LOMBOK BARAT", "value": true},
    {"name": "LOMBOK TENGAH", "value": true},
    {"name": "LOMBOK TIMUR", "value": true},
    {"name": "LOMBOK UTARA", "value": true},
    {"name": "LUMAJANG", "value": true},
    {"name": "MADURA", "value": true},
    {"name": "MANGGARAI", "value": true},
    {"name": "MARTAPURA", "value": true},
    {"name": "MATARAM", "value": true},
    {"name": "MELAK", "value": true},
    {"name": "MLG KAB", "value": true},
    {"name": "MLG KOTA", "value": true},
    {"name": "MOJOKERTO", "value": true},
    {"name": "MUARA TEWEH", "value": true},
    {"name": "NTT", "value": true},
    {"name": "NUNUKAN", "value": true},
    {"name": "PALANGKARAYA", "value": true},
    {"name": "PANGKALAN BUN", "value": true},
    {"name": "PASURUAN", "value": true},
    {"name": "PELAIHARI", "value": true},
    {"name": "PROBOLINGGO", "value": true},
    {"name": "PURUKCAHU", "value": true},
    {"name": "RANTAU", "value": true},
    {"name": "SAMARINDA", "value": true},
    {"name": "SAMPIT", "value": true},
    {"name": "SANGATTA", "value": true},
    {"name": "SIDOARJO", "value": true},
    {"name": "SIKKA", "value": true},
    {"name": "SITUBONDO", "value": true},
    {"name": "SUMBA TIMUR", "value": true},
    {"name": "SUMBAWA", "value": true},
    {"name": "SURABAYA", "value": true},
    {"name": "TANAH GROGOT", "value": true},
    {"name": "TANJUNG", "value": true},
    {"name": "TARAKAN", "value": true},
    {"name": "TENGGARONG", "value": true},
    {"name": "TJ. SELOR", "value": true},
    {"name": "TUBAN", "value": true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    // FilterbyKab.selectedKab =
    //     listKab.map((item) => item['name'] as String).toList();
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
                Text('Kabupaten'),
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
            List<Map<String, dynamic>> filteredList = listKab.where((item) {
              final itemName = item["name"].toString().toLowerCase();
              final query = _searchController.text.toLowerCase();
              return itemName.contains(query);
            }).toList();

           
            return AlertDialog(
              title: Text('Select Kabupaten'),
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


                                  // listKab[index]["value"] = value;

                                  if (value == true) {
                                    FilterbyKab.selectedKab
                                        .add(filteredList[index]["name"]);

                                    print(
                                        'filter true ${FilterbyKab.selectedKab}');
                                  } else {
                                    FilterbyKab.selectedKab
                                        .remove(filteredList[index]["name"]);

                                    print(
                                        'filter false ${FilterbyKab.selectedKab}');
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

                      listKab.forEach((item) => item['value'] = true);

                      FilterbyKab.selectedKab = listKab
                          .map((item) => item['name'] as String)
                          .toList();

                      print(FilterbyKab.selectedKab);
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listKab.forEach((item) => item['value'] = false);

                      FilterbyKab.selectedKab.clear();

                      print(FilterbyKab.selectedKab);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
                    print(FilterbyKab.selectedKab);

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
