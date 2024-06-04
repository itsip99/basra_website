import 'package:flutter/material.dart';
import 'package:stsj/core/service/Helper.dart';

class CustomDatetimePicker2 extends StatefulWidget {
  const CustomDatetimePicker2(this.tgl, this.handle,
      {this.readOnly = false, super.key});
  final String tgl;
  final Function handle;
  final bool readOnly;

  @override
  State<CustomDatetimePicker2> createState() => _CustomDatetimePicker2State();
}

class _CustomDatetimePicker2State extends State<CustomDatetimePicker2> {
  String tgl = '';

  @override
  void initState() {
    tgl = widget.tgl;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(tgl),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != DateTime.parse(tgl)) {
      setState(() {
        tgl = picked.toString().substring(0, 10);
      });
      widget.handle(tgl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white), // Warna latar belakang
        elevation:
            MaterialStateProperty.all<double>(0), // Menghilangkan bayangan
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Atur sudut border
            side: BorderSide(
                color: Colors.grey,
                width: 1.0), // Atur warna dan ketebalan border
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 20)), // Padding
      ),
      onPressed: () => widget.readOnly ? null : _selectDate(context),
      child: Row(
        children: [
          const Icon(
            Icons.date_range_rounded,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(
            Format.tanggalFormat(tgl),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
