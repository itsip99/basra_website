import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/style.dart';

class ExpansionFilter extends StatefulWidget {
  const ExpansionFilter(this.title, this.listFilter, this.tempFilter,
      {super.key});
  final String title;
  final List<String> listFilter;
  final List<String> tempFilter;

  @override
  State<ExpansionFilter> createState() => _ExpansionFilterState();
}

class _ExpansionFilterState extends State<ExpansionFilter>
    with AutomaticKeepAliveClientMixin<ExpansionFilter> {
  bool controllerExpanded = true;

  void onChange(bool value, String item) {
    setState(() {
      if (value) {
        widget.tempFilter.add(item);
      } else {
        widget.tempFilter.remove(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ExpansionTile(
      title: Text(widget.title, style: text12SB),
      initiallyExpanded: controllerExpanded,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
      onExpansionChanged: (value) => controllerExpanded = value,
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          childAspectRatio: 3.5,
          children: [
            ...widget.listFilter.map(
              (item) => CheckboxListTile(
                value: widget.tempFilter.contains(item) ? true : false,
                contentPadding: const EdgeInsets.only(left: 5, right: 0),
                onChanged: (value) => onChange(value!, item),
                title: Text(item, style: text10Reg),
                visualDensity: VisualDensity.compact,
                dense: true,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
