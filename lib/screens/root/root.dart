// @packages
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';

// @scripts
import 'package:flutter_boilerplate/screens/home_page/home_page.dart';
import 'package:flutter_boilerplate/screens/login_page/login_page.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Root();
}

class _Root extends State<Root> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    final email = SharedPrefs().getValueFromKey('email');

    if (email != null) {
      setState(() => isLoggedIn = true);
    } else {
      setState(() => isLoggedIn = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomePage() : LoginPage();
  }
}
