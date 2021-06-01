// @packages
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_boilerplate/screens/home_page/home_page.dart';
import 'package:flutter_boilerplate/screens/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() => isLoggedIn = false);
      } else {
        setState(() => isLoggedIn = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomePage() : LoginPage();
  }
}
