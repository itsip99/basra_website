import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stsj/global/font.dart';

class WTanggal extends StatefulWidget {
  WTanggal(this.label, this.value, this.handle, {this.mode = 1, super.key});

  final String label;
  final int mode;
  final Function handle;
  late DateTime value;

  @override
  State<WTanggal> createState() => _MyPageState();
}

class _MyPageState extends State<WTanggal> {
  void refreshTanggal() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2999),
      builder: (context, child) => Theme(
          data: ThemeData.light().copyWith(
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child: child!),
    );

    if (picked != null) {
      setState(() => widget.value = picked);
      widget.handle(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        onTap: () => widget.mode == 0 ? null : refreshTanggal(),
        controller: TextEditingController(
            text: DateFormat('dd-MM-yyyy').format(widget.value)),
        readOnly: widget.mode == 0 ? true : false,
        style: GlobalFont.mediumbigfontR,
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(5)),
            contentPadding: const EdgeInsets.only(left: 15, top: 5),
            label: Text(widget.label, style: GlobalFont.mediumbigfontMBold),
            prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.date_range_rounded)),
            prefixIconConstraints: const BoxConstraints(maxWidth: 50),
            prefixIconColor: Colors.black),
      ),
    );
  }
}
