// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/controller/Login_controller.dart';
import 'package:stsj/core/models/AuthModel/Auth_Model.dart';
import 'package:stsj/core/providers/Provider.dart';
import 'package:stsj/global/font.dart';
import 'package:stsj/global/globalVar.dart';
import 'package:stsj/router/router_const.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    this.goBack,
    this.isRoutes = true,
    this.imageSize = 50,
    this.profileRadius = 20,
    this.returnButtonSize = 25,
  }) : super(key: key);

  final String? goBack;
  final bool isRoutes;
  final double imageSize;
  final double profileRadius;
  final double returnButtonSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // bool showText = screenWidth >= 360;

    // final loginModel = context.read<LoginModel>();

    final router = GoRouterState.of(context).name;
    final state = Provider.of<MenuState>(context);
    print('CustomAppbar Current route: ${GoRouterState.of(context).name}');

    if (widget.isRoutes) {
      return AppBar(
        centerTitle: true, // this is all you need
        backgroundColor: const Color(0xFF9EDDFF),
        leading:
            router != RoutesConstant.homepage && router != RoutesConstant.report
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: widget.returnButtonSize,
                    ), // Icon panah kembali
                    onPressed: () {
                      if (router == RoutesConstant.absentHistory) {
                        state.resetAbsentHistory();
                      }

                      context.goNamed(widget.goBack!);
                    },
                  )
                : null,
        title: Image.asset(
          'assets/images/stsj.png',
          width: widget.imageSize,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                GlobalVar.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'v1.0.13',
                style: GlobalFont.smallfontR,
              ),
            ],
          ),
          SizedBox(width: 10),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  ), // Profile Picture
                  radius: widget.profileRadius,
                ),
                Positioned(
                  right: 0,
                  child: PopupMenuButton<String>(
                    icon: Icon(null), // Menyembunyikan ikon

                    // Dropdown menu untuk logout
                    onSelected: (value) {
                      if (value == 'logout') {
                        // Panggil fungsi logout jika logout dipilih
                        return;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                        onTap: () async {
                          // ~:Reset User Auth:~
                          await Auth.resetAuth();

                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.clear();

                          context.go(RoutesConstant.login);

                          Fluttertoast.showToast(
                            msg: 'Logout berhasil!', // message
                            textColor: Colors.black,
                            toastLength: Toast.LENGTH_LONG, // length
                            gravity: ToastGravity.CENTER, // location
                            webPosition: 'center',
                            webBgColor:
                                'linear-gradient(to right, #00FF00, #00FF00)',
                            timeInSecForIosWeb: 2, // duration
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        centerTitle: true, // this is all you need
        backgroundColor: const Color(0xFF9EDDFF),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            size: widget.returnButtonSize,
          ),
        ),
        title: Image.asset(
          'assets/images/stsj.png',
          width: widget.imageSize,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                GlobalVar.username,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'v1.0.13',
                style: GlobalFont.smallfontR,
              ),
            ],
          ),
          SizedBox(width: 10),
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                  ), // Profile Picture
                  radius: widget.profileRadius,
                ),
                Positioned(
                  right: 0,
                  child: PopupMenuButton<String>(
                    icon: Icon(null), // Menyembunyikan ikon

                    // Dropdown menu untuk logout
                    onSelected: (value) {
                      if (value == 'logout') {
                        // Panggil fungsi logout jika logout dipilih
                        return;
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      // PopupMenuItem<String>(
                      //     value: 'settings',
                      //     child: Text(entryLevelName ?? ''),
                      //     onTap: () => ()),
                      PopupMenuItem<String>(
                        value: 'logout',
                        child: Text('Logout'),
                        onTap: () {
                          DataLoginController.removeDataUser();

                          // loginModel.setLogin(false);

                          context.go(RoutesConstant.login);

                          Fluttertoast.showToast(
                            msg: "Anda telah Logout", // message
                            toastLength: Toast.LENGTH_LONG, // length
                            gravity: ToastGravity.CENTER, // location
                            webPosition: "center",
                            webBgColor:
                                "linear-gradient(to right, #00FF00, #00FF00)",
                            timeInSecForIosWeb: 2, // duration
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
