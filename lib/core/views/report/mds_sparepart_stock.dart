import 'package:flutter/material.dart';
import 'package:stsj/global/widget/app_bar.dart';
import 'package:stsj/router/router_const.dart';

class MdsSparepartStockPage extends StatefulWidget {
  const MdsSparepartStockPage({super.key});

  @override
  State<MdsSparepartStockPage> createState() => _MdsSparepartStockPageState();
}

class _MdsSparepartStockPageState extends State<MdsSparepartStockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.065),
        child: CustomAppBar(
          goBack: RoutesConstant.menu,
        ),
      ),
    );
  }
}
