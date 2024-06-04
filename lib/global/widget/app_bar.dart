// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stsj/core/controller/Login_controller.dart';
import 'package:stsj/global/globalVar.dart';
import 'package:stsj/router/router_const.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
    this.goBack,
  }) : super(key: key);

  final String? goBack;

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

    return AppBar(
      centerTitle: true, // this is all you need
      backgroundColor: const Color(0xFF9EDDFF),
      leading:
          router != RoutesConstant.homepage && router != RoutesConstant.report
              ? IconButton(
                  icon: Icon(Icons.arrow_back), // Icon panah kembali
                  onPressed: () {
                    context.goNamed(widget.goBack!);
                  },
                )
              : null,
      title: Image.asset(
        'assets/images/stsj.png',
        width: 50,
      ),
      actions: [
        Container(
          child: Text(
            GlobalVar.username,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          margin: EdgeInsets.only(right: 5),
          child: Stack(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'), // Gambar profil
                radius: 20,
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
                              timeInSecForIosWeb: 2 // duration
                              );
                        }),
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
