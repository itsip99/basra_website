import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/style.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable(this.judul, this.align, this.flag, this.handle,
      {super.key});
  final String judul;
  final Alignment align;
  final String flag;
  final Function handle;

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: InkWell(
        onTap: () => handle(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            flag == judul
                ? const Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 2.5,
                    child: Icon(Icons.arrow_drop_down, size: 18),
                  )
                : flag == '!$judul'
                    ? const Align(
                        alignment: Alignment.bottomRight,
                        heightFactor: 2.5,
                        child: Icon(Icons.arrow_drop_up, size: 18),
                      )
                    : const SizedBox(),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Align(
                  alignment: align,
                  child: Text(
                    judul,
                    textAlign: TextAlign.center,
                    style: text11SB,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
