import 'package:argonovo/config/colors/colors.dart';
import 'package:flutter/material.dart';

enum SnackBarType { success, warning, error }

void showSnackBar(BuildContext context, String text, SnackBarType type) {
  Color _snackBarBackgroundColor;

  switch (type) {
    case SnackBarType.success:
      _snackBarBackgroundColor = CustomColors.successSnackBar;
      break;
    case SnackBarType.warning:
      _snackBarBackgroundColor = CustomColors.warningSnackBar;
      break;
    case SnackBarType.error:
      _snackBarBackgroundColor = CustomColors.errorSnackBar;
  }

  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        content: Text(text, style: TextStyle(color: CustomColors.white)),
        elevation: 10,
        backgroundColor: _snackBarBackgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
}
