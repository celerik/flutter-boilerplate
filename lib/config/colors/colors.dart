// @packages
import 'package:flutter/material.dart';

class CustomColors {
  final Color _white = const Color(0xffffffff);
  final Color _black = Colors.black;
  final Color _background = Colors.white;
  final Color _colorBackground = const Color(0xffEF5D22);
  final Color _error = Colors.red;
  final Color _success = const Color(0xff68D194);
  final Color _inputBackground = Colors.white;
  final Color _inputBorder = const Color(0xff2D3643);
  final Color _inputLabel = const Color(0xff5B6571);
  final Color _appBar = const Color(0xff565D6B);
  final Color _warning = Colors.amberAccent;

  Color get black => _black;
  Color get success => _success;
  Color get appBar => _appBar;
  Color get inputBackground => _inputBackground;
  Color get inputBorder => _inputBorder;
  Color get inputLabel => _inputLabel;
  Color get error => _error;
  Color get white => _white;
  Color get background => _background;
  Color get colorBackground => _colorBackground;
  Color get warning => _warning;
}