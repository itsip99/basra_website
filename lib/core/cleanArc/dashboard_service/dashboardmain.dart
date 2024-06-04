import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:stsj/core/controller/Login_controller.dart';
import 'package:stsj/global/globalVar.dart';
import 'package:stsj/router/router_const.dart';

class DashboardServiceMain extends StatefulWidget {
  const DashboardServiceMain({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  State<DashboardServiceMain> createState() => _DashboardServiceMainState();
}

class _DashboardServiceMainState extends State<DashboardServiceMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //preferredSize: const Size.fromHeight(50),
          centerTitle: true, // this is all you need
          backgroundColor: const Color(0xFF9EDDFF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
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
        ),
        body: widget.child);
  }
}
