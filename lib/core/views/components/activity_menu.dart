import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:stsj/core/cleanArc/dashboard_service/pages/dialog_filter.dart';
import 'package:stsj/router/router_const.dart';

class ActivityMenuComponent extends HookWidget {
  const ActivityMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() => null);

    return Wrap(
      spacing: 50,
      children: [
        Column(
          children: [
            // ~:NEW:~
            // Map
            _buildMenuIcon(
              context,
              'assets/images/maps.png',
              'Peta',
              RoutesConstant.map,
            ),
            const Text('Peta'),
            // ~:NEW:~
          ],
        ),

        // Aktivitas Sales
        Column(
          children: [
            // ~:NEW:~
            // Map
            _buildMenuIcon(
              context,
              'assets/images/destination.png',
              'Aktivitas Sales',
              RoutesConstant.salesActivities,
            ),
            const Text('Aktivitas Sales'),
            // ~:NEW:~
          ],
        ),

        // Aktivitas Manager
        Column(
          children: [
            // ~:NEW:~
            // Map
            _buildMenuIcon(
              context,
              'assets/images/activity.png',
              'Aktivitas Manager',
              RoutesConstant.managerActivities,
            ),
            const Text('Aktivitas Manager'),
            // ~:NEW:~
          ],
        ),

        // Aktivitas Manager
        Column(
          children: [
            // ~:NEW:~
            // Map
            _buildMenuIcon(
              context,
              'assets/images/weekly.png',
              'Aktivitas Mingguan',
              RoutesConstant.weeklyActivitiesReport,
            ),
            const Text('Aktivitas Mingguan'),
            // ~:NEW:~
          ],
        ),
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
