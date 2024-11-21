import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/cleanArc/dashboard_service/pages/dialog_filter.dart';
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
                        ),
                        const Text('Report')
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
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
