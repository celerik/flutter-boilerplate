// @packages
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

// @scripts
import 'package:flutter_boilerplate/screens/home_page/home_page.dart';
import 'package:flutter_boilerplate/screens/login_page/login_page.dart';

class Root extends StatefulWidget {
  const Root({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Root();
}

class _Root extends State<Root> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();

    Amplify.Auth.getCurrentUser().then((value) {
      if (value.userId.isNotEmpty && value.username.isNotEmpty) {
        setState(() => isLoggedIn = true);
      } else {
        setState(() => isLoggedIn = false);
      }
    }).catchError((_) {
      setState(() => isLoggedIn = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? HomePage() : LoginPage();
  }
}
