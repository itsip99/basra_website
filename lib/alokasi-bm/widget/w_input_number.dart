import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stsj/global/font.dart';

class WInputNumber extends StatefulWidget {
  const WInputNumber(this.label, this.controller, this.handle,
      {this.mode = 1, super.key});

  final String label;
  final int mode;
  final TextEditingController controller;
  final Function handle;

  @override
  State<WInputNumber> createState() => _MyPageState();
}

class _MyPageState extends State<WInputNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          border: InputBorder.none,
          label: Text(widget.label),
          labelStyle: GlobalFont.smallfontR,
          contentPadding: const EdgeInsets.only(left: 15, top: 0, right: 10),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9.]*'))
        ],
        controller: widget.controller,
        style: GlobalFont.smallfontR,
        textAlign: TextAlign.end,
        readOnly: widget.mode == 0 ? true : false,
        onChanged: (value) => widget.handle(value),
      ),
    );
  }
}
