import 'package:flutter/material.dart';
import 'package:stsj/dashboard-fixup/utilities/format.dart';

class VSHorizontal extends StatefulWidget {
  const VSHorizontal(this.n1, this.n2, this.lylm, {super.key});
  final int n1;
  final int n2;
  final String lylm;

  @override
  State<VSHorizontal> createState() => _VSHorizontalState();
}

class _VSHorizontalState extends State<VSHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.n1 > widget.n2
                ? Icons.arrow_upward_rounded
                : Icons.arrow_downward_rounded,
            color: widget.n1 > widget.n2 ? Colors.indigo : Colors.orange,
            size: 55,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Format.rupiahFormat((widget.n1 - widget.n2).abs().toString()),
                style: const TextStyle(fontSize: 25),
                textHeightBehavior:
                    const TextHeightBehavior(applyHeightToLastDescent: false),
              ),
              Text(widget.lylm == 'LY' ? 'VS Last Year' : 'VS Last Month',
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          )
        ],
      ),
    );
  }
}
