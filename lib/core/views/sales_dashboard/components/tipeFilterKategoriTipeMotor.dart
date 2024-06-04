import 'package:flutter/material.dart';
import 'package:stsj/static/dataArea.const.dart';

class FilterbyTipeMotor extends StatefulWidget {
  static List<String> selectedTipeMotor = [...DataSalesConst.TipeMotor];

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FilterbyTipeMotor> {
  List<Map<String, dynamic>> listMotor = [
    {'name': 'AEROX', 'value': true},
    {'name': 'AEROX 155 VVA', 'value': true},
    {'name': 'AEROX 155 VVA DOXOU', 'value': true},
    {'name': 'AEROX 155 VVA GP', 'value': true},
    {'name': 'AEROX 155 VVA GP - MONSTER', 'value': true},
    {'name': 'AEROX 155 VVA R VERSION', 'value': true},
    {'name': 'AEROX 155 VVA S VERSION', 'value': true},
    {'name': 'AEROX GP MOVISTAR', 'value': true},
    {'name': 'ALL NEW AEROX 155 CONNECTED CYBERCITY', 'value': true},
    {'name': 'ALL NEW AEROX 155 VVA', 'value': true},
    {'name': 'ALL NEW AEROX 155 VVA ABS', 'value': true},
    {'name': 'ALL NEW AEROX 155 VVA ABS GP', 'value': true},
    {'name': 'ALL NEW AEROX 155 VVA ABS WGP 60TH', 'value': true},
    {'name': 'ALL NEW NMAX 155', 'value': true},
    {'name': 'ALL NEW NMAX 155 ABS', 'value': true},
    {'name': 'ALL NEW NMAX 155 CONNECTED', 'value': true},
    {'name': 'ALL NEW R15 155 VVA', 'value': true},
    {'name': 'ALL NEW R15 155 VVA GP', 'value': true},
    {'name': 'ALL NEW R15 155 VVA GP - MONSTER', 'value': true},
    {'name': 'ALL NEW R15 ABS CONNECTED', 'value': true},
    {'name': 'ALL NEW R15 ABS CONNECTED WGP', 'value': true},
    {'name': 'ALL NEW R15 CONNECTED', 'value': true},
    {'name': 'ALL NEW SOUL GT', 'value': true},
    {'name': 'ALL NEW SOUL GT AKS', 'value': true},
    {'name': 'ALL NEW SOUL GT AKS SSS', 'value': true},
    {'name': 'ALL NEW VIXION', 'value': true},
    {'name': 'ALL NEW VIXION GP', 'value': true},
    {'name': 'ALL NEW VIXION GP - MONSTER', 'value': true},
    {'name': 'ALL NEW VIXION R', 'value': true},
    {'name': 'ALL NEW X-RIDE 125', 'value': true},
    {'name': 'BYSON', 'value': true},
    {'name': 'F1ZR', 'value': true},
    {'name': 'FAZZIO LUX', 'value': true},
    {'name': 'FAZZIO NEO', 'value': true},
    {'name': 'FINO CLASSIC', 'value': true},
    {'name': 'FINO FASHION', 'value': true},
    {'name': 'FINO GRANDE 125', 'value': true},
    {'name': 'FINO PREMIUM FI', 'value': true},
    {'name': 'FINO SPORTY', 'value': true},
    {'name': 'FINO SPORTY FI', 'value': true},
    {'name': 'FORCE', 'value': true},
    {'name': 'FORCE ELEGANT', 'value': true},
    {'name': 'FREE GO', 'value': true},
    {'name': 'FREE GO 125', 'value': true},
    {'name': 'FREE GO 125 CONNECTED', 'value': true},
    {'name': 'FREE GO S', 'value': true},
    {'name': 'FREE GO S ABS', 'value': true},
    {'name': 'GEAR 125', 'value': true},
    {'name': 'GEAR 125 S', 'value': true},
    {'name': 'GRAND FILANO LUX', 'value': true},
    {'name': 'GRAND FILANO NEO', 'value': true},
    {'name': 'GT 125', 'value': true},
    {'name': 'GT 125 GARUDA', 'value': true},
    {'name': 'JUP MX CW NEW', 'value': true},
    {'name': 'JUPITER MX 150', 'value': true},
    {'name': 'JUPITER MX CW', 'value': true},
    {'name': 'JUPITER Z CW', 'value': true},
    {'name': 'JUPITER Z1 CW FI', 'value': true},
    {'name': 'JUPITER Z1 FI', 'value': true},
    {'name': 'JUPITER Z1 FURIOUS', 'value': true},
    {'name': 'JUPITERMXATCW NEW', 'value': true},
    {'name': 'LEXAM', 'value': true},
    {'name': 'LEXI', 'value': true},
    {'name': 'LEXI ABS', 'value': true},
    {'name': 'LEXI S', 'value': true},
    {'name': 'MIO', 'value': true},
    {'name': 'MIO CW', 'value': true},
    {'name': 'MIO CW SE', 'value': true},
    {'name': 'MIO GT', 'value': true},
    {'name': 'MIO GT GP', 'value': true},
    {'name': 'MIO J CW', 'value': true},
    {'name': 'MIO J CW FI TEEN', 'value': true},
    {'name': 'MIO J FI', 'value': true},
    {'name': 'MIO M3 AKS SSS', 'value': true},
    {'name': 'MIO S', 'value': true},
    {'name': 'MIO SOUL', 'value': true},
    {'name': 'MIO Z', 'value': true},
    {'name': 'MT09', 'value': true},
    {'name': 'MT15', 'value': true},
    {'name': 'MT25', 'value': true},
    {'name': 'MT25 NEW (B9T100)', 'value': true},
    {'name': 'MX KING 150', 'value': true},
    {'name': 'MX KING 150 DOXOU', 'value': true},
    {'name': 'MX KING 150 GP', 'value': true},
    {'name': 'MX KING 150 GP - MONSTER', 'value': true},
    {'name': 'MX KING WGP 60TH', 'value': true},
    {'name': 'NEW BYSON FI', 'value': true},
    {'name': 'NEW FINO PREMIUM 125', 'value': true},
    {'name': 'NEW FINO SPORTY 125', 'value': true},
    {'name': 'NEW MIO M3 CW', 'value': true},
    {'name': 'NEW MIO M3 SP', 'value': true},
    {'name': 'NEW VIXION (SE)', 'value': true},
    {'name': 'NEW VIXION ADVANCE', 'value': true},
    {'name': 'NEW VIXION ADVANCEGP', 'value': true},
    {'name': 'NEW VIXION GP', 'value': true},
    {'name': 'NMAX', 'value': true},
    {'name': 'NMAX ABS', 'value': true},
    {'name': 'SCORPIO Z CW', 'value': true},
    {'name': 'SCORPIO Z LE', 'value': true},
    {'name': 'SOUL GT', 'value': true},
    {'name': 'SOUL GT STREET', 'value': true},
    {'name': 'V-IXION', 'value': true},
    {'name': 'VEGA FORCE DB CW', 'value': true},
    {'name': 'VEGA FORCE DB SW', 'value': true},
    {'name': 'VEGA RR', 'value': true},
    {'name': 'VEGA RR DB', 'value': true},
    {'name': 'VEGA ZR', 'value': true},
    {'name': 'VEGA ZRD', 'value': true},
    {'name': 'WR155', 'value': true},
    {'name': 'WR155 GP', 'value': true},
    {'name': 'X MAX CONNECTED', 'value': true},
    {'name': 'X-RIDE', 'value': true},
    {'name': 'X-RIDE (ASE)', 'value': true},
    {'name': 'X-RIDE (SE)', 'value': true},
    {'name': 'XABRE', 'value': true},
    {'name': 'XEON', 'value': true},
    {'name': 'XEON RC', 'value': true},
    {'name': 'XMAX', 'value': true},
    {'name': 'XSR', 'value': true},
    {'name': 'XSR WGP', 'value': true},
    {'name': 'YZF-R15', 'value': true},
    {'name': 'YZF-R15 GP MOVISTAR', 'value': true},
    {'name': 'YZF-R25', 'value': true},
    {'name': 'YZF-R25 ABS', 'value': true},
    {'name': 'YZF-R25 ABS WGP', 'value': true},
    {'name': 'YZF-R25 GP', 'value': true},
    {'name': 'YZF-R25 GP MOVISTAR', 'value': true},
    {'name': 'YZF-R25 GP TECH 3', 'value': true},
  ];

  bool checkAll = false;

  @override
  void initState() {
    super.initState();

    FilterbyTipeMotor.selectedTipeMotor =
        listMotor.map((item) => item['name'] as String).toList();
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
                Text('Tipe Motor'),
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
            List<Map<String, dynamic>> filteredList = listMotor.where((item) {
              final itemName = item["name"].toString().toLowerCase();
              final query = _searchController.text.toLowerCase();

              return itemName.contains(query);
            }).toList();

            setState(
              () {},
            );

            return AlertDialog(
              title: Text('Select Tipe Motor'),
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
                                    FilterbyTipeMotor.selectedTipeMotor
                                        .add(filteredList[index]["name"]);

                                    print(
                                        'filter true ${FilterbyTipeMotor.selectedTipeMotor}');
                                  } else {
                                    FilterbyTipeMotor.selectedTipeMotor
                                        .remove(filteredList[index]["name"]);

                                    print(
                                        'filter false ${FilterbyTipeMotor.selectedTipeMotor}');
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

                      listMotor.forEach((item) => item['value'] = true);

                      FilterbyTipeMotor.selectedTipeMotor = listMotor
                          .map((item) => item['name'] as String)
                          .toList();

                      print(FilterbyTipeMotor.selectedTipeMotor);
                    });
                  },
                  child: Text('Check All'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Uncheck All
                      listMotor.forEach((item) => item['value'] = false);

                      FilterbyTipeMotor.selectedTipeMotor.clear();

                      print(FilterbyTipeMotor.selectedTipeMotor);
                    });
                  },
                  child: Text('Uncheck All'),
                ),
                TextButton(
                  onPressed: () {
                    print(FilterbyTipeMotor.selectedTipeMotor);

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
