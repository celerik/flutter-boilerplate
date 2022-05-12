import 'package:argonovo/main.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

mixin UiCommonFunctionsMixin {
  void showLoaderScreen(BuildContext context) {
    if (!context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }
  }

  void hideLoaderScreen(BuildContext context) {
    if (Argonovo.mtAppKey.currentContext?.loaderOverlay.visible ?? false) {
      Argonovo.mtAppKey.currentContext?.loaderOverlay.hide();
    }
  }
}
