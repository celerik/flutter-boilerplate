import 'dart:async';

import 'package:argonovo/generated/l10n.dart';
import 'package:argonovo/pages/utils/common_widgets/snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityService {
  StreamController<ConnectivityResult> connectionStatusController = StreamController<ConnectivityResult>();

  ConnectivityService(BuildContext context) {
    final text = S.of(context);
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(result);

      if (result == ConnectivityResult.none) {
        showSnackBar(context, text.no_internet, SnackBarType.warning);
      }
    });
  }
}
