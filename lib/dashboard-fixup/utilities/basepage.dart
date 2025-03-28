import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stsj/dashboard-fixup/widgets/error_view.dart';

mixin BasePage {
  bool loading = false;
  bool error = false;
  String txtError = '';

  Widget startUpPage({required Widget child, Function()? onRefresh}) {
    return loading
        ? const SpinKitFadingCube(color: Colors.orange, size: 35)
        : error
            ? ErrorView(txtError, onRefresh ?? () {})
            : child;
  }
}
