import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:stsj/core/controller/Login_controller.dart';
import 'package:stsj/core/models/AuthModel/Auth_Model.dart';
import 'package:stsj/core/models/AuthModel/DataAuth.dart';

import 'package:stsj/router/router_const.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  static const String route = '/login'; // Define the route name

  // static var versi = "";

  // static List<DataPrivilege> listdataprivilege = [];

  // static bool CekLoadPrivilege = false;

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final formKey = GlobalKey<FormState>();

  final idController = TextEditingController();
  final passwordController = TextEditingController();

  // late Function handle;
  // String release = "";

  bool _passwordVisible = false; // Initialize _passwordVisible as a hook

  bool isloading = false;
  int statuslogin = 0;
  bool canEntered = false;

  bool _onKey(KeyEvent event) {
    final key = event.logicalKey;

    if (event is KeyDownEvent && key == LogicalKeyboardKey.enter) {
      loginHandler(context);
    }

    return false;
  }

  void loginHandler(BuildContext context) async {
    // print("LoginHanlder");
    // set laodng

    setState(() {
      statuslogin = 1;
      isloading = true;
    });

    try {
      List<DataLogin> listdatalogin = await DataLoginController.login(
          idController.text, passwordController.text);

      if (listdatalogin.isNotEmpty &&
          listdatalogin[0].memo == "LOGIN BERHASIL") {
        // Login was successful
        await DataLoginController.setIntoSharedPreferences(
          listdatalogin[0].userID,
          listdatalogin[0].entryLevelID,
          listdatalogin[0].entryLevelName,
        );

        Auth.saveDataToSharedPreferences(listdatalogin[0].dataDT);

        canEntered = true;

        if (canEntered) {
          setState(() {
            isloading = false;
          });

          // loginModel.setUser([
          //   listdatalogin[0].userID,
          //   listdatalogin[0].entryLevelID,
          //   listdatalogin[0].entryLevelName,
          // ]);

          context.replaceNamed(RoutesConstant.homepage);
        }
      } else {
        // login failure
        setState(() {
          canEntered = false;
          isloading = false;
          statuslogin = -1;
        });

        Fluttertoast.showToast(
            msg: "Invalid Credential", // message
            toastLength: Toast.LENGTH_LONG, // length
            gravity: ToastGravity.CENTER, // location
            webPosition: "center",
            webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
            timeInSecForIosWeb: 2 // duration
            );
      }

      debugPrint('loginData: $listdatalogin');
    } catch (error) {
      Fluttertoast.showToast(
          msg: "$error", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
          timeInSecForIosWeb: 2 // duration
          );
      setState(() {
        statuslogin = -1;
        isloading = false;
      });

      Fluttertoast.showToast(
          msg: "$error", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
          webPosition: "center",
          webBgColor: "linear-gradient(to right, #dc1c13, #dc1c13)",
          timeInSecForIosWeb: 2 // duration
          );

      debugPrint('loginData: $error');
    }
  }

  @override
  void initState() {
    super.initState();

    ServicesBinding.instance.keyboard.addHandler(_onKey);
  }

  @override
  Widget build(BuildContext context) {
    /// login handler
    // final loginModel = context.read<UserIDmodel>();

    return Scaffold(
      body: Center(
        child: SpGrid(alignment: WrapAlignment.center, children: [
          SpGridItem(
            xs: 12,
            md: 4,
            sm: 12,
            lg: 4,
            child: Container(
              height: 550,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Warna bayangan
                    spreadRadius: 5, // Menyebar lebar bayangan
                    blurRadius: 7, // Blur bayangan
                    offset: Offset(0, 3), // Offset bayangan
                  ),
                ],
              ),
              padding: EdgeInsets.all(25),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            height: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/stsj.png'),
                              ),
                            ),
                          ),
                          // const Text(
                          //   'UserID',
                          //   style: TextStyle(
                          //     fontSize: 16.0,
                          //   ),
                          // ),
                          SizedBox(height: 5.0),
                          TextFormField(
                            controller: idController,
                            inputFormatters: [UppercaseTextInputFormatter()],
                            decoration: InputDecoration(
                                filled: true, //<-- SEE HERE
                                fillColor: Colors.white70,
                                labelText: "UserName", //babel text
                                hintText: 'Masukan username perusahaan'

                                // border: OutlineInputBorder(),
                                ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter userid';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.0),
                          // const Text(
                          //   'Password',
                          //   style: TextStyle(
                          //     fontSize: 16.0,
                          //   ),
                          // ),
                          SizedBox(height: 5.0),
                          TextFormField(
                            inputFormatters: [UppercaseTextInputFormatter()],
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              labelText: "Password", //babel text
                              hintText: 'Masukan password perusahaan',

                              filled: true, //<-- SEE HERE
                              fillColor: Colors.white70,
                              // border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: Duration(
                          milliseconds: 500), // Set the animation duration
                      child: isloading
                          ? FadeTransition(
                              opacity: Tween<double>(begin: 0, end: 1)
                                  .animate(CurvedAnimation(
                                parent: AlwaysStoppedAnimation<double>(1),
                                curve: Curves.easeInOut,
                              )),
                              child: CircularProgressIndicator(
                                backgroundColor:
                                    Color.fromARGB(255, 4, 101, 237),
                                strokeWidth: 10,
                              ),
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20)),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColorLight),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  loginHandler(context);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.login, color: Colors.black),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Login',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.095,
                      child: Center(
                          child: Text(
                        statuslogin == 0
                            ? ""
                            : statuslogin == 1
                                ? "Loading..."
                                : "",
                        style: TextStyle(
                            fontFamily: "fontdashboard",
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 14),
                      )),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class UppercaseTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
