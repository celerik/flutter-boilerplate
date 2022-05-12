//ignore_for_file: prefer_mixin

import 'package:argonovo/config/colors/colors.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
        fontFamily: 'Nunito',
        primaryColor: CustomColors.background,
        scaffoldBackgroundColor: CustomColors.white,
        hintColor: CustomColors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: CustomColors.colorBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ));
  }
}
