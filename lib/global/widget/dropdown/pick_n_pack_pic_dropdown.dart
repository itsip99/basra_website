import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

class PickPackPICDropdown extends StatefulWidget {
  const PickPackPICDropdown({
    required this.listData,
    required this.inputan,
    required this.hint,
    required this.handle,
    this.disable = false,
    this.isMobile = false,
    super.key,
  });

  final List<dynamic> listData;
  final String inputan;
  final String hint;
  final Function handle;
  final bool disable;
  final bool isMobile;

  @override
  State<PickPackPICDropdown> createState() => _PickPackPICDropdownState();
}

class _PickPackPICDropdownState extends State<PickPackPICDropdown> {
  String teksDisable = '';
  String value = '';

  @override
  void initState() {
    value = widget.inputan;
    print('Value: $value');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  final picName = entry.value;

                  return DropdownMenuItem(
                    value: picName,
                    child: Text(
                      picName,
                      textAlign: TextAlign.center,
                      style: GlobalFont.mediumfontR,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
          onChanged: (newValues) async {
            if (value != newValues) {
              setState(() => value = newValues.toString());

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
                  final picName = entry.value;

                  return DropdownMenuItem(
                    value: picName,
                    child: Text(
                      picName,
                      textAlign: TextAlign.center,
                      style: GlobalFont.smallfontRBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
          onChanged: (newValues) async {
            if (value != newValues) {
              setState(() => value = newValues.toString());

              await widget.handle(newValues);
            }
          },
        ),
      );
    }
  }
}
