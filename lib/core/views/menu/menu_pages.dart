import 'package:flutter/material.dart';
import 'package:stsj/router/router_const.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/core/views/components/menu.dart';

class MenuPages extends StatefulWidget {
  const MenuPages({super.key});

  @override
  State<MenuPages> createState() => _MenuPagesState();
}

class _MenuPagesState extends State<MenuPages>
    with AutomaticKeepAliveClientMixin<MenuPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(goBack: RoutesConstant.homepage),
      ),
      body: Container(
        color: Color.fromARGB(255, 231, 230, 230),
        child: Center(
          child: Container(
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 244, 243, 243),
              child: MenuComponent()),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
