import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';

class StaticMenuDropdown extends StatefulWidget {
  const StaticMenuDropdown(
      {required this.inputan,
      required this.hint,
      required this.handle,
      this.disable = false,
      super.key});
  final String inputan;
  final String hint;
  final Function handle;
  final bool disable;

  @override
  State<StaticMenuDropdown> createState() => AreaeDropdownState();
}

class AreaeDropdownState extends State<StaticMenuDropdown> {
  String teksDisable = '';
  String value = '';

  @override
  void initState() {
    value = widget.inputan;
    // print('List data: ${widget.listData.length}');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final staticMenuState = Provider.of<MapState>(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        isDense: true,
        hint: Text(
          'Pilih ${widget.hint}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Metropolis',
          ),
        ),
        value: value == '' ? null : value,
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
          size: 25,
          color: Colors.black,
        ),
        items: widget.disable == true
            ? null
            : [
                DropdownMenuItem(
                  value: '',
                  child: Text(
                    '',
                    textAlign: TextAlign.center,
                    style: GlobalFont.mediumfontR,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DropdownMenuItem(
                  value: 'sales',
                  child: Text(
                    'Sales',
                    textAlign: TextAlign.center,
                    style: GlobalFont.mediumfontR,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                DropdownMenuItem(
                  value: 'activity',
                  child: Text(
                    'Activity',
                    textAlign: TextAlign.center,
                    style: GlobalFont.mediumfontR,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
        onChanged: (newValues) {
          if (value != newValues) {
            setState(() => value = newValues.toString());
            // print('Province Dropdown value: $value');
            // dropdownState.setAreaNotifier(value);
            widget.handle(staticMenuState, newValues);
          }
        },
      ),
    );
  }
}
