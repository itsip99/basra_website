import 'package:flutter/material.dart';
import 'package:stsj/core/views/Services/MotorcyleHistory/component/WMotorHistoryInput.dart';
import 'package:stsj/global/font.dart';

class WInputSearch extends StatefulWidget {
  const WInputSearch(this.controller, this.handle, {super.key});
  final TextEditingController controller;
  final Function handle;

  @override
  State<WInputSearch> createState() => _MyPageState();
}

class _MyPageState extends State<WInputSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
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
            contentPadding: const EdgeInsets.only(left: 15, top: 0, right: 10),
            prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
            hintText: 'Masukkan Nama Motor Kemudian Tekan Enter'),
        inputFormatters: [UpperCaseText()],
        controller: widget.controller,
        style: GlobalFont.smallfontR,
        onSubmitted: (value) => widget.handle(value),
      ),
    );
  }
}
