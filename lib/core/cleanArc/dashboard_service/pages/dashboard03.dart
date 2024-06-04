import 'package:flutter/material.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/global.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/style.dart';
import 'package:stsj/core/cleanArc/dashboard_service/models/dashboard.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/header_table.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/text_table.dart';

class Dashboard03 extends StatefulWidget {
  const Dashboard03(this.listDashboard, {super.key});
  final List<Dashboard> listDashboard;

  @override
  State<Dashboard03> createState() => _Dashboard03State();
}

class _Dashboard03State extends State<Dashboard03>
    with AutomaticKeepAliveClientMixin<Dashboard03> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Dashboard> showDashboard = [];
  String flagReversed = '';
  List<String> filterArea = [];

  void sortAREA() {
    setState(() {
      if (flagReversed == eArea) {
        showDashboard.sort(
            (a, b) => b.area.toUpperCase().compareTo(a.area.toUpperCase()));
        flagReversed = '!$eArea';
      } else {
        showDashboard.sort(
            (a, b) => a.area.toUpperCase().compareTo(b.area.toUpperCase()));
        flagReversed = eArea;
      }
    });
  }

  void sortKSG1() {
    setState(() {
      if (flagReversed == eKsg1) {
        showDashboard.sort((a, b) => b.ksg1.compareTo(a.ksg1));
        flagReversed = '!$eKsg1';
      } else {
        showDashboard.sort((a, b) => a.ksg1.compareTo(b.ksg1));
        flagReversed = eKsg1;
      }
    });
  }

  void sortKSG2() {
    setState(() {
      if (flagReversed == eKsg2) {
        showDashboard.sort((a, b) => b.ksg2.compareTo(a.ksg2));
        flagReversed = '!$eKsg2';
      } else {
        showDashboard.sort((a, b) => a.ksg2.compareTo(b.ksg2));
        flagReversed = eKsg2;
      }
    });
  }

  void sortKSG3() {
    setState(() {
      if (flagReversed == eKsg3) {
        showDashboard.sort((a, b) => b.ksg3.compareTo(a.ksg3));
        flagReversed = '!$eKsg3';
      } else {
        showDashboard.sort((a, b) => a.ksg3.compareTo(b.ksg3));
        flagReversed = eKsg3;
      }
    });
  }

  void sortKSG4() {
    setState(() {
      if (flagReversed == eKsg4) {
        showDashboard.sort((a, b) => b.ksg4.compareTo(a.ksg4));
        flagReversed = '!$eKsg4';
      } else {
        showDashboard.sort((a, b) => a.ksg4.compareTo(b.ksg4));
        flagReversed = eKsg4;
      }
    });
  }

  void sortKSG() {
    setState(() {
      if (flagReversed == eKsg) {
        showDashboard.sort((a, b) => b.ksg.compareTo(a.ksg));
        flagReversed = '!$eKsg';
      } else {
        showDashboard.sort((a, b) => a.ksg.compareTo(b.ksg));
        flagReversed = eKsg;
      }
    });
  }

  void sortKSB() {
    setState(() {
      if (flagReversed == eKsb) {
        showDashboard.sort((a, b) => b.ksb.compareTo(a.ksb));
        flagReversed = '!$eKsb';
      } else {
        showDashboard.sort((a, b) => a.ksb.compareTo(b.ksb));
        flagReversed = eKsb;
      }
    });
  }

  void sortUNITENTRY() {
    setState(() {
      if (flagReversed == eUnitEntry) {
        showDashboard.sort((a, b) => b.unitEntry.compareTo(a.unitEntry));
        flagReversed = '!$eUnitEntry';
      } else {
        showDashboard.sort((a, b) => a.unitEntry.compareTo(b.unitEntry));
        flagReversed = eUnitEntry;
      }
    });
  }

  void sortJASATOTAL() {
    setState(() {
      if (flagReversed == eJasaTotal) {
        showDashboard.sort((a, b) => b.labourCost.compareTo(a.labourCost));
        flagReversed = '!$eJasaTotal';
      } else {
        showDashboard.sort((a, b) => a.labourCost.compareTo(b.labourCost));
        flagReversed = eJasaTotal;
      }
    });
  }

  void sortWSPART() {
    setState(() {
      if (flagReversed == eWsPart) {
        showDashboard.sort((a, b) => b.workshopPart.compareTo(a.workshopPart));
        flagReversed = '!$eWsPart';
      } else {
        showDashboard.sort((a, b) => a.workshopPart.compareTo(b.workshopPart));
        flagReversed = eWsPart;
      }
    });
  }

  void sortWSOLI() {
    setState(() {
      if (flagReversed == eWsOli) {
        showDashboard.sort((a, b) => b.workshopOli.compareTo(a.workshopOli));
        flagReversed = '!$eWsOli';
      } else {
        showDashboard.sort((a, b) => a.workshopOli.compareTo(b.workshopOli));
        flagReversed = eWsOli;
      }
    });
  }

  void sortRETAILPART() {
    setState(() {
      if (flagReversed == eRetailPart) {
        showDashboard.sort((a, b) => b.retailPart.compareTo(a.retailPart));
        flagReversed = '!$eRetailPart';
      } else {
        showDashboard.sort((a, b) => a.retailPart.compareTo(b.retailPart));
        flagReversed = eRetailPart;
      }
    });
  }

  void sortRETAILOLI() {
    setState(() {
      if (flagReversed == eRetailOli) {
        showDashboard.sort((a, b) => b.retailOli.compareTo(a.retailOli));
        flagReversed = '!$eRetailOli';
      } else {
        showDashboard.sort((a, b) => a.retailOli.compareTo(b.retailOli));
        flagReversed = eRetailOli;
      }
    });
  }

  void sortOMZET() {
    setState(() {
      if (flagReversed == eOmzet) {
        showDashboard.sort((a, b) => b.omzet.compareTo(a.omzet));
        flagReversed = '!$eOmzet';
      } else {
        showDashboard.sort((a, b) => a.omzet.compareTo(b.omzet));
        flagReversed = eOmzet;
      }
    });
  }

  void sortSPU() {
    setState(() {
      if (flagReversed == eSpu) {
        showDashboard.sort((a, b) => b.spu.compareTo(a.spu));
        flagReversed = '!$eSpu';
      } else {
        showDashboard.sort((a, b) => a.spu.compareTo(b.spu));
        flagReversed = eSpu;
      }
    });
  }

  void sortSPUJASA() {
    setState(() {
      if (flagReversed == eSpuJasa) {
        showDashboard.sort((a, b) => b.labourSpu.compareTo(a.labourSpu));
        flagReversed = '!$eSpuJasa';
      } else {
        showDashboard.sort((a, b) => a.labourSpu.compareTo(b.labourSpu));
        flagReversed = eSpuJasa;
      }
    });
  }

  void sortSPUPART() {
    setState(() {
      if (flagReversed == eSpuPart) {
        showDashboard
            .sort((a, b) => b.workshopPartSpu.compareTo(a.workshopPartSpu));
        flagReversed = '!$eSpuPart';
      } else {
        showDashboard
            .sort((a, b) => a.workshopPartSpu.compareTo(b.workshopPartSpu));
        flagReversed = eSpuPart;
      }
    });
  }

  void sortSPUOLI() {
    setState(() {
      if (flagReversed == eSpuOli) {
        showDashboard
            .sort((a, b) => b.workshopOliSpu.compareTo(a.workshopOliSpu));
        flagReversed = '!$eSpuOli';
      } else {
        showDashboard
            .sort((a, b) => a.workshopOliSpu.compareTo(b.workshopOliSpu));
        flagReversed = eSpuOli;
      }
    });
  }

  void sortSPURETAIL() {
    setState(() {
      if (flagReversed == eSpuRetail) {
        showDashboard.sort((a, b) => b.workshopSpu.compareTo(a.workshopSpu));
        flagReversed = '!$eSpuRetail';
      } else {
        showDashboard.sort((a, b) => a.workshopSpu.compareTo(b.workshopSpu));
        flagReversed = eSpuRetail;
      }
    });
  }

  void sortRUT() {
    setState(() {
      if (flagReversed == eRut) {
        showDashboard.sort((a, b) => b.rtu.compareTo(a.rtu));
        flagReversed = '!$eRut';
      } else {
        showDashboard.sort((a, b) => a.rtu.compareTo(b.rtu));
        flagReversed = eRut;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    showDashboard = widget.listDashboard;

    filterArea = showDashboard.map((e) => e.area).toList();
    filterArea = filterArea.toSet().toList();
    filterArea.sort((a, b) => a.compareTo(b));
  }

  Widget filterDrawer() {
    return Drawer(
      child: ListView(
        children: [
          ExpansionTile(
            title: Text('AREA', style: text12SB),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 5),
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                childAspectRatio: 3.5,
                children: [
                  ...filterArea.map(
                    (item) => CheckboxListTile(
                      value: false,
                      contentPadding: const EdgeInsets.only(left: 5, right: 0),
                      onChanged: (value) {},
                      title: Text(item, style: text10Reg),
                      visualDensity: VisualDensity.compact,
                      dense: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: ThemeData(fontFamily: 'Poppins'),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: filterDrawer(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 5),
                Text('BY AREA', style: text20SB),
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: Text('Export', style: text12Med)),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
                  icon: const Icon(Icons.filter_alt),
                  label: Text('Filter', style: text12Med),
                ),
                const SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 5),
            SelectionArea(
              child: Table(
                border: TableBorder.all(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: FlexColumnWidth(1.5),
                  1: FlexColumnWidth(0.75),
                  2: FlexColumnWidth(0.75),
                  3: FlexColumnWidth(0.75),
                  4: FlexColumnWidth(0.75),
                  5: FlexColumnWidth(0.75),
                  6: FlexColumnWidth(0.75),
                  7: FlexColumnWidth(0.85),
                  8: FlexColumnWidth(1.1),
                  9: FlexColumnWidth(1.1),
                  10: FlexColumnWidth(1.1),
                  11: FlexColumnWidth(1.1),
                  12: FlexColumnWidth(1.1),
                  13: FlexColumnWidth(1.1),
                  14: FlexColumnWidth(0.8),
                  15: FlexColumnWidth(0.8),
                  16: FlexColumnWidth(0.8),
                  17: FlexColumnWidth(0.8),
                  18: FlexColumnWidth(0.8),
                  19: FlexColumnWidth(0.75),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: blueUrainan,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                        bottomLeft:
                            Radius.circular(showDashboard.isEmpty ? 10.0 : 0.0),
                        bottomRight:
                            Radius.circular(showDashboard.isEmpty ? 10.0 : 0.0),
                      ),
                    ),
                    children: [
                      HeaderTable(
                          eArea, Alignment.center, flagReversed, sortAREA),
                      HeaderTable(
                          eKsg1, Alignment.center, flagReversed, sortKSG1),
                      HeaderTable(
                          eKsg2, Alignment.center, flagReversed, sortKSG2),
                      HeaderTable(
                          eKsg3, Alignment.center, flagReversed, sortKSG3),
                      HeaderTable(
                          eKsg4, Alignment.center, flagReversed, sortKSG4),
                      HeaderTable(
                          eKsg, Alignment.center, flagReversed, sortKSG),
                      HeaderTable(
                          eKsb, Alignment.center, flagReversed, sortKSB),
                      HeaderTable(eUnitEntry, Alignment.center, flagReversed,
                          sortUNITENTRY),
                      HeaderTable(eJasaTotal, Alignment.center, flagReversed,
                          sortJASATOTAL),
                      HeaderTable(
                          eWsPart, Alignment.center, flagReversed, sortWSPART),
                      HeaderTable(
                          eWsOli, Alignment.center, flagReversed, sortWSOLI),
                      HeaderTable(eRetailPart, Alignment.center, flagReversed,
                          sortRETAILPART),
                      HeaderTable(eRetailOli, Alignment.center, flagReversed,
                          sortRETAILOLI),
                      HeaderTable(
                          eOmzet, Alignment.center, flagReversed, sortOMZET),
                      HeaderTable(
                          eSpu, Alignment.center, flagReversed, sortSPU),
                      HeaderTable(eSpuJasa, Alignment.center, flagReversed,
                          sortSPUJASA),
                      HeaderTable(eSpuPart, Alignment.center, flagReversed,
                          sortSPUPART),
                      HeaderTable(
                          eSpuOli, Alignment.center, flagReversed, sortSPUOLI),
                      HeaderTable(eSpuRetail, Alignment.center, flagReversed,
                          sortSPURETAIL),
                      HeaderTable(
                          eRut, Alignment.center, flagReversed, sortRUT),
                    ],
                  ),
                  ...showDashboard.map((item) {
                    int idx = showDashboard.indexOf(item);
                    return TableRow(
                      decoration: (idx + 1) % 2 == 0
                          ? BoxDecoration(
                              color: lighPurple100.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    (idx + 1) == showDashboard.length
                                        ? 10.0
                                        : 0.0),
                                bottomRight: Radius.circular(
                                    (idx + 1) == showDashboard.length
                                        ? 10.0
                                        : 0.0),
                              ),
                            )
                          : const BoxDecoration(),
                      children: [
                        Tooltip(
                          message: 'Bengkel : ${item.cName}',
                          textStyle: text11Reg.copyWith(color: white),
                          waitDuration: const Duration(milliseconds: 500),
                          excludeFromSemantics: true,
                          child: TextTable(item.area, Alignment.centerLeft, 1),
                        ),
                        TextTable(Format.thousandFormat(item.ksg1.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.ksg2.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.ksg3.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.ksg4.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.ksg.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.ksb.toString()),
                            Alignment.centerRight, 1),
                        TextTable(
                            Format.thousandFormat(item.unitEntry.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.labourCost.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.workshopPart.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.workshopOli.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.retailPart.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.retailOli.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(Format.thousandFormat(item.omzet.toString()),
                            Alignment.centerRight, 1),
                        TextTable(Format.thousandFormat(item.spu.toString()),
                            Alignment.centerRight, 1),
                        TextTable(
                            Format.thousandFormat(item.labourSpu.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(
                                item.workshopPartSpu.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(
                                item.workshopOliSpu.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(
                            Format.thousandFormat(item.workshopSpu.toString()),
                            Alignment.centerRight,
                            1),
                        TextTable(Format.thousandFormat(item.rtu.toString()),
                            Alignment.centerRight, 1),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
