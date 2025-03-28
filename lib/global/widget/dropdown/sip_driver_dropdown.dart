import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';

class SipDriverDropdown extends StatefulWidget {
  const SipDriverDropdown({
    required this.listData,
    required this.inputan,
    required this.hint,
    required this.handle,
    this.disable = false,
    this.isMobile = false,
    this.isDriver = false,
    this.isPicking = false,
    super.key,
  });

  final List<dynamic> listData;
  final String inputan;
  final String hint;
  final Function handle;
  final bool disable;
  final bool isMobile;
  final bool isDriver;
  final bool isPicking;

  @override
  State<SipDriverDropdown> createState() => _SipDriverDropdownState();
}

class _SipDriverDropdownState extends State<SipDriverDropdown> {
  String teksDisable = '';
  String value = '';

  @override
  void initState() {
    value = widget.inputan;
    print('Value: $value');
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MenuState>(context);
    print(
        'SIP driver Dropdown provider: ${state.getFilteredDriverList.length}');
    print('SIP driver Dropdown data: ${widget.listData.length}');

    if (!widget.isMobile) {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          menuWidth: MediaQuery.of(context).size.width * 0.175,
          borderRadius: BorderRadius.circular(20),
          isExpanded: true,
          isDense: true,
          hint: Text(
            'Masukkan ${widget.hint}',
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
              : widget.listData.asMap().entries.map((entry) {
                  // final index = entry.key;
                  final driverName = entry.value;

                  return DropdownMenuItem(
                    value: driverName,
                    child: Text(
                      driverName,
                      textAlign: TextAlign.center,
                      style: GlobalFont.mediumfontR,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
          onChanged: (newValues) async {
            if (value != newValues) {
              setState(() => value = newValues.toString());
              // print('Province Dropdown value: $value');
              state.setBranchNameNotifier(value);

              await widget.handle(newValues);
            }
          },
        ),
      );
    } else {
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          menuWidth: MediaQuery.of(context).size.width * 0.175,
          borderRadius: BorderRadius.circular(20),
          isExpanded: true,
          isDense: true,
          hint: Text(
            'Masukkan ${widget.hint}',
            textAlign: TextAlign.center,
            style: GlobalFont.smallfontR,
          ),
          value: value == '' ? null : value,
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            size: 15,
            color: Colors.black,
          ),
          items: widget.disable == true
              ? null
              : widget.listData.asMap().entries.map((entry) {
                  // final int index = entry.key;
                  final driverName = entry.value;

                  return DropdownMenuItem(
                    value: driverName,
                    child: Text(
                      driverName,
                      textAlign: TextAlign.center,
                      style: GlobalFont.smallfontRBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
          onChanged: (newValues) async {
            if (value != newValues) {
              setState(() => value = newValues.toString());
              // print('Province Dropdown value: $value');
              state.setBranchNameNotifier(value);

              await widget.handle(newValues);
            }
          },
        ),
      );
    }
  }
}
