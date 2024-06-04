// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FilterByLeasingRadio extends StatefulWidget {
  List<Map<String, dynamic>> listItem = [];
  final String title;
  final String desc;
  final void Function(String input) onSelect;
  String selected;

  FilterByLeasingRadio({
    Key? key,
    required this.listItem,
    required this.title,
    required this.desc,
    required this.onSelect,
    required this.selected,
  }) : super(key: key);

  @override
  _FilterByLeasingRadioState createState() => _FilterByLeasingRadioState();
}

class _FilterByLeasingRadioState extends State<FilterByLeasingRadio> {
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
                Text(widget.title),
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
              title: Text(widget.desc),
              content: Container(
                width: 200,
                height: 300,
                child: ListView.builder(
                  itemCount: widget.listItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioListTile<String>(
                      title: Text(widget.listItem[index]["name"]),
                      value: widget.listItem[index]["name"],
                      groupValue: widget.selected,
                      onChanged: (String? value) {
                        setState(() {
                          widget.selected = value!;
                          widget.onSelect(value);
                        });
                      },
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
