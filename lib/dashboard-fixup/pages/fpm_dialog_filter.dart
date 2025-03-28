import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/datepicker_custom.dart';
import 'package:stsj/core/cleanArc/dashboard_service/widgets/dropdown_custom.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/dashboard-fixup/utilities/utils.dart';
import 'package:stsj/router/router_const.dart';

class FPMDialogFilter extends StatefulWidget {
  const FPMDialogFilter({super.key});

  @override
  State<FPMDialogFilter> createState() => _FPMDialogFilterState();
}

class _FPMDialogFilterState extends State<FPMDialogFilter> {
  late String dashboard, bengkel, tgl;
  String access = '';

  void setDashboard(String value) => setState(() => dashboard = value);
  void setBengkel(String value) => setState(() => bengkel = value);
  void setTgl1(String value) => tgl = value;

  @override
  void initState() {
    super.initState();

    setReset();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setReset() {
    dashboard = dashboardList[0]['id']!;
    bengkel = bengkelList[0]['id']!;
    tgl = DateTime.now().toString().substring(0, 10);
  }

  // Ganti nama 'Yudi' jadi username sesuai login configuration
  void find(
    BuildContext context,
    MenuState state,
  ) async {
    Navigator.pop(context);

    state.setWorkshopName(bengkel);
    state.setFpmDateFilter(tgl);
    if (dashboard == '1') {
      // ~:New:~
      context.goNamed(RoutesConstant.fpm1stDashboard);
      // ~:New:~
    } else if (dashboard == '2') {
      // ~:New:~
      context.goNamed(RoutesConstant.fpm2ndDashboard);
      // ~:New:~
    } else if (dashboard == '3') {
      // ~:New:~
      context.goNamed(RoutesConstant.fpm3rdDashboard);
      // ~:New:~
    } else if (dashboard == '4') {
      // ~:New:~
      context.goNamed(RoutesConstant.fpm4thDashboard);
      // ~:New:~
    } else {
      // ~:New:~
      context.goNamed(RoutesConstant.fpm5thDashboard);
      // ~:New:~
    }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (BuildContext context) {}));
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MenuState>(context);

    return Theme(
      data: ThemeData(),
      child: AlertDialog(
        actionsPadding:
            const EdgeInsets.only(bottom: 20, top: 20, left: 20, right: 20),
        contentPadding:
            const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 5),
        title: const Text('FILTER',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actionsAlignment: MainAxisAlignment.center,
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dashboard :',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              DropdownCustom(
                state.getFilteredDashboardList,
                dashboard,
                'Pilih Dashboard',
                setDashboard,
              ),
              const SizedBox(height: 10),
              const Text(
                'Bengkel :',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              DropdownCustom(bengkelList, bengkel, 'Pilih Bengkel', setBengkel),
              const SizedBox(height: 10),
              const Text(
                'Tanggal :',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              DatepickerCustom(tgl, setTgl1),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => find(context, state),
            style: ButtonStyle(
              padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
              backgroundColor: const WidgetStatePropertyAll(Colors.indigo),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            child: const Text(
              ' CARI ',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
