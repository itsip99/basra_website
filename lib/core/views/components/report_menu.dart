import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/pages/service_dialog_filter.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/router/router_const.dart';

class ReportMenuComponent extends HookWidget {
  const ReportMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() => null);
    final state = Provider.of<MenuState>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Wrap(
          children: [
            // Report
            Builder(
              builder: (context) {
                if (state.getSubHeaderList.contains('300')) {
                  return Container(
                    margin: EdgeInsets.only(right: 50.0),
                    child: Column(
                      children: [
                        _buildMenuIcon(
                          context,
                          'assets/images/progress-report.png',
                          'Report',
                          RoutesConstant.report,
                          'report',
                        ),
                        const Text('Report'),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),

            // Absent Report
            Builder(
              builder: (context) {
                if (state.getSubHeaderList.contains('304')) {
                  return Container(
                    margin: EdgeInsets.only(right: 50.0),
                    child: Column(
                      children: [
                        _buildMenuIcon(
                          context,
                          'assets/images/img_dailytask.png',
                          'Report',
                          RoutesConstant.absentHistory,
                          'attendance',
                        ),
                        const Text('Riwayat Absensi'),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),

            // Browse Salesman
            Builder(
              builder: (context) {
                if (state.getSubHeaderList.contains('305')) {
                  return Container(
                    margin: EdgeInsets.only(right: 50.0),
                    child: Column(
                      children: [
                        _buildMenuIcon(
                          context,
                          'assets/images/salesman.png',
                          'Report',
                          RoutesConstant.browseSalesman,
                          'salesman list',
                        ),
                        const Text('Cari Salesman'),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),

            // Coming Soon
            // // Bikes History
            // Builder(
            //   builder: (context) {
            //     if (state.getSubHeaderList.contains('301')) {
            //       return Container(
            //         margin: EdgeInsets.only(right: 50.0),
            //         child: Column(
            //           children: [
            //             _buildMenuIcon(
            //               context,
            //               'assets/images/progress-report.png',
            //               'Report',
            //               RoutesConstant.bikesHistory,
            //             ),
            //             const Text('Bikes History'),
            //           ],
            //         ),
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            // ),
            //
            // // Service History
            // Builder(
            //   builder: (context) {
            //     if (state.getSubHeaderList.contains('302')) {
            //       return Container(
            //         margin: EdgeInsets.only(right: 50.0),
            //         child: Column(
            //           children: [
            //             _buildMenuIcon(
            //               context,
            //               'assets/images/progress-report.png',
            //               'Report',
            //               RoutesConstant.serviceHistory,
            //             ),
            //             const Text('Service History'),
            //           ],
            //         ),
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            // ),
            //
            // // MDS Sparepart Stock
            // Builder(
            //   builder: (context) {
            //     if (state.getSubHeaderList.contains('303')) {
            //       return Container(
            //         margin: EdgeInsets.only(right: 50.0),
            //         child: Column(
            //           children: [
            //             _buildMenuIcon(
            //               context,
            //               'assets/images/progress-report.png',
            //               'Report',
            //               RoutesConstant.mdsSparepartStock,
            //             ),
            //             const Text('MDS Sparepart Stock'),
            //           ],
            //         ),
            //       );
            //     } else {
            //       return const SizedBox();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(
    BuildContext context,
    String imagePath,
    String tooltip,
    String route,
    String menuName,
  ) {
    final isHovered = ValueNotifier<bool>(false);
    final tooltipNull = ValueNotifier<bool>(false);

    return MouseRegion(
      onEnter: (_) {
        isHovered.value = true;
      },
      onExit: (_) {
        isHovered.value = false;
      },
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, child) {
          return AnimatedContainer(
            width: 100.0,
            height: 100.0,
            duration: Duration(milliseconds: 100),
            padding: EdgeInsets.all(hovered ? 10.0 : 0.0),
            child: IconButton(
              onPressed: () async {
                final state = Provider.of<MenuState>(context, listen: false);
                tooltipNull.value = true;
                if (tooltip == 'Dashboard Service') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => ServiceDialogFilter(),
                  );
                } else if (tooltip == 'attendance') {
                  await state.resetAbsentHistory();
                } else if (tooltip == 'salesman list') {
                  await state.resetAbsentHistory();
                  state.setSearchTriggerNotifier(false);
                }

                if (context.mounted) {
                  context.goNamed(route);
                }
              },
              icon: Image.asset(imagePath),
            ),
          );
        },
      ),
    );
  }
}
