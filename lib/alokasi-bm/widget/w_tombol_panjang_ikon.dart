import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

class WTombolPanjangIkon extends StatelessWidget {
  const WTombolPanjangIkon(
      this.label, this.ikon, this.warnaIkon, this.warnaTombol, this.handle,
      {super.key});

  final String label;
  final IconData ikon;
  final Color warnaIkon, warnaTombol;
  final Function handle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => handle(),
      label: Text(label, style: GlobalFont.mediumbigfontMWhite),
      icon: Icon(ikon, color: warnaIkon),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(warnaTombol),
      ),
    );
  }
}
