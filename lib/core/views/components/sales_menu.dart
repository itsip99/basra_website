import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:stsj/core/cleanArc/dashboard_service/pages/dialog_filter.dart';
import 'package:stsj/router/router_const.dart';

class SalesMenuComponent extends HookWidget {
  const SalesMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() => null);

    return Wrap(
      spacing: 50,
      children: [
        Column(
          children: [
            _buildMenuIcon(
              context,
              'assets/images/sales.png',
              'Sales Dashboard',
              RoutesConstant.salesDashboard,
            ),
            const Text('Sales Dashboard'),
            _buildMenuIcon(
              context,
              'assets/images/progress-report.png',
              'Report',
              RoutesConstant.report,
            ),
            const Text('Report')
          ],
        ),

        Column(
          children: [
            // Otorisasi
            _buildMenuIcon(
              context,
              'assets/images/authorization.png',
              'Otorisasi',
              RoutesConstant.authorizationSPK,
            ),
            const Text('Otorisasi SPK'),
            // // ~:NEW:~
            // // Map
            // _buildMenuIcon(
            //   context,
            //   'assets/images/maps.png',
            //   'Peta',
            //   RoutesConstant.map,
            // ),
            // const Text('Peta'),
            // // ~:NEW:~
          ],
        ),

        // Otorisasi Diskon
        Column(
          children: [
            _buildMenuIcon(
              context,
              'assets/images/service.png',
              'Service',
              RoutesConstant.service,
            ),
            const Text('Service'),
            // // ~:NEW:~
            // // Map
            // _buildMenuIcon(
            //   context,
            //   'assets/images/destination.png',
            //   'Aktivitas',
            //   RoutesConstant.salesActivities,
            // ),
            // const Text('Aktivitas Sales'),
            // // ~:NEW:~
          ],
        ),

        // Otorisasi Leasing
        Column(
          children: [
            _buildMenuIcon(
              context,
              'assets/images/dashboard.png',
              'Dashboard Service',
              RoutesConstant.dashboardService,
            ),
            const Text('Dashboard Service'),
            // // ~:NEW:~
            // // Map
            // _buildMenuIcon(
            //   context,
            //   'assets/images/activity.png',
            //   'Aktivitas',
            //   RoutesConstant.managerActivities,
            // ),
            // const Text('Aktivitas Manager'),
            // // ~:NEW:~
          ],
        ),

        // Akun
        // Column(
        //   children: [
        //     _buildMenuIcon(
        //       context,
        //       'assets/images/profile.png',
        //       'Akun',
        //       RoutesConstant.account,
        //     ),
        //     const Text('Akun')
        //   ],
        // )

        // Tambahkan item lain di sini
      ],
    );
  }

  Widget _buildMenuIcon(
    BuildContext context,
    String imagePath,
    String tooltip,
    String route,
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
              onPressed: () {
                tooltipNull.value = true;
                if (tooltip == 'Dashboard Service') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogFilter(),
                  );
                } else {
                  context.goNamed(route);
                }

                // context.goNamed(route);
              },
              icon: Image.asset(imagePath),
            ),
          );
        },
      ),
    );
  }
}
