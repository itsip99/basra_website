import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WMotorHistoryIbput extends StatelessWidget {
  String inputan = '';
  String label = '';
  IconData icon = Icons.person;
  Function handle;
  bool disable = false;

  WMotorHistoryIbput(
      {required this.inputan,
      required this.label,
      required this.icon,
      required this.handle,
      this.disable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
      alignment: Alignment.centerLeft,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFc7e4ff).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        inputFormatters: [UpperCaseText()],
        controller: TextEditingController(text: inputan),
        readOnly: disable,
        decoration: InputDecoration(
          hintText: 'Masukkan ' + label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15),
          prefixIcon: Container(
            margin: const EdgeInsets.only(right: 7),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              color: Colors.blue[900],
            ),
            width: 50,
            child: Icon(icon, color: Colors.white),
          ),
        ),
        onChanged: (newValues) => handle(newValues),
      ),
    );
  }
}

class UpperCaseText extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
