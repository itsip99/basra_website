// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/core/views/components/authorization_menu.dart';
import 'package:stsj/core/views/components/dashboard_menu.dart';
import 'package:stsj/core/views/components/report_menu.dart';
import 'package:stsj/core/views/components/activity_menu.dart';
import 'package:stsj/core/views/components/tools_menu.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/router/router_const.dart';
import 'package:stsj/global/widget/app_bar.dart';

class MenuPages extends StatefulWidget {
  const MenuPages({super.key});

  @override
  State<MenuPages> createState() => _MenuPagesState();
}

class _MenuPagesState extends State<MenuPages>
    with AutomaticKeepAliveClientMixin<MenuPages> {
  String staticMenu = '';

  void setStaticMenu(
    MapState state,
    String value,
  ) {
    staticMenu = value;
    print('Static Menu: $staticMenu');
    state.staticMenuNotifier.value = value;
  }

  @override
  Widget build(BuildContext context) {
    final menuPagesState = Provider.of<MapState>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          MediaQuery.of(context).size.height * 0.065,
        ),
        child: CustomAppBar(goBack: RoutesConstant.homepage),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.075,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // ===================== Sales Menu ======================
                  InkWell(
                    onTap: () => setStaticMenu(menuPagesState, 'dashboard'),
                    hoverColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red[800]!,
                            Colors.red[600]!,
                            Colors.red[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Dashboard',
                        style: GlobalFont.mediumgiantfontRBoldWhite,
                      ),
                    ),
                  ),

                  // ====================== Devider ========================
                  SizedBox(width: 20.0),

                  // =================== Activity Menu =====================
                  InkWell(
                    onTap: () => setStaticMenu(menuPagesState, 'activity'),
                    hoverColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.amber[700]!,
                            Colors.amber[600]!,
                            Colors.amber[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Sales Activity',
                        style: GlobalFont.mediumgiantfontRBoldWhite,
                      ),
                    ),
                  ),

                  // ======================== Devider ==========================
                  SizedBox(width: 20.0),

                  // =================== Authorization Menu ====================
                  InkWell(
                    onTap: () => setStaticMenu(menuPagesState, 'authorization'),
                    hoverColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.green[800]!,
                            Colors.green[600]!,
                            Colors.green[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Authorization',
                        style: GlobalFont.mediumgiantfontRBoldWhite,
                      ),
                    ),
                  ),

                  // ======================== Devider ==========================
                  SizedBox(width: 20.0),

                  // ====================== Report Menu ========================
                  InkWell(
                    onTap: () => setStaticMenu(menuPagesState, 'report'),
                    hoverColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue[800]!,
                            Colors.blue[600]!,
                            Colors.blue[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Report',
                        style: GlobalFont.mediumgiantfontRBoldWhite,
                      ),
                    ),
                  ),

                  // ======================== Devider ==========================
                  SizedBox(width: 20.0),

                  // ====================== Tools Menu =========================
                  InkWell(
                    onTap: () => setStaticMenu(menuPagesState, 'tools'),
                    hoverColor: Colors.transparent,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple[800]!,
                            Colors.purple[600]!,
                            Colors.purple[400]!,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Text(
                        'Tools',
                        style: GlobalFont.mediumgiantfontRBoldWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // =========================== Devider =============================
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            // ========================= Menu Result ===========================
            Container(
              height: MediaQuery.of(context).size.height * 0.66,
              decoration: ShapeDecoration(
                color: Colors.grey[350],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.035,
                vertical: MediaQuery.of(context).size.height * 0.06,
              ),
              child: ValueListenableBuilder(
                valueListenable: menuPagesState.getStaticMenuNotifier,
                builder: (context, value, _) {
                  if (value == 'dashboard' || value == '') {
                    return DashboardMenuComponent();
                  } else if (value == 'activity') {
                    return ActivityMenuComponent();
                  } else if (value == 'authorization') {
                    return AuthorizationMenuComponent();
                  } else if (value == 'report') {
                    return ReportMenuComponent();
                  } else if (value == 'tools') {
                    return ToolsMenuComponent();
                  }
                  return Text('Please choose your type.');
                },
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
