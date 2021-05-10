// @packages
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_boilerplate/config/colors/colors.dart';

class CustomTheme {
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: CustomColors().background,
      scaffoldBackgroundColor: CustomColors().white,
      hintColor: CustomColors().white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColors().colorBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      )
    );
  }
}