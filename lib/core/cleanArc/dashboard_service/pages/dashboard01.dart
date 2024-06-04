import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/format.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/global.dart';
import 'package:stsj/core/cleanArc/dashboard_service/helpers/style.dart';
import 'package:stsj/core/cleanArc/dashboard_service/models/dashboard.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/expansion_filter.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/header_table.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/text_table.dart';

class Dashboard01 extends StatefulWidget {
  const Dashboard01(this.listDashboard, {super.key});
  final List<Dashboard> listDashboard;

  @override
  State<Dashboard01> createState() => _Dashboard01State();
}

class _Dashboard01State extends State<Dashboard01>
    with AutomaticKeepAliveClientMixin<Dashboard01> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  String flagReversed = '';
  List<Dashboard> showDashboard = [];
  List<String> filterAsd = [];
  List<String> filterArea = [];
  List<String> filterGroup = [];
  List<String> filterKota = [];
  List<String> tempAsd = [];
  List<String> tempArea = [];
  List<String> tempGroup = [];
  List<String> tempKota = [];

  void sortASD() {
    setState(() {
      if (flagReversed == eAsd) {
        showDashboard
            .sort((a, b) => b.asd.toUpperCase().compareTo(a.asd.toUpperCase()));
        flagReversed = '!$eAsd';
      } else {
        showDashboard
            .sort((a, b) => a.asd.toUpperCase().compareTo(b.asd.toUpperCase()));
        flagReversed = eAsd;
      }
    });
  }

  void sortKODE() {
    setState(() => loading = true);

    if (flagReversed == eKode) {
      showDashboard.sort(
          (a, b) => b.dpackId.toUpperCase().compareTo(a.dpackId.toUpperCase()));
      flagReversed = '!$eKode';
    } else {
      showDashboard.sort(
          (a, b) => a.dpackId.toUpperCase().compareTo(b.dpackId.toUpperCase()));
      flagReversed = eKode;
    }

    setState(() => loading = false);
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

    filterAsd = showDashboard.map((e) => e.asd).toList();
    filterAsd = filterAsd.toSet().toList();
    filterAsd.sort((a, b) => a.compareTo(b));

    filterArea = showDashboard.map((e) => e.area).toList();
    filterArea = filterArea.toSet().toList();
    filterArea.sort((a, b) => a.compareTo(b));

    filterGroup = showDashboard.map((e) => e.groupDealer).toList();
    filterGroup = filterGroup.toSet().toList();
    filterGroup.sort((a, b) => a.compareTo(b));

    filterKota = showDashboard.map((e) => e.cDistrict).toList();
    filterKota = filterKota.toSet().toList();
    filterKota.sort((a, b) => a.compareTo(b));

    print(filterAsd);
    print(filterArea);
    print(filterGroup);
    print(filterKota);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget filterDrawer() {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: 10),
              Expanded(
                  child: ElevatedButton(
                      onPressed: resetFilter,
                      child: Text('Reset', style: text12Med))),
              const SizedBox(width: 20),
              Expanded(
                  child: ElevatedButton(
                      onPressed: applyFilter,
                      child: Text('Apply', style: text12Med))),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: [
                ExpansionFilter('ASD', filterAsd, tempAsd),
                ExpansionFilter('GROUP', filterGroup, tempGroup),
                ExpansionFilter('AREA', filterArea, tempArea),
                ExpansionFilter('KAB/KOTA', filterKota, tempKota),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void applyFilter() {
    flagReversed = '';
    showDashboard = widget.listDashboard;

    if (tempAsd.isNotEmpty) {
      showDashboard = showDashboard
          .where((element) => tempAsd.contains(element.asd))
          .toList();
    }
    if (tempGroup.isNotEmpty) {
      showDashboard = showDashboard
          .where((element) => tempGroup.contains(element.groupDealer))
          .toList();
    }
    if (tempArea.isNotEmpty) {
      showDashboard = showDashboard
          .where((element) => tempArea.contains(element.area))
          .toList();
    }
    if (tempKota.isNotEmpty) {
      showDashboard = showDashboard
          .where((element) => tempKota.contains(element.cDistrict))
          .toList();
    }

    Navigator.pop(context);
    setState(() {});
  }

  void resetFilter() {
    flagReversed = '';
    tempAsd = [];
    tempGroup = [];
    tempArea = [];
    tempKota = [];
    showDashboard = widget.listDashboard;

    Navigator.pop(context);
    setState(() {});
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
                Text('BY DEALER', style: text20SB),
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
            loading
                ? SpinKitWave(color: blueOcean, size: 35)
                : SelectionArea(
                    child: Table(
                      border: TableBorder.all(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(1),
                        2: FlexColumnWidth(0.75),
                        3: FlexColumnWidth(0.75),
                        4: FlexColumnWidth(0.75),
                        5: FlexColumnWidth(0.75),
                        6: FlexColumnWidth(0.75),
                        7: FlexColumnWidth(0.75),
                        8: FlexColumnWidth(0.85),
                        9: FlexColumnWidth(1.05),
                        10: FlexColumnWidth(1.05),
                        11: FlexColumnWidth(1.05),
                        12: FlexColumnWidth(1),
                        13: FlexColumnWidth(1),
                        14: FlexColumnWidth(1.05),
                        15: FlexColumnWidth(0.9),
                        16: FlexColumnWidth(0.9),
                        17: FlexColumnWidth(0.9),
                        18: FlexColumnWidth(0.9),
                        19: FlexColumnWidth(0.9),
                        20: FlexColumnWidth(0.75),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: blueUrainan,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(10),
                              topRight: const Radius.circular(10),
                              bottomLeft: Radius.circular(
                                  showDashboard.isEmpty ? 10.0 : 0.0),
                              bottomRight: Radius.circular(
                                  showDashboard.isEmpty ? 10.0 : 0.0),
                            ),
                          ),
                          children: [
                            HeaderTable(
                                eAsd, Alignment.center, flagReversed, sortASD),
                            HeaderTable(eKode, Alignment.center, flagReversed,
                                sortKODE),
                            HeaderTable(eKsg1, Alignment.center, flagReversed,
                                sortKSG1),
                            HeaderTable(eKsg2, Alignment.center, flagReversed,
                                sortKSG2),
                            HeaderTable(eKsg3, Alignment.center, flagReversed,
                                sortKSG3),
                            HeaderTable(eKsg4, Alignment.center, flagReversed,
                                sortKSG4),
                            HeaderTable(
                                eKsg, Alignment.center, flagReversed, sortKSG),
                            HeaderTable(
                                eKsb, Alignment.center, flagReversed, sortKSB),
                            HeaderTable(eUnitEntry, Alignment.center,
                                flagReversed, sortUNITENTRY),
                            HeaderTable(eJasaTotal, Alignment.center,
                                flagReversed, sortJASATOTAL),
                            HeaderTable(eWsPart, Alignment.center, flagReversed,
                                sortWSPART),
                            HeaderTable(eWsOli, Alignment.center, flagReversed,
                                sortWSOLI),
                            HeaderTable(eRetailPart, Alignment.center,
                                flagReversed, sortRETAILPART),
                            HeaderTable(eRetailOli, Alignment.center,
                                flagReversed, sortRETAILOLI),
                            HeaderTable(eOmzet, Alignment.center, flagReversed,
                                sortOMZET),
                            HeaderTable(
                                eSpu, Alignment.center, flagReversed, sortSPU),
                            HeaderTable(eSpuJasa, Alignment.center,
                                flagReversed, sortSPUJASA),
                            HeaderTable(eSpuPart, Alignment.center,
                                flagReversed, sortSPUPART),
                            HeaderTable(eSpuOli, Alignment.center, flagReversed,
                                sortSPUOLI),
                            HeaderTable(eSpuRetail, Alignment.center,
                                flagReversed, sortSPURETAIL),
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
                              TextTable(item.asd, Alignment.centerLeft, 1),
                              Tooltip(
                                message:
                                    'Group : ${item.groupDealer}\nArea : ${item.area}\nKab/Kota : ${item.cDistrict}\nBengkel : ${item.cName}',
                                textStyle: text11Reg.copyWith(color: white),
                                waitDuration: const Duration(milliseconds: 500),
                                excludeFromSemantics: true,
                                child: TextTable(
                                    item.dpackId, Alignment.centerLeft, 1),
                              ),
                              TextTable(
                                  Format.thousandFormat(item.ksg1.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.ksg2.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.ksg3.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.ksg4.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.ksg.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.ksb.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.unitEntry.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.labourCost.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.workshopPart.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.workshopOli.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.retailPart.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.retailOli.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.omzet.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.spu.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(
                                      item.labourSpu.toString()),
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
                                  Format.thousandFormat(
                                      item.workshopSpu.toString()),
                                  Alignment.centerRight,
                                  1),
                              TextTable(
                                  Format.thousandFormat(item.rtu.toString()),
                                  Alignment.centerRight,
                                  1),
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
