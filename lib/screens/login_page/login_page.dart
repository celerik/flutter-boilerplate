import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/business_logic/services/cognito_service.dart';
import 'package:flutter_boilerplate/business_logic/services/shared_preferences.dart';
import 'package:flutter_boilerplate/business_logic/utils/functions.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/CustomHeader.dart';

import 'package:flutter_boilerplate/screens/utils/commonWidgets/blueButton.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/custom_input.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/labels.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/logo.dart';
import 'package:flutter_boilerplate/screens/utils/commonWidgets/snack_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: CustomPaint(
              painter: HeaderPainter(),
              child: Container(
                height: size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Logo(),
                    _Form(),
                    Labels(
                      path: '/signUp',
                      title: S.of(context).do_not_have_account,
                      subheading: S.of(context).sign_up,
                    ),
                    Text(
                      S.of(context).terms_and_conditions,
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formLoginKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: _formLoginKey,
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.mail_outline,
              placeholder: S.of(context).email,
              keyboardType: TextInputType.emailAddress,
              textController: _usernameController,
            ),
            CustomInput(
              icon: Icons.lock_outline,
              placeholder: S.of(context).password,
              textController: _passwordController,
              isPassword: true,
            ),
            BlueButton(
              sizeWidth: size.width,
              text: S.of(context).login,
              onPressed: _login,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/forgotPassword');
              },
              child: Text(
                S.of(context).recover_password,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    final email = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    _formLoginKey.currentState!.validate();

    if (checkTextControllers([password, email])) {
      final cognitoUser = CognitoUser(email, userPool);
      final authDetails = AuthenticationDetails(
        username: email,
        password: password,
      );

      try {
        await cognitoUser.authenticateUser(authDetails);
        await SharedPrefs().setValueAndKey('email', email);
        await Navigator.pushReplacementNamed(context, '/');
      } catch (e) {
        showSnackBar(context, e.toString(), 'error');
      }
    }
  }
}
