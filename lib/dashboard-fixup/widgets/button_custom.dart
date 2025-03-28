import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(this.txt, this.handle, {this.disable = false, super.key});
  final String txt;
  final Function handle;
  final bool disable;
  //ujung sedikit curve
  //ukuran menyesuaikan isi
  //disable

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: RawMaterialButton(
        onPressed: () => handle(),
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        fillColor: Colors.orange,
        child: Text(
          txt,
          style: const TextStyle(fontSize: 13, color: Colors.white, letterSpacing: 1),
        ),
      ),
    );
  }
}
