import 'package:flutter/material.dart';
import 'package:stsj/dashboard-fixup/utilities/format.dart';

class TopWidget extends StatefulWidget {
  const TopWidget(this.index, this.bs, this.n, {super.key});
  final int index;
  final String bs;
  final int n;

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.index}.',
          style: TextStyle(
            fontSize: 30,
            color: widget.index == 1
                ? Colors.indigo[700]
                : widget.index == 2
                    ? Colors.indigo[600]
                    : widget.index == 3
                        ? Colors.indigo[500]
                        : widget.index == 4
                            ? Colors.indigo[400]
                            : Colors.indigo[300],
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.bs, style: const TextStyle(fontSize: 14)),
            Text(Format.rupiahFormat(widget.n.toString()),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }
}
