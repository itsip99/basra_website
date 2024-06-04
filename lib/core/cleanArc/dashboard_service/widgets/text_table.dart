import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/style.dart';

class TextTable extends StatelessWidget {
  const TextTable(this.judul, this.align, this.jenis, {super.key});
  final String judul;
  final Alignment align;
  final int jenis;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: jenis == 0 ? SystemMouseCursors.click : SystemMouseCursors.text,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Align(
          alignment: align,
          child: Text(
            judul,
            textAlign: jenis == 0 ? TextAlign.center : TextAlign.left,
            style: jenis == 0
                ? text11SB
                : text9Med.copyWith(overflow: TextOverflow.ellipsis),
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
