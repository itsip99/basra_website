import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';

class SisBranchShopDropdown extends StatefulWidget {
  const SisBranchShopDropdown({
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
  State<SisBranchShopDropdown> createState() => _SisBranchShopDropdownState();
}

class _SisBranchShopDropdownState extends State<SisBranchShopDropdown> {
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
    print('SIS Dropdown provider: ${state.getFilteredDriverList.length}');
    print('SIS Dropdown data: ${widget.listData.length}');

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
                  final branchName = entry.value;

                  return DropdownMenuItem(
                    value: branchName,
                    child: Text(
                      branchName,
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

              if (widget.isDriver) {
                await state.filterDriver(newValues.toString());
                state.setFilteredDriverNameList(
                  state.getFilteredDriverList
                      .map((e) => e.employeeName)
                      .toList(),
                );
                state.setFilteredDriverNameListNotifier(
                  state.getFilteredDriverNameList,
                );
              } else {
                if (widget.isPicking) {
                  await state.fetchPickingPIC(newValues.toString());
                } else {
                  await state.fetchPackingPIC(newValues.toString());
                }
              }

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
                  final branchName = entry.value;

                  return DropdownMenuItem(
                    value: branchName,
                    child: Text(
                      branchName,
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

              if (widget.isDriver) {
                state.filterDriver(newValues.toString());
                state.setFilteredDriverNameList(
                  state.getFilteredDriverList
                      .map((e) => e.employeeName)
                      .toList(),
                );
              } else {
                if (widget.isPicking) {
                  state.fetchPickingPIC(newValues.toString());
                } else {
                  state.fetchPackingPIC(newValues.toString());
                }
              }

              await widget.handle(newValues);
            }
          },
        ),
      );
    }
  }
}
