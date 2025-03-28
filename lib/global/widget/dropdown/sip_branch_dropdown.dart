// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';

class SipBranchDropdown extends StatefulWidget {
  SipBranchDropdown({
    required this.listData,
    required this.inputan,
    required this.hint,
    required this.handle,
    this.disable = false,
    this.isMobile = false,
    super.key,
  });

  final List<dynamic> listData;
  String inputan;
  final String hint;
  final Function handle;
  final bool disable;
  final bool isMobile;

  @override
  State<SipBranchDropdown> createState() => _SipBranchDropdownState();
}

class _SipBranchDropdownState extends State<SipBranchDropdown> {
  String teksDisable = '';
  String value = '';

  void loadBranchList(MenuState state) async {
    if (state.getSipBranchNameList.isEmpty) {
      await state.loadSipBranches();
    }

    if (state.getSipShopNameList.isNotEmpty) {
      state.getSipShopNameList.clear();
    }

    if (state.getSipLocationNameList.isNotEmpty) {
      state.getSipLocationNameList.clear();
    }
  }

  @override
  void initState() {
    loadBranchList(Provider.of<MenuState>(context, listen: false));
    if (widget.inputan.isNotEmpty) {
      widget.inputan = '';
    }
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
    // print('SIP Dropdown provider: ${state.getSipBranchList.length}');
    // print('SIP Dropdown data: ${widget.listData.length}');

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
                  final data = entry.value;

                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data,
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
              try {
                await state.loadSipShops(branch: newValues.toString());
              } catch (e) {
                print('loadSipShopsError: $e');
              }
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
                  final data = entry.value;

                  return DropdownMenuItem(
                    value: data,
                    child: Text(
                      data,
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
              try {
                await state.loadSipShops(branch: newValues.toString());
              } catch (e) {
                print('loadSipShops Error: $e');
              }
            }
          },
        ),
      );
    }
  }
}
