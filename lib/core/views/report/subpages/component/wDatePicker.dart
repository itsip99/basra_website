import 'package:flutter/material.dart';
import 'package:stsj/core/service/Helper.dart';

class CustomDatetimePicker extends StatefulWidget {
  const CustomDatetimePicker(this.tgl, this.handle,
      {this.readOnly = false, super.key});
  final String tgl;
  final Function handle;
  final bool readOnly;

  @override
  State<CustomDatetimePicker> createState() => _CustomDatetimePickerState();
}

class _CustomDatetimePickerState extends State<CustomDatetimePicker> {
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
    return InkWell(
      onTap: () => widget.readOnly ? null : _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: widget.readOnly ? Colors.grey : Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
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
      ),
    );
  }
}
