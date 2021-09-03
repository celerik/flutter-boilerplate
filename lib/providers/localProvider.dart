import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale() {
    notifyListeners();
  }
}
