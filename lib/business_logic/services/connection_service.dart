// @packages
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

// @scripts
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class ConnectivityService {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  ConnectivityService(BuildContext context) {
    final text = S.of(context);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);

      if (result == ConnectivityResult.none) {
        showSnackBar(context, text!.no_internet, 'warning');
      }
    });
  }
}
