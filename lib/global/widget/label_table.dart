// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:stsj/global/font.dart';

class LabelTable extends StatelessWidget {
  const LabelTable(
      this.judul, this.align, this.color, this.isChild, this.isBigger,
      {this.isAlign = false, super.key});

  final String judul;
  final Alignment align;
  final MaterialColor color;
  final bool isChild;
  final bool isBigger;
  final bool isAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (isBigger)
          ? MediaQuery.of(context).size.width * 0.25
          : MediaQuery.of(context).size.width * 0.025,
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(10),
      color: color,
      child: Align(
        alignment: align,
        child: Column(
          children: [
            Text(
              judul,
              textAlign: isAlign == true ? TextAlign.center : TextAlign.left,
              style: GlobalFont.mediumfontR,
            ),
            isChild
                ? Row(
                    children: [
                      Text(
                        'Briefing Salesman',
                        textAlign:
                            isAlign == true ? TextAlign.center : TextAlign.left,
                        style: GlobalFont.mediumfontR,
                      ),
                      Text(
                        'Keliling dan Kunjungan Market',
                        textAlign:
                            isAlign == true ? TextAlign.center : TextAlign.left,
                        style: GlobalFont.mediumfontR,
                      ),
                      Text(
                        'Kunjungan dan Laporan Harian Salesman',
                        textAlign:
                            isAlign == true ? TextAlign.center : TextAlign.left,
                        style: GlobalFont.mediumfontR,
                      ),
                      Text(
                        'v',
                        textAlign:
                            isAlign == true ? TextAlign.center : TextAlign.left,
                        style: GlobalFont.mediumfontR,
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
